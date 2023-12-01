## dbt project with Docker and GitHub Actions

### Project goal

Run dbt project in Docker container and add GitHub Actions for orchestration

### Steps

- Clone GitHub repository
- Build Docker image with command `docker build -t my-dbt-project .`
- Run Docker container `docker run -e SNOWFLAKE_ACCOUNT=<account> -e SNOWFLAKE_USER=<user> -e SNOWFLAKE_PASSWORD=<password> my-dbt-project`
- Commit and Push changes to the remote repository
- GitHub Actions runs "dbt run" for prod
