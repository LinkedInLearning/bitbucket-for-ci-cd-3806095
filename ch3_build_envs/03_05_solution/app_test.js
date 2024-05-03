const { expect } = require('chai');
const { connectToDB, createTable, insertTask } = require('./app');

describe('TestDatabase', () => {
    let client;

    before(() => {
        client = connectToDB();
    });

    after(() => {
        client.end();
    });

    it('should connect to the database', async () => {
        expect(client).to.not.be.null;
    });

    it('should create table', async () => {
        await createTable(client);
        const res = await client.query("SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tasks');");
        expect(res.rows[0].exists).to.be.true;
    });

    it('should insert a task', async () => {
        const taskDescription = 'Learn more about using Bitbucket Pipelines for CI/CD';
        await insertTask(client, taskDescription);
        const res = await client.query('SELECT description FROM tasks WHERE description = $1', [taskDescription]);
        expect(res.rows.length).to.equal(1);
        expect(res.rows[0].description).to.equal(taskDescription);
    });
});
