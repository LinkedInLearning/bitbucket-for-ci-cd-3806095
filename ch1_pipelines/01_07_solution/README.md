# 01_07 Solution: Create a Pipeline

## Challenge Scenario

You're part of a software development team working on an open source application: The Amazing Mobile App.

The team is already using Bitbucket for code repositories and now they're ready to start using Bitbucket Pipelines to automate their CI/CD workflows.

You've been assigned to create a sample pipeline definition that the team can reference. It needs to include steps for continuous integration and continuous deployments to multiple environments.

And just to make things interesting, the code needs to be easy to maintain and visualize.

## Challenge Tasks

1. Log into Bitbucket and create a new repository.
1. Create a pipeline definition in the repo using the starter template.
1. Update the template using the following requirements:

    1. Add pipeline start conditions for any commits to the main branch and all feature branches.

    1. For the main branch:

        1. Include build and integration steps that run at the same time.
        1. Add pipeline sections that collect all steps for deployments to staging and production environments.
        1. Remove any settings that would require someone to take action for a deployment.

    1. For feature branches:

        1. Run build and integration steps at the same time
        1. Deploy to the staging environment.

    1. Remove deployments from any other pipeline triggers. These events should only run integration steps.

    1. Make sure the code is easy to maintain by minimizing code duplication wherever you can.

This challenge should take about 15 minutes to complete.

## Solution

### Create a Repository and the Pipeline Template

1. If needed, create a workspace and a project.  Then, create a new repository
1. From the left-side menu, select **Pipelines**

    > *NOTE: If you haven't already set up Two-Factor Authentication (2FA) for your account, you will be prompted to do so.  Follow the steps to set up 2FA and then circle back to the challenge.

1. Select **Create your first pipeline**.
1. Select **Starter pipeline**.
1. Review the starter pipeline template and select **Commit**.
1. From the left-side menu, select **Pipelines**.  Select the running pipeline and wait for it to reach the Production deployment.
1. Select **Deploy** to trigger the Production deployment and wait for the pipeline to complete.

### Update the Pipeline to Match the Requirements

1. View the source for the pipeline configuration.  Select **Edit**.
1. Update the configuration to the following [bitbucket-pipelines.yml](./bitbucket-pipelines.yml) and select **Commit**.

    ```YAML
    image: atlassian/default-image:4

    definitions:
    steps:
        - step: &build_and_test
            name: Build and Test
            script:
            - echo "Your build and test goes here..."

        - step: &lint
            name: Lint
            script:
            - echo "Your linting goes here..."

        - step: &security_scan
            name: Security scan
            script:
            - echo "Your security scan goes here..."

        - step: &deployment_to_staging
            name: Deployment to Staging
            deployment: staging
            script:
            - echo "Your deployment to staging script goes here..."

    pipelines:
    default:
        - parallel:
            - step: *build_and_test
            - step: *lint
            - step: *security_scan

    branches:
        feature/*:
        - parallel:
            - step: *build_and_test
            - step: *lint
            - step: *security_scan

        - step: *deployment_to_staging

        main:
        - parallel:
            - step: *build_and_test
            - step: *lint
            - step: *security_scan

        - stage:
            name: Staging
            steps:
                - step: *deployment_to_staging

        - stage:
            name: Production
            steps:
                - step:
                    name: 'Deployment to Production'
                    deployment: production
                    script:
                    - echo "Your deployment to production script goes here..."
    ```

### Create Branches to Validate the Pipeline Configuration

Create branches using the `bugfix/` and `feature/` prefixes to trigger their corresponding pipelines.

Make changes to the files as needed, commit the changes, create a PR and merge the changes into the `main` branch.

Using the following images to validate the pipeline configuration.

1. Create a bugfix branch and validate the pipeline configuration.

    ![Image for the `default` pipeline](./images/1-01_07-bugfix-pipeline.png)

1. Create a feature branch and validate the pipeline configuration.

    ![Image for `feature/*` pipeline](./images/2-01_07-feature-pipeline.png)

1. Validate the pipeline configuration for the `main` branch.

    ![Image for `main` pipeline](./images/3-01_07-main-pipeline.png)


<!-- FooterStart -->
---
[← 01_06 Challenge: Create a Pipeline](../01_06_challenge/README.md) | [02_01 Using Variables and Secrets →](../../ch2_vars_artifacts/02_01_variables_and_secrets/README.md)
<!-- FooterEnd -->
