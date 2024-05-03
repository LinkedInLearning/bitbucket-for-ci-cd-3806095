const { Client } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

function connectToDB() {
    const client = new Client({
        host: process.env.DB_HOST || 'localhost',
        database: process.env.DB_NAME || 'db',
        user: process.env.DB_USER || 'db',
        password: process.env.DB_PASSWORD || 'testingtesting123',
    });

    client.connect()
        .then(() => console.log('Connected to database'))
        .catch(err => console.error('Error connecting to database', err));

    return client;
}

async function createTable(client) {
    try {
        await client.query(`
            CREATE TABLE IF NOT EXISTS tasks (
                id SERIAL PRIMARY KEY,
                description TEXT NOT NULL
            );
        `);
        console.log('Table created successfully');
    } catch (err) {
        console.error('Error creating table:', err);
    }
}

async function insertTask(client, description) {
    try {
        await client.query('INSERT INTO tasks (description) VALUES ($1)', [description]);
        console.log('Task added successfully');
    } catch (err) {
        console.error('Error inserting task:', err);
    }
}

async function main() {
    const client = connectToDB();
    if (client) {
        await createTable(client);
        await insertTask(client, 'Learn more about Bitbucket Pipelines for CI/CD');
        await client.end();
    }
}

if (require.main === module) {
    main();
}

