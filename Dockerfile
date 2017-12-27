FROM keymetrics/pm2:8

RUN apk --update add --no-cache openssh-client git make gcc g++ python rsync bash
RUN git config --global user.email "hello@settlemint.io"
RUN git config --global user.name "SettleMint"
COPY . .
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install

CMD [ "pm2-docker", "start", "pm2.json" ]