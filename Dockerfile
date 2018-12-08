# Copyright (c) 2018, Instituto Tecnológico de Aeronáutica - Divisão de Ciência da Computação
# Copyright (c) 2018, IPython Development Team
# Copyright (c) 2018, Jupyter Development Team
#
# All rights reserved.
# Distributed under the terms of the Modified BSD License (BSD 3-Clause License).
#

FROM jupyter/datascience-notebook

LABEL maintainer="Vitor Curtis <curtis@ita.br>"

ENV CHROME_VER=$(curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
ENV FIREFOX_VER=$(curl --silent https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD



USER root

# Chrome and Firefox browsers
RUN apt-get update && \
	apt-get install -y gnupg && \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && apt-get install -y google-chrome-stable firefox



USER $NB_UID

# Selenium
RUN pip install selenium

# Chrome driver
RUN wget -q https://chromedriver.storage.googleapis.com/${CHROME_VER}/chromedriver_linux64.zip && \
	unzip -o chromedriver_linux64.zip && \
	rm chromedriver_linux64.zip && \
	mv chromedriver /opt/conda/bin

# Firefox driver
RUN wget -qO- https://github.com/mozilla/geckodriver/releases/download/v${FIREFOX_VER}/geckodriver-v${FIREFOX_VER}-linux64.tar.gz | tar -xvz -C /opt/conda/bin



EXPOSE 4444
