FROM python:3.13-alpine


# Set environment variables to:
# - prevent .pyc files
# - make stdout/stderr logs appear immediately
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY simple_time_service.py .

# Create a non-root user and switch to it for better security
RUN adduser -D appuser && chown -R appuser /app

USER appuser

EXPOSE 5000

CMD ["python", "simple_time_service.py"]
