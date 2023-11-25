# Use Python 3.9 slim image as the base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /dbt

# Install dbt
RUN pip install dbt-snowflake

# Copy the DBT project into the container
COPY . .

# Install DBT dependencies
RUN dbt deps

# Set an environment variable to specify the profiles directory
ENV DBT_PROFILES_DIR /dbt

# Run dbt commands
# Using a shell form to run multiple commands
# CMD dbt run && dbt test
CMD ["dbt", "run"]