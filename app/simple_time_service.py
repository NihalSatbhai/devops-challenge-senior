from flask import Flask, request, Response
from datetime import datetime
from collections import OrderedDict
import pytz
import json

# Create an instance of the Flask application
app = Flask(__name__)

# Define a route for the root URL "/"
@app.route("/", methods=["GET"])
def get_time_and_ip():
    # Get the IP address of the client making the request
    visitor_ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    
    # Convert to IST
    india_time = datetime.now(pytz.timezone("Asia/Kolkata"))
    formatted_time = india_time.strftime("%Y-%m-%dT%H:%M:%S")

    # Force key order
    response_data = OrderedDict([
        ("timestamp", formatted_time),
        ("ip", visitor_ip)
    ])

    # Manually convert the OrderedDict to a JSON string
    response_json = json.dumps(response_data)

    # Return the response as JSON with proper MIME type
    return Response(response_json, mimetype='application/json')

if __name__ == "__main__":
    # Listen on all interfaces to work inside Docker
    app.run(host="0.0.0.0", port=5000)
