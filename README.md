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
- **Docker (Recommended for containerized setup)**
- **Python 3.7+ (For local setup, though Docker is recommended for consistency)**

## Getting Started
- **Option 1: Running the Application Using Docker (Recommended)**
1. Pull the docker image:
   docker pull nihalsatbhai/simple-time-service:latest .
2. Run the container:
   docker run -d -p 5000:5000 --name simple-time-service nihalsatbhai/simple-time-service:latest
3. Visit http://localhost:5000