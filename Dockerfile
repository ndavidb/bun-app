# Stage 1: Install dependencies
FROM oven/bun:1 AS install
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

# Stage 2: Production image
FROM oven/bun:1-slim AS release
WORKDIR /app

COPY --from=install /app/node_modules ./node_modules
COPY src ./src
COPY package.json tsconfig.json ./

ENV PORT=8080
EXPOSE 8080

USER bun
CMD ["bun", "run", "src/index.ts"]
