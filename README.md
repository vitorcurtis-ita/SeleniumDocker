# Selenium Docker Image
Standalone Selenium from *jupyter/datascience-notebook* Docker image, with Chrome and Firefox drivers and browsers.

Installed drivers for browsers:
- Chrome (latest = 2.44)
- Firefox (latest = 0.23.0)

To check current versions, see: https://selenium-python.readthedocs.io/installation.html#drivers

## Usage
Image is hosted on Docker Hub: *vitorcurtis/selenium*. Use it as a regular *jupyter/\*-notebook*:

```sh
docker run --rm -p 8888:8888 -v %cd%:/home/jovyan/work vitorcurtis/selenium
```
