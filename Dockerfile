FROM node:20-slim

ARG SITE_PORT
ENV SITE_PORT=$SITE_PORT
ARG NUXT_PUBLIC_SITE_URL
ENV NUXT_PUBLIC_SITE_URL=$NUXT_PUBLIC_SITE_URL

# Install pnpm directly (faster than corepack)
RUN npm install -g bun

WORKDIR /app
COPY package*.json bun.lock ./
RUN node --max-old-space-size=8000
COPY . .

RUN bun install
RUN bun pm trust --all
RUN bun run build

#COPY /app/.output /app/.output
#COPY /app/node_modules /app/node_modules

ENV HOST 0.0.0.0
EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]
#CMD ["pnpm", "start"]
