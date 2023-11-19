# Use Python 3.9 slim image as the base image
FROM python:3.9-slim

# Install dbt
RUN pip install dbt-snowflake

# Set the working directory in the container
WORKDIR /dbt

# Copy the DBT project into the container
COPY . /dbt

# Run dbt commands
# Using a shell form to run multiple commands
CMD dbt run && dbt test
