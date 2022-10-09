set -ex

git submodule update --init --recursive

mkdir -p build

# Build first stage docker
pushd docker-stage1
docker build --rm -f "Dockerfile" -t ug-chromium-builder-stage1:latest ./
popd

# Build second stage docker
docker build --rm -f "Dockerfile-stage2" -t ug-chromium-builder-stage2:latest ./

# start the browser build
docker run -ti -v `pwd`/build:/repo/build:z ug-chromium-builder-stage2:latest bash -c "./build.sh && ./package.sh"

# appimage
docker run -ti -v `pwd`/build:/repo/build:z ug-chromium-builder-stage2:latest bash -c "./package.appimage.sh.ungoogin"
