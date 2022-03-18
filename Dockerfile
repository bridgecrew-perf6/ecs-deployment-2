FROM node

RUN apt-get update && apt-get install git

RUN git clone https://github.com/nodejs/nodejs.org
WORKDIR ./nodejs.org
RUN npm install

CMD npm start

EXPOSE 8080