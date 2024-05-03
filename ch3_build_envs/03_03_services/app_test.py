import unittest
import psycopg2.errors
from app import connect_to_db, create_table, insert_task


class TestDatabase(unittest.TestCase):

    def test_connection(self):
        connection = connect_to_db()
        self.assertIsNotNone(connection)
        if connection:
            connection.close()

    def test_create_table(self):
        connection = connect_to_db()
        self.assertIsNotNone(connection)
        cursor = connection.cursor()
        try:
            create_table(connection)
            # Check if the table exists (assuming a specific table name)
            cursor.execute(
                "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tasks');"
            )
            exists = cursor.fetchone()[0]
            self.assertTrue(exists)
        except (
            psycopg2.errors.ProgrammingError
        ) as e:  # Handle potential table creation errors
            self.fail(f"Error creating table: {e}")
        finally:
            connection.close()

    def test_insert_task(self):
        connection = connect_to_db()
        self.assertIsNotNone(connection)

        cursor = connection.cursor()
        try:
            task_description = "Learn more about using Bitbucket Pipelines for CI/CD"
            insert_task(connection, task_description)

            cursor.execute(
                "SELECT description FROM tasks WHERE description = %s",
                (task_description,),
            )
            inserted_task = cursor.fetchone()
            self.assertIsNotNone(inserted_task)
            self.assertEqual(
                inserted_task[0], task_description
            )  # Verify inserted description
        except Exception as e:
            self.fail(f"Error inserting task: {e}")
        finally:
            connection.close()


if __name__ == "__main__":
    unittest.main()
