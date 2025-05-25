Here are the most common and recommended ways to securely handle your database credentials in Python, along with how to integrate them with `pymysql` and Pandas:

## Best Practices for Hiding Credentials

The core idea is to keep your sensitive information (username, password, host, database name) separate from your main code.

### 1. Environment Variables (Recommended for Production)

This is a very common and robust method. You set environment variables on your system, and your Python script reads them. This is especially useful for deployment environments (servers, cloud platforms) as it allows you to configure credentials without changing your code.

**How to implement:**

1.  **Set Environment Variables:**
    * **Linux/macOS:**
        ```bash
        export DB_HOST="your_mysql_host"
        export DB_USER="your_mysql_user"
        export DB_PASSWORD="your_mysql_password"
        export DB_NAME="your_mysql_database"
        ```
        You'd typically add these to your `~/.bashrc`, `~/.zshrc`, or equivalent file so they persist across sessions, or set them directly in your deployment environment's configuration.
    * **Windows (Command Prompt):**
        ```cmd
        set DB_HOST="your_mysql_host"
        set DB_USER="your_mysql_user"
        set DB_PASSWORD="your_mysql_password"
        set DB_NAME="your_mysql_database"
        ```
        For persistent variables, you'd set them via "System Properties" -> "Environment Variables".
    * **Windows (PowerShell):**
        ```powershell
        $env:DB_HOST="your_mysql_host"
        $env:DB_USER="your_mysql_user"
        $env:DB_PASSWORD="your_mysql_password"
        $env:DB_NAME="your_mysql_database"
        ```

2.  **Read in Python:**
    ```python
    import os
    import pymysql
    import pandas as pd

    try:
        db_host = os.getenv("DB_HOST")
        db_user = os.getenv("DB_USER")
        db_password = os.getenv("DB_PASSWORD")
        db_name = os.getenv("DB_NAME")

        if not all([db_host, db_user, db_password, db_name]):
            raise ValueError("Database environment variables not set. Please set DB_HOST, DB_USER, DB_PASSWORD, and DB_NAME.")

        conn = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_password,
            database=db_name
        )

        query = "SELECT * FROM your_table;"
        df = pd.read_sql(query, conn)

        print(df.head())

    except ValueError as e:
        print(f"Error: {e}")
    except pymysql.Error as e:
        print(f"Database error: {e}")
    finally:
        if 'conn' in locals() and conn.open:
            conn.close()
    ```

### 2. `.env` file with `python-dotenv` (Recommended for Local Development)

For local development, manually setting environment variables can be cumbersome. The `python-dotenv` library allows you to define environment variables in a `.env` file, which your script can then load. This file should **never** be committed to version control (e.g., Git).

**How to implement:**

1.  **Install `python-dotenv`:**
    ```bash
    pip install python-dotenv pymysql pandas
    ```

2.  **Create a `.env` file:** In the root directory of your project, create a file named `.env` and add your credentials:
    ```
    DB_HOST=your_mysql_host
    DB_USER=your_mysql_user
    DB_PASSWORD=your_mysql_password
    DB_NAME=your_mysql_database
    ```
    **Important:** Add `.env` to your `.gitignore` file!
    ```
    # .gitignore
    .env
    ```

3.  **Read in Python:**
    ```python
    import os
    import pymysql
    import pandas as pd
    from dotenv import load_dotenv

    # Load environment variables from .env file
    load_dotenv()

    try:
        db_host = os.getenv("DB_HOST")
        db_user = os.getenv("DB_USER")
        db_password = os.getenv("DB_PASSWORD")
        db_name = os.getenv("DB_NAME")

        if not all([db_host, db_user, db_password, db_name]):
            raise ValueError("Database environment variables not set in .env file. Please check your .env file.")

        conn = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_password,
            database=db_name
        )

        query = "SELECT * FROM your_table;"
        df = pd.read_sql(query, conn)

        print(df.head())

    except ValueError as e:
        print(f"Error: {e}")
    except pymysql.Error as e:
        print(f"Database error: {e}")
    finally:
        if 'conn' in locals() and conn.open:
            conn.close()
    ```

### 3. Configuration File (e.g., JSON, YAML, INI)

