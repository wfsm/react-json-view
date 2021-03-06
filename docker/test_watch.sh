#!/bin/bash
# runs webpack in react container

NODE_ENV=${1:-local}
echo "Running with NODE_ENV=$NODE_ENV"

# run the workbench container
docker run \
    -v $(pwd)/src:/react/src \
    -v $(pwd)/dev-server:/react/dev-server \
    -v $(pwd)/entrypoints:/react/entrypoints \
    -v $(pwd)/webpack/webpack.config.js:/react/webpack.config.js \
    -v $(pwd)/test:/react/test \
    --rm \
    -e NODE_ENV=$NODE_ENV \
    --entrypoint=/react/entrypoints/test_watch.sh \
    -t react-json-view
