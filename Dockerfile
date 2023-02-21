ARG PYTHON_VERSION=3.11.1

FROM python:${PYTHON_VERSION}-slim as python
    #ARG PYTHON_VERSION
    #ENV PATH_SITE_PACKAGES=/usr/local/lib/python${PYTHON_VERSION}/site-packages/
    WORKDIR /app/

FROM python as python_dependencies
    COPY ./requirements.txt ./
    RUN pip install -t /site-packages --no-cache-dir -r requirements.txt

FROM ghcr.io/vmware-labs/python-wasm:${PYTHON_VERSION}-latest as wasm
    COPY ./site-packages /site-packages
    #COPY --from=python_dependencies ${PATH_SITE_PACKAGES} ${PATH_SITE_PACKAGES}

    ADD https://raw.githubusercontent.com/vmware-labs/webassembly-language-runtimes/main/python/examples/emojize_text.py .
    ADD https://raw.githubusercontent.com/vmware-labs/webassembly-language-runtimes/main/python/examples/source_text.txt .

    #COPY venv-emoji/ /opt/venv-emoji/
    #COPY emojize_text.py /opt
    #ENV PYTHONPATH /opt/venv-emoji/lib/python3.11/site-packages
    ENV PYTHONPATH=/site-packages
    ENTRYPOINT ["python.wasm", "emojize_text.py"]
    # , "source_text.txt"
