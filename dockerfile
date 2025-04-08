# Use an official Python runtime as a base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements (Flask) and install
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy app code
COPY . .

# Run using Gunicorn (production server)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
