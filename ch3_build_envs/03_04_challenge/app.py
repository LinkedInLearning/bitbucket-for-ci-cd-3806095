import os
import psycopg2


def connect_to_db():
    """Connects to the database using environment variables or default values.

    Returns:
        A psycopg2 connection object on success, None on failure.
    """
    try:
        host = os.getenv("DB_HOST", "localhost")
        database = os.getenv("DB_NAME", "db")
        user = os.getenv("DB_USER", "db")
        password = os.getenv("DB_PASSWORD", "testingtesting123")

        connection = psycopg2.connect(
            host=host, database=database, user=user, password=password
        )
        return connection
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None


def create_table(connection):
    cursor = connection.cursor()
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS tasks (
            id SERIAL PRIMARY KEY,
            description TEXT NOT NULL
        );
    """
    )
    connection.commit()
    cursor.close()


def insert_task(connection, description):
    cursor = connection.cursor()
    cursor.execute("INSERT INTO tasks (description) VALUES (%s)", (description,))
    connection.commit()
    cursor.close()


def main():
    connection = connect_to_db()
    if connection:
        create_table(connection)
        insert_task(connection, "Learn more about Bitbucket Pipelines for CI/CD")
        connection.close()
        print("Task added successfully!")


if __name__ == "__main__":
    main()
