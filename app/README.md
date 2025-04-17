# SimpleTimeService

This is a simple Flask-based microservice that returns the current time (in IST) and the visitor's IP address in JSON format.

## Application Details
- **Language**: Python (Flask)
- **Port**: 5000 (default)
- **Response Format**: JSON
- **Endpoint**: `/`
  
  **Response Structure**:
  ```json
  {
    "timestamp": "<current date and time>",
    "ip": "<visitor's IP address>"
  }

## Prerequisites
- **[Docker Engine](https://docs.docker.com/engine/install/)**

## Getting Started
- **Clone the GitHub Repo:**
  ```bash
  git clone https://github.com/NihalSatbhai/devops-challenge-senior.git

- **Go to the app directory:**
  ```bash
  cd devops-challenge-senior/app/

- **Build the docker image:**
  ```bash
  docker build -t simple-time-service:latest .

- **Run the container:**
  ```bash
  docker run -d -p 5000:5000 --name simple-time-service simple-time-service:latest

- **Visit http://localhost:5000**

## Notes
- **If you cannot access http://localhost:5000, try http://127.0.0.1:5000. There might be no entry for 'localhost' in your local DNS configuration.**

- **If you do not wish to build the image locally using the Dockerfile, you can use the prebuilt image available on Docker Hub. To do so, simply pull the image and run the `docker run` command as mentioned above.**
  ```bash
  docker pull nihalsatbhai/simple-time-service:latest
  docker run -d -p 5000:5000 --name simple-time-service simple-time-service:latest

- **If you face an issue like "port already in use," the default port (5000) might be occupied by another process. Try running the container on a different port. For example:**
  ```bash
  docker run -d -p 5001:5000 --name simple-time-service simple-time-service:latest
