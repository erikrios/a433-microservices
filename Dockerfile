# Pull image from node:14
FROM node:14

# Use /app for working directory
WORKDIR /app

# Copy all project files and directories into container (files & directories in .dockerignore are excluded)
COPY . .

# Set the NODE_ENV environment variable into production
ENV NODE_ENV=production

# Set the DB_HOST environment variable into item-db
ENV DB_HOST=item-db

# Install necessary dependency and build the apps
RUN npm install --production --unsafe-perm && npm run build

# Apps run in port 8080
EXPOSE 8080

# Run 'npm start' when the container is launched
CMD [ "npm", "start" ]
