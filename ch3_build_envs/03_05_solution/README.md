# 03_05 Solution

## Challenge Scenario

In this challenge you’re continuing your role as the Bitbucket Pipelines expert supporting the Amazing Mobile App.

A recently deployed feature allows users to back up their sessions to cloud storage.  The session data is managed by  two microservices;  One microservice is written in Python and the other is written in Ruby.

Both services connect to a cluster of postgres databases where the session data is stored.

Before making any updates to the feature, the development team would like to test both microservices in the same pipeline.

## Challenge Tasks

1. Log into Bitbucket and create a new repository.
1. Create a pipeline using the provided [bitbucket-pipelines.yml](../03_04_challenge/bitbucket-pipelines.yml) file.
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

## Solution

1. Create a new repository and add the exercise files.  This is most easily done by:
    1. Downloading the exercise files
    1. Cloning the Bitbucket repo
    1. Moving the files into your Bitbucket repo
    1. Pushing the files up to Bitbucket
1. Edit the pipeline configuration and add a `definitions:` block.
1. Add the provided `database:` block.

    ```YAML
    definitions:
      services:
        database:
          image: postgres:14.3
          environment:
            POSTGRES_DB: 'testing'
            POSTGRES_USER: 'testing'
            POSTGRES_PASSWORD: 'testing'
    ```

1. Add the `database` service to each step using a `service:` block.

    ```YAML
    services:
      - database
    ```

1. Update each step to use the correct image and commands to run tests.

The completed pipeline should be similar to the following: [bitbucket-pipelines.yml](./bitbucket-pipelines.yml)


<!-- FooterStart -->
---
[← 03_04 Challenge](../03_04_challenge/README.md) | [04_01 Next Steps →](../../ch4_conclusion/04_01_next_steps/README.md)
<!-- FooterEnd -->
