FROM python:alpine
MAINTAINER Gabriel Claudino
WORKDIR /app
ADD https://raw.githubusercontent.com/yesquines/InfraAgil/Docker/app.py /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
ENV APP_HOST 0.0.0.0
ENV APP_PORT 5000
ENV APP_DEBUG true
EXPOSE 5000
ENTRYPOINT ["python","app.py"]
CMD ["-d"]
