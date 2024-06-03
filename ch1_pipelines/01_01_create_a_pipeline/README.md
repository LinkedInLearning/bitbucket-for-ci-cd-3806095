# 01_01 Create a Pipeline

- Create a workspace, project, and an empty repository
- Select *Pipelines* from the left-hand menu
- Click *Create your first pipeline*
- Select *Starter Pipeline*.
- Wait for the pipeline to complete
- Review the stages of the pipeline and the output from each stage

    ![The completed pipeline](./images/01_01-Screenshot%202024-05-01%20at%201.44.37%20PM.png)

## SHENANIGANS! :D

## Versions for `default-image`
When this course was initially recorded, the container image used in the Starter Pipeline defaulted to version 3.  However, newer versions are available.  So while the [provided template](./bitbucket-pipelines.yml) may show `atlassian/default-image:3`, you may see different versions used in other pipeline configurations.

To find configuration details, check out the image registry on Docker Hub.

- [Docker Hub: atlassian/default-image](https://hub.docker.com/r/atlassian/default-image/tags)

## References

- [Creating a workspace, project, and repository](https://github.com/LinkedInLearning/learning-bitbucket-3821269/tree/main/ch1_get_started/01_08_solution1#readme)
- [Configure your first pipeline](https://support.atlassian.com/bitbucket-cloud/docs/configure-your-first-pipeline/)
- [Reference file: bitbucket-pipelines.yml](./bitbucket-pipelines.yml)


<!-- FooterStart -->
---
[← 00_04 Understanding Pipeline Limits](../../ch0_intro/00_04_understanding_pipeline_limits/README.md) | [01_02 Bitbucket Configuration Overview →](../01_02_bitbucket_piplines_configuration/README.md)
<!-- FooterEnd -->
