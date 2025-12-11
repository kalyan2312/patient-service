<img width="1941" height="1033" alt="image" src="https://github.com/user-attachments/assets/baa77410-a786-47fa-b1ef-edb485598f36" />


Architecture
1. Repositories & Branches
• Two separate GitHub repositories are used for each microservice: patient-service and appointment-service.
• Trunk-based development is followed with main as the deployable branch and short-lived feature/* branches for development.
• This approach ensures faster merges, simplified branch management, and continuous delivery.
2. CI/CD Pipelines (GitHub Actions)
• Each microservice repo has its own CI/CD pipeline:
1. Checkout: Fetch latest code from the repo and branch.
2. Test & Security Scanning: Run unit tests and linting, perform vulnerability scans.
3. Build: Create a Docker image optimized for AWS
Lambda.
4. Push to Registry: Docker image is pushed to AWS ECR with unique tags ( semantic version).
5. Deploy: Lambda function is updated with the new container image, version published, updated
3. AWS Deployment
• Lambda Functions: Each microservice runs as a containerized
Lambda function inside a VPC with private subnets for security.
• API Gateway: Exposes REST endpoints for users and routes requests to the appropriate Lambda function.
• ECR: Stores all container images for Lambda deployment.
4. Monitoring & Observability
• CloudWatch: Captures logs and metrics for Lambda functions, including execution time, errors, and throttles.
• X-Ray: Provides distributed tracing for API requests across microservices.
5. Users / Frontend Interaction
• Users interact with the system via API Gateway, which triggers the respective Lambda functions.
• The architecture ensures scalability, isolation of microservices, and observability for quick debugging and monitoring.
