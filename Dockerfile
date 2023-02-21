FROM python:3.9-slim

RUN apt-get update && apt-get -y install \
    build-essential libpq-dev wget

WORKDIR /opt
COPY . .

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install --upgrade numpy
RUN pip install --upgrade scikit-learn

EXPOSE 8501
ENV PORT 8501

ENTRYPOINT ["streamlit", "run", "penguins-app.py"]
