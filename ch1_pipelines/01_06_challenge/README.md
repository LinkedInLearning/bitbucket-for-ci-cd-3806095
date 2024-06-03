# 01_06 Challenge: Create a Pipeline

## Challenge Scenario

You're part of a software development team working on an open source application: The Amazing Mobile App. 

The team is already using Bitbucket for code repositories  and now they're ready to start using Bitbucket Pipelines to automate their CI/CD workflows. 

You've been assigned to create a pipeline configuration to help the team understand the capabilities of Bitbucket Pipelines.  

The configuration needs to include steps for continuous integration and continuous deployments to multiple environments.  

The code also needs to be easy to maintain and visualize.

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


<!-- FooterStart -->
---
[← 01_05 Use YAML Anchors](../01_05_use_yaml_anchors/README.md) | [01_07 Solution: Create a Pipeline →](../01_07_solution/README.md)
<!-- FooterEnd -->
