# 03_04_challenge

## Challenge Scenario

In this challenge you’re continuing your role as the Bitbucket Pipelines expert supporting the Amazing Mobile App.

A recently deployed feature allows users to back up their sessions to cloud storage.  The session data is managed by  two microservices;  One microservice is written in Python and the other is written in Ruby.

Both services connect to a cluster of postgres databases where the session data is stored.

Before making any updates to the feature, the development team would like to test both microservices in the same pipeline.

## Challenge Tasks

1. Log into Bitbucket and create a new repository.
1. Create a pipeline using the provided configuration
    [bitbucket-pipelines.yml](./bitbucket-pipelines.yml)
1. Update the pipeline configuration to include a definition for a postgres database service.
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
[← 03_04: Using Pipes](../03_04_pipes/README.md) | [03_05_solution →](../03_06_solution/README.md)
<!-- FooterEnd -->
