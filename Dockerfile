# Use official Python runtime
FROM python:3.9

# Install Flask
RUN pip install flask

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Create a small web server inside the container
RUN echo "from flask import Flask\n\
import os\n\
app = Flask(__name__)\n\
@app.route('/')\n\
def hello():\n\
    return 'Hello World from GCP Cloud Run!'\n\
if __name__ == '__main__':\n\
    port = int(os.environ.get('PORT', 8080))\n\
    app.run(host='0.0.0.0', port=port)" > app.py

# Expose port 8080
EXPOSE 8080

# Run Flask application
CMD ["python", "app.py"]
