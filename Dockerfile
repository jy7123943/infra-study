# https://plainenglish.io/blog/step-by-step-guide-to-dockerize-react-app-created-using-vite#step-5-build-the-dockerfile

# 자주 변경되는 부분일수록 아래 Layer에 위치시키는 것이 좋다.

# FROM baseImage : Will create a node environment in the container
FROM node:16-alpine3.11

# Will create a directory app and switch to that directory
WORKDIR /app

# Copies package.json file to /app directory
COPY package*.json ./

# Runs npm ci to create node_modules for your app
RUN npm ci

# Copies the source code to /app directory
COPY . .

# Exposes the port to access the app from outside the container i.e from the browser
EXPOSE 8080

# Executes npm run dev to start the server
ENTRYPOINT ["npm", "run", "dev"]
