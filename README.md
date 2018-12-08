# SeleniumDocker
Standalone Selenium from *jupyter/datascience-notebook* Docker image, with Chrome and Firefox drivers and browsers.

## Usage
Image is hosted on Docker Hub: *vitorcurtis/selenium*. Use it as a regular *jupyter/\*-notebook*:

```sh
docker run --rm -p 8888:8888 -v %cd%:/home/jovyan/work vitorcurtis/selenium
```
