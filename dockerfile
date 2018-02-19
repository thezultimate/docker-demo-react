# DOCKER MULTI-STAGE BUILD

# STAGE 1: build environment
# Set up everything we need to build the app, and then build it.
# The result will be an artifact in the /usr/src/app/build folder.
FROM node:7.10 as build-steps
WORKDIR /usr/src/app
# Load dependencies first so that Docker will cache them
COPY package.json yarn.lock ./
RUN yarn
# Then copy everything else. Be aware that while copying everything is easy it can also balloon the image size.
# Use .dockerignore to keep image size sane.
COPY . ./
RUN yarn build

# STAGE 2: hosting environment
# Set up everything we need to run the app, and copy the artifact from the build environment.
# The result will be the smallest image possible for running the app as everything not copied will be discarded.
# NB!
# _The configuration of nginx as shown here is for demo purpose only_
# Please adjust as needed for production.
FROM nginx:1.12-alpine
COPY --from=build-steps /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
