require 'pg'  # Assuming you'll use the `pg` gem for PostgreSQL connection

def connect_to_db
  # Connects to the database using environment variables or default values

  host = ENV['DB_HOST'] || 'localhost'
  database = ENV['DB_NAME'] || 'testing'
  user = ENV['DB_USER'] || 'testing'
  password = ENV['DB_PASSWORD'] || 'testing'

  begin
    connection = PG::Connection.new(host: host, dbname: database, user: user, password: password)
    return connection
  rescue PG::Error => e
    puts "Error connecting to database: #{e}"
    return nil
  end
end

def create_table(connection)
  connection.exec("CREATE TABLE IF NOT EXISTS tasks (id SERIAL PRIMARY KEY, description TEXT NOT NULL);")
end

def insert_task(connection, description)
  connection.exec("INSERT INTO tasks (description) VALUES ($1)", description)
end

def main
  connection = connect_to_db
  if connection
    create_table(connection)
    insert_task(connection, "Learn more about Bitbucket Pipelines for CI/CD")
    connection.close
    puts "Task added successfully!"
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end

