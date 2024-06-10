# if this file doesn't execute, run this command: chmod +x start.sh

if [ ! -d "/mf-app-react-host"]; then
    echo "Cloning host"
    git clone git@github.com:dmifsud/mf-app-react-host.git
fi

if [ ! -d "/mf-app-react-remote"]; then
    git clone git@github.com:dmifsud/mf-app-react-remote.git
fi

if [ ! -d "/mf-app-store"]; then
    git clone git@github.com:dmifsud/mf-app-store.git
fi

# TODO: remove feat-docker checkout
# build store first
cd mf-app-store && git checkout feat-docker && rm -rf node_modules && yarn && yarn build:types
# build remote second
cd ../mf-app-react-remote && git checkout feat-docker && rm -rf node_modules && yarn && yarn build:types

cd .. 

# start the dependency remote module federation apps running on docker
docker-compose up -d

# build host locally
cd mf-app-react-host && git checkout feat-docker && rm -rf node_modules && yarn
echo "Installation Complete! Run:"
echo "> cd mf-app-react-host"
echo "> yarn dev or npm run dev"

