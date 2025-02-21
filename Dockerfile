# Stage 1: Build stage
FROM python:3.11-slim AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Stage 2: Final stage (distroless runtime)
FROM gcr.io/distroless/python3-debian11

# Copy installed dependencies and app code from builder stage
COPY --from=builder /app /app

# Set working directory
WORKDIR /app

# Command to run the app
CMD ["/usr/bin/python3", "main.py"]

