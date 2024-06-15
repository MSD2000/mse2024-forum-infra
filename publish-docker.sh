version="1.0.0-SNAPSHOT"

echo "Publishing v$version"

echo "Removing old dist"
rm -rf ./dist

echo "Building"
npm run build

echo "Removing old images"
docker image remove mse2024-forum-be
docker image remove mse2024-forum-fe

echo "Building new images"
docker build -t mse2024-forum-be:$version
docker build -t mse2024-forum-fe:$version

echo "Publish to Dockerhub"
docker push msd2000/mse2024-forum-be:$version
docker push msd2000/mse2024-forum-fe:$version