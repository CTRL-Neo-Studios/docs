FROM node:18-alpine

RUN npm install -g bun

ARG SITE_PORT
ENV SITE_PORT=$SITE_PORT
ARG NUXT_PUBLIC_SITE_URL
ENV NUXT_PUBLIC_SITE_URL=$NUXT_PUBLIC_SITE_URL

WORKDIR /app

COPY package*.json ./

RUN bun i

COPY . .

RUN bun run build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
