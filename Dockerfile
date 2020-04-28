FROM python:3.7.7-slim-buster

ENV PARAMETERS=./defaults/webapp.cfg

WORKDIR /app

COPY README.md .
COPY setup.cfg .
COPY setup.py .
COPY MANIFEST.in .
COPY .streamlit .streamlit
COPY defaults defaults
COPY src src
COPY st_app.py st_app.py

RUN pip install -q . \
    && echo `export STREAMLIT_SERVER_PORT="$PORT"` >> ~/.bashrc


CMD ["/bin/bash"]
ENTRYPOINT [ "streamlit run st_app.py" ]