You can store credentials in a separate configuration file (e.g., `config.json`, `config.yaml`, `config.ini`). This file should also **not** be committed to version control and its permissions should be restricted.

**Example with JSON:**

1.  **Create `config.json`:**
    ```json
    {
        "database": {
            "host": "your_mysql_host",
            "user": "your_mysql_user",
            "password": "your_mysql_password",
            "database": "your_mysql_database"
        }
    }
    ```
    **Important:** Add `config.json` (or whatever you name it) to your `.gitignore` file!

2.  **Read in Python:**
    ```python
    import json
    import pymysql
    import pandas as pd

    try:
        with open('config.json', 'r') as f:
            config = json.load(f)

        db_config = config['database']

        conn = pymysql.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )

        query = "SELECT * FROM your_table;"
        df = pd.read_sql(query, conn)

        print(df.head())

    except FileNotFoundError:
        print("Error: config.json not found. Please create one with your database credentials.")
    except KeyError as e:
        print(f"Error: Missing key in config.json: {e}. Please check your config file.")
    except pymysql.Error as e:
        print(f"Database error: {e}")
    finally:
        if 'conn' in locals() and conn.open:
            conn.close()
    ```

### 4. `keyring` library (Platform-Specific Secure Storage)

The `keyring` library provides a way to store credentials securely using your operating system's native keyring service (e.g., macOS Keychain, Windows Credential Vault, Linux Secret Service). This is generally more secure than file-based methods, especially for interactive applications where you might want to store credentials once and retrieve them later without prompting the user.

**How to implement:**

1.  **Install `keyring`:**
    ```bash
    pip install keyring pymysql pandas
    ```

2.  **Store and Retrieve in Python:**
    ```python
    import keyring
    import pymysql
    import pandas as pd
    import getpass # For securely prompting for password if not already stored

    SERVICE_NAME = "my_mysql_app" # A unique name for your application/service
    USERNAME = "your_mysql_user" # The username you want to store

    try:
        # Try to retrieve the password
        db_password = keyring.get_password(SERVICE_NAME, USERNAME)

        if db_password is None:
            print(f"Password for '{USERNAME}' (service: '{SERVICE_NAME}') not found in keyring.")
            db_password = getpass.getpass(f"Please enter the password for '{USERNAME}': ")
            keyring.set_password(SERVICE_NAME, USERNAME, db_password)
            print("Password stored securely in keyring.")

        # You'll still need host and database name, which can be stored in environment variables or a config file
        # For simplicity, let's assume they are also in keyring or hardcoded for this example,
        # but environment variables are better for host/db_name.
        # Here, let's get them from environment variables as a good practice
        db_host = os.getenv("DB_HOST", "localhost") # Provide a default if not set
        db_name = os.getenv("DB_NAME", "your_mysql_database")

        conn = pymysql.connect(
            host=db_host,
            user=USERNAME,
            password=db_password,
            database=db_name
        )

        query = "SELECT * FROM your_table;"
        df = pd.read_sql(query, conn)

        print(df.head())

    except keyring.errors.NoKeyringError:
        print("Error: No keyring backend found. Please install a suitable backend (e.g., 'keyrings.alt').")
        print("You can try 'pip install keyrings.alt' or use environment variables/config file instead.")
    except pymysql.Error as e:
        print(f"Database error: {e}")
    finally:
        if 'conn' in locals() and conn.open:
            conn.close()

    ```
    **Note:** `keyring` might require additional OS-specific dependencies depending on your system. For example, on Linux, you might need `python-secretstorage` or `gnome-keyring`.

## Summary of Recommendations:

* **Local Development:** Use `.env` files with `python-dotenv`. It's easy to set up and prevents accidental commits of credentials.
* **Production/Deployment:** Use **Environment Variables**. This is the most secure and flexible approach for production systems, as credentials can be managed by the deployment environment (e.g., Docker, Kubernetes, cloud provider services) without being present in your code repository or local files.
* **Interactive Tools/Desktop Apps:** Consider `keyring` for securely storing credentials on the user's system after they enter them once.

Always choose the method that best fits your deployment scenario and security requirements. **Never hardcode your credentials directly in your Python scripts!**
