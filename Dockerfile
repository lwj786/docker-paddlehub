FROM registry.baidubce.com/paddlepaddle/paddle:2.4.2

ARG PP_HUB_VERSION=2.3.1 PIP_OPTIONS="-i https://mirror.baidu.com/pypi/simple"
ENV HUB_HOME="/hub"

RUN set -ex; \
    python -m pip install \
        paddlehub==${PP_HUB_VERSION} \
        ${PIP_OPTIONS}

WORKDIR ${HUB_HOME}
ENTRYPOINT [ "/usr/local/bin/hub" ]
CMD [ "serving", "start", "--config", "config.json" ]
