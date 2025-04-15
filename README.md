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