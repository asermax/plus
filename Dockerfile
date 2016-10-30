FROM asermax/node-yarn
MAINTAINER agustin carrasco <asermax@gmail.com>

COPY dist /opt/app/dist
COPY package.json yarn.lock index.js /opt/app/
VOLUME /opt/apt/node_modules

WORKDIR /opt/app
ENV NODE_ENV production
EXPOSE 8000

ENTRYPOINT ["yarn"]
CMD ["run", "start:prod"]

