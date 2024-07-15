


docker buildx build -f ./Dockerfile -t g-gateway-svc:latest .



docker buildx build -f ./infra/services/Dockerfile.Service -t g-gateway-svc:latest --build-arg SVC_DIR=backend/micro-svc/gateway-svc .

docker run -p 8080:8080 g-gateway-svc:latest


docker buildx build -f ./infra/services/Dockerfile.Tool -t g-tools:latest --build-arg SVC_DIR=frontend/tools .

docker run -p 5173:5173 g-tools:latest


docker exec -it d2ce677fea2a /bin/sh


docker login --username=xxx@gmail.com registry-intl.cn-hangzhou.aliyuncs.com

docker login --username=tiancai@5391368636165801 registry-intl.cn-hangzhou.aliyuncs.com

docker tag g-gateway-svc:latest registry-intl.cn-hangzhou.aliyuncs.com/g-services/g-services-repo:g-gateway-svc-20240715.2
docker push registry-intl.cn-hangzhou.aliyuncs.com/g-services/g-services-repo:g-gateway-svc-20240715.2
