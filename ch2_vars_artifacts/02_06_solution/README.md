# 02_06 Solution: Deploy an Artifact

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

        zip -r zip -r plugin-$BITBUCKET_BUILD_NUMBER.zip .

1. Update the "Production" stage to create a package using the zip file as an artifact.

    Use the following code snippet:

        - pipe: atlassian/bitbucket-upload-file:0.7.1
          variables:
            BITBUCKET_ACCESS_TOKEN: $BITBUCKET_ACCESS_TOKEN
            FILENAME: '*.zip'

1. Confirm that the artifact and package are created successfully.
1. Confirm that the package is avaiable to anyone with the repository URL.


<!-- FooterStart -->
---
[← 02_05 Challenge: Deploy an Artifact](../02_05_challenge/README.md) | [03_01_default_images →](../../ch3_build_envs/03_01_default_images/README.md)
<!-- FooterEnd -->
