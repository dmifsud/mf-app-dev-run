# if this file doesn't execute, run this command: chmod +x start.sh


# build store first
cd mf-app-store && rm -rf node_modules && yarn
# build remote second
cd ../mf-app-react-remote && rm -rf node_modules && npm install
# build host third
cd ../mf-app-react-host && rm -rf node_modules && npm install

cd .. 

docker-compose up --build

