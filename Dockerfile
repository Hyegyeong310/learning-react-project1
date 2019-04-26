
FROM ubuntu
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9.1

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
# ↑↑↑ docker에 nvm install ↑↑↑

# RUN mkdir /usr/src/app
# WORKDIR /usr/src/app

# RUN npm install -g create-react-app
# RUN create-react-app hello-react
# WORKDIR /usr/src/app/hello-react

# ENV PATH /usr/src/app/hello-react/node_modules/ .bin:$PATH

# COPY package.json /usr/src/app/hello-react/package.json
# RUN npm install --silent

# CMD [ "yarn", "start" ]
