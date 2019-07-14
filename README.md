# Sanic Golang Templater

Sanic uses templaters to convert configuration templates defined in various languages into .yaml or .json files, ready to be processed by kubernetes

This specific one uses [golang text templates](https://tip.golang.org/pkg/text/template/)

In general, you should choose the same template language as your webserver or configuration templater, to reduce developer cognitive overhead.

# Usage

1. Build this image: `docker build -t distributedcontainers/templater-golang .`
2. Run this image on the example files: `docker run --rm -v $(pwd)/example/in:/in:ro -v $(pwd)/example/out:/out:rw distributedcontainers/templater-golang`

# Usage for sanic

1. Create some services in dockerfiles
2. Create a deploy/in directory
3. Add deploy/out to your gitignore (i.e., /deploy/out)
4. Make some kubernetes deployment yamls in /deploy/in, with images set to ` {{getenv "REGISTRY_HOST"}}/sanic-site:{{getenv "IMAGE_TAG"}}`, where `sanic-site` should be replaced with the name of your image
5. Run `sanic deploy` to build and `kubectl apply` the templated resources.

## Environment variables
Sanic furnishes your templater with the following variables:
- `SANIC_ENV`, the name of the environment you are currently in
- `PROJECT_DIR`, the directory in which the projects' files are live mounted (only in development)
  - this is useful for live mounting your files using a kubernetes volume, see the example for details.
- `REGISTRY_HOST`, the registry for the current sanic environment
- `IMAGE_TAG`, the tag for the current state of the repository (i.e., if you `sanic build` without specifying a tag, it will match up with this)
