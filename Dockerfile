FROM randomninjaatk/radarr-extended:latest

EXPOSE 7878

ARG VERSION
ARG SBRANCH
ARG PACKAGE_VERSION=${VERSION}
ARG PACKAGE_HASH
ENV APP_DIR="/app/radarr"

RUN rm -rf "${APP_DIR}/bin" && \
    mkdir -p "${APP_DIR}/bin"

COPY _artifacts/linux-musl-x64/net6.0/Radarr /app/radarr/bin/

RUN rm -rf "${APP_DIR}/bin/Radarr.Update" && \
    echo -e "PackageVersion=${PACKAGE_VERSION}+${PACKAGE_HASH}\nPackageAuthor=[Draper](https://hub.docker.com/r/drapersniper/radarr)\nUpdateMethod=Docker\nBranch=${SBRANCH}" > "${APP_DIR}/package_info" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" 
    
