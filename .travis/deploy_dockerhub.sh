#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
#docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
#docker push $TRAVIS_REPO_SLUG
# $TRAVIS_REPO_SLUG почемуто ровнялся
#.travis/deploy_dockerhub.sh: 8: .travis/deploy_dockerhub.sh: HiMiC/cicd-buzz: not found
#invalid argument "HiMiC/cicd-buzz:latest" for t: invalid reference format: repository name must be lowercase

docker build -f Dockerfile -t $DOCKER_USER/cicd-buzz:latest .
docker push $DOCKER_USER/cicd-buzz