build-transfer:
  goreleaser build --clean --snapshot

login-ecr:
  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 417844920390.dkr.ecr.us-east-1.amazonaws.com

build-push-x84-service default_tag='artie-transfer-debug':
    docker buildx build \
        --platform linux/amd64 \
        -t 417844920390.dkr.ecr.us-east-1.amazonaws.com/habitat/artie-transfer/fork:{{ default_tag }} \
        --push \
        -f habitat.dockerfile \
        $(git rev-parse --show-toplevel)