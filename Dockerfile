
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

RUN mkdir /apps

SHELL ["/bin/bash", "-c"]
WORKDIR /apps

RUN git clone https://github.com/Hyegyeong310/learning-react-project1.git -o StrictHostKeyChecking=no
WORKDIR /apps/learning-react-project1

RUN npm install
RUN rm package-lock.json

EXPOSE 8000
EXPOSE 5000

CMD [ "npm", "start" ]
# RUN npm i -g npm && npm i -g yarn
# RUN rm yarn.lock
# RUN rm package-lock.json
# RUN yarn 
# RUN yarn build

# ENV HOST 0.0.0.0
# EXPOSE 3000

# CMD [ "yarn", "start" ]