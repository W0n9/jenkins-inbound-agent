ARG PYTHON_VERSION=3.13
FROM python:${PYTHON_VERSION}-slim AS python-source

FROM jenkins/inbound-agent:3355.v388858a_47b_33-16-jdk21

ARG PYTHON_VERSION=3.13

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libexpat1 \
        libsqlite3-0 \
        libffi8 \
        libncursesw6 \
        liblzma5 \
        libreadline8 \
        libbz2-1.0 \
        libgdbm6 \
        media-types \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=python-source /usr/local/bin/ /usr/local/bin/
COPY --from=python-source /usr/local/lib/ /usr/local/lib/
COPY --from=python-source /usr/local/include/ /usr/local/include/

RUN ldconfig \
    && python3 --version \
    && pip3 --version

USER jenkins

LABEL org.opencontainers.image.description="Jenkins inbound-agent with Python ${PYTHON_VERSION}"
