Node Runtime
============

Use this to get the smallest possible Docker image for running NodeJS applications.

In your Node project, have two files: Dockermake and Dockerfile.
Dockermake should have the following contents:

    FROM node:onbuild

Feel free to specify a more exact version of node (i.e. `node:0.12-onbuild`).

Dockerfile will then contain:

    FROM geowa4/node-runtime
    ADD . /usr/src/app

To use this, run the following commands:

    docker build -f Dockermake -t myproject-builder .
    docker run --rm myproject-builder tar -cf - . | docker build -t myuser/myproject -
    docker run --rm myuser/myproject test
    docker run --rm myuser/myproject

The first command makes an image that is useable, but very large.
The second outputs the WORKDIR as a tar stream which is piped into a Docker build from standard input.
The third runs `npm test` (`npm` is the ENTRYPOINT) in the container to ensure everything is working correctly.
Lastly, run the application (`npm start`).
