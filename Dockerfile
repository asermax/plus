FROM asermax/node-yarn
MAINTAINER agustin carrasco <asermax@gmail.com>

WORKDIR /opt/app

COPY dist /opt/app/dist
COPY package.json yarn.lock index.js /opt/app/
RUN yarn install --ignore-optional --production && yarn cache clean

EXPOSE 8000

ENTRYPOINT ["yarn"]
CMD ["run", "start:prod"]

