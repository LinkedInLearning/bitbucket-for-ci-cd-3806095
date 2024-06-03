# 02_05 Challenge: Deploy an Artifact

## Challenge Scenario

The dev team is making great progress with the pipeline configuration you created in the previous challenge and the rest of the company is buzzing with interest.  

Now, the plugin team needs help updating their continuous delivery workflow.  Their goal is to share plugins as packages that anyone in the community can download.

## Challenge Tasks

> *NOTE: If you haven't completed the challenge for Chapter 1, review and complete the steps for [01_07 Solution: Create a Pipeline](../../ch1_pipelines/01_07_solution/README.md) before proceeding with this challenge.*
>
> *TLDR? Create the following:*
>
>- *Workspace, Project, Public repository*
>- *Inside the repo create `bitbucket-pipelines.yml`*
>- *Add this code: [bitbucket-pipelines.yml](../../ch1_pipelines/01_07_solution/bitbucket-pipelines.yml)*

1. Log into Bitbucket and locate the repository you created in the previous challenge.
1. Create an access token.
1. Store the access token securely.
1. Update the pipeline configuration to create an artifact in the "Build and Test" step.  The artifact should be named `plugin-##.zip` where `##` is replaced by the current pipeline build number.

    Use the following code snippet:

    ```yaml
    - step: &build_and_test
        name: Build and Test
        script:
          - echo "Your build and test goes here..."
          - zip -r plugin-$BITBUCKET_BUILD_NUMBER.zip .
        artifacts:
          - plugin*.zip
    ```

1. Update the "Production" stage to create a package using the zip file as an artifact.

    Use the following code snippet:

    ```yaml
    - pipe: atlassian/bitbucket-upload-file:0.7.1
      variables:
        BITBUCKET_ACCESS_TOKEN: $BITBUCKET_ACCESS_TOKEN
        FILENAME: '*.zip'
    ```

1. Confirm that the artifact and package are created successfully.
1. Confirm that the package is available to anyone with the repository URL.


<!-- FooterStart -->
---
[← 02_04 Packages](../02_04_packages/README.md) | [02_06 Solution: Deploy an Artifact →](../02_06_solution/README.md)
<!-- FooterEnd -->
