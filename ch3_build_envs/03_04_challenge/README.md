# 03_04 Challenge

## Challenge Scenario

In this challenge you’re continuing your role as the Bitbucket Pipelines expert supporting the Amazing Mobile App.

A recently deployed feature allows users to back up their sessions to cloud storage.  The session data is managed by  two microservices;  One microservice is written in Python and the other is written in Ruby.

Both services connect to a cluster of postgres databases where the session data is stored.

Before making any updates to the feature, the development team would like to test both microservices in the same pipeline.

## Challenge Tasks

1. Log into Bitbucket and create a new repository.
1. Create a pipeline using the provided configuration
    [bitbucket-pipelines.yml](./bitbucket-pipelines.yml)
1. Update the pipeline configuration to include a definition for a postgres database service using the following YAML snippet:

    ```YAML
    database:
      image: postgres:14.3
      environment:
        POSTGRES_DB: 'testing'
        POSTGRES_USER: 'testing'
        POSTGRES_PASSWORD: 'testing'
    ```

1. Update the steps in the pipeline to make the database available to any script commands.
1. Update the steps to run the provided test commands for Python and Ruby.  Make sure the steps use the correct execution environment for each programming language.

    - **Python**

        - Execution environment:

            ```bash
            python:3
            ```

        - Test commands:

            ```bash
            pip install psycopg2-binary
            python3 -m unittest --verbose app_test.py
            ```

    - **Ruby**

        - Execution environment:

            ```bash
            ruby:3
            ```

        - Test commands:

            ```bash
            bundle install
            bundle exec ruby app_test.rb
            ```


<!-- FooterStart -->
---
[← 03_03 Services](../03_03_services/README.md) | [03_05 Solution →](../03_05_solution/README.md)
<!-- FooterEnd -->
