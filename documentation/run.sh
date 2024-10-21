# Run Structurizr Lite

docker pull structurizr/lite
docker run -it --rm -p 8080:8080 -v ./assets:/usr/local/structurizr structurizr/lite
