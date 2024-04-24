# 01_07 Solution: Create a Pipeline

## Challenge Scenario

Are you ready to apply what you've learned so far? I hope so because it's time for a challenge! 😀

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

        1. Include integration steps that run at the same time.
        1. Add pipeline sections that collect all steps for deployments to staging and production environments.
        1. Remove any settings that would require someone to take action for a deployment.

    1. For feature branches:

        1. Run integration steps at the same time
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

    TODO: Add the YAML configuration inline

### Create Branches to Validate the Pipeline Configuration

1. Validate the pipeline configuration for the `main` branch.

    TODO: Add image for `main` pipeline

1. Create a feature branch and validate the pipeline configuation.

    TODO: Add image for `feature/*` pipeline

1. Create an arbitrarily named branch and validate the pipeline configuration

    TODO: Add image for the `default` pipeline


