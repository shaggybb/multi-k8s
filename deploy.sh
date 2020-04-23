docker build -t shaggybb/multi-docker-client:latest \
             -t shaggybb/multi-docker-client:$GIT_SHA \
             -f ./client/Dockerfile ./client

docker build -t shaggybb/multi-docker-server:latest \
             -t shaggybb/multi-docker-server:$GIT_SHA \
             -f ./server/Dockerfile ./server

docker build -t shaggybb/multi-docker-worker:latest \
             -t shaggybb/multi-docker-worker:$GIT_SHA \
             -f ./worker/Dockerfile ./worker

docker push shaggybb/multi-docker-client:latest
docker push shaggybb/multi-docker-server:latest
docker push shaggybb/multi-docker-worker:latest

docker push shaggybb/multi-docker-client:$GIT_SHA
docker push shaggybb/multi-docker-server:$GIT_SHA
docker push shaggybb/multi-docker-worker:$GIT_SHA

# Deploy kubernetes apps
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=shaggybb/multi-docker-client:$GIT_SHA
kubectl set image deployments/server-deployment server=shaggybb/multi-docker-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=shaggybb/multi-docker-worker:$GIT_SHA