# 03_02 Public Images
Atlassian provides default images with some tools installed

Most projects will need additional tools for

- building
- compiling
- deploying

Additional tools can be installed at runtime or another image can be used.

## Installing tools at runtime

Applications can be installed in Ubuntu containers using the Advanced Packaging Tool: `apt-get`.

The following example uses `apt-get` to install the Rust compiler on the default image.

```yaml
image: atlassian/default-image:4
pipelines:
 default:
   - step:
       script:
         - apt-get update
         - apt-get install -y rustc
         - rustc -V
```

Installing tools at runtime is not optimal and should be avoided if possible because:

- Each pipeline step is run in a new docker container
- Additional steps need to reinstall tools
- Multiple installs uses up build minutes

## Using tools in public images

We can specify pre-configured images for the entire pipeline or at the step level.

The following example uses the `rust` image to make the Rust compiler available to the pipeline:

```yaml
image: rust:slim-buster
pipelines:
  default:
    - step:
        script:
          - rustc -V
    - step:
        script:
          - rustc -V
```
## Sources for public images

Pipelines can use public images hosted on:

- [Docker Hub](https://hub.docker.com/)
- [Amazon ECR Public Gallery](https://gallery.ecr.aws/)
- and other popular, publicly available image hosting sites.

## Custom images

Pipeline users can provide their own images provided the following:

- Images Must be accessible via the internet
- Credentials must be provided when needed

## Demonstration

Use the following pipelines to experiment with installing tools in the default image, using a public image, and using public images for different pipeline steps.

- [Install the Rust compiler on the default image](./EXAMPLE_PIPELINE_1/bitbucket-pipelines.yml)
- [Use the Rust compiler from a public image](./EXAMPLE_PIPELINE_2/bitbucket-pipelines.yml)
- [Use public images for different steps](./EXAMPLE_PIPELINE_3/bitbucket-pipelines.yml)

## References

- [Ubuntu Server: Package management](https://ubuntu.com/server/docs/package-management)


<!-- FooterStart -->
---
[← 03_01 Default Images](../03_01_default_images/README.md) | [03_03 Services →](../03_03_services/README.md)
<!-- FooterEnd -->
