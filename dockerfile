# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev gcc && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port 5000 from the container to the host
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]

