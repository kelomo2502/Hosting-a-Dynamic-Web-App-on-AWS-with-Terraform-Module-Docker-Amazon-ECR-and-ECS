# In this mini project, you will use Terraform to create a modular infrastructure for hosting a dynamic web application on Amazon ECS (Elastic Container Service). The project involves containerizing the web app using Docker, pushing the Docker image to Amazon ECR (Elastic Container Registry), and deploying the app on ECS
>
> React/Redux pair-programming project.

## Built With

- Docker
- Terraform
- Amazon ECR
- Amazon ECS
- React
- HTML & CSS3
- ES6 JavaScript
- Babel

## Github Link [https://github.com/kelomo2502/Hosting-a-Dynamic-Web-App-on-AWS-with-Terraform-Module-Docker-Amazon-ECR-and-ECS]

## Getting Started

- run `https://github.com/kelomo2502/Hosting-a-Dynamic-Web-App-on-AWS-with-Terraform-Module-Docker-Amazon-ECR-and-ECS.git` in your terminal.
- switch to the project's directory

### Prerequisites

- AWS account
- Terraform Installation
- AWS CLI
- NPM
- ES6 JavaScript
- Webpack
- Understanding of APIs

### Objectives

**Dockerization of Web App:**
Create a dynamic web application using a technology of your choice (e.g., Node.js, React). However, I will be using a React app for this project. `https://github.com/kelomo2502/Space-Travelers-Hub.git`

We would write a docker file for our application as follows:

```DSL
# Use official Node.js image as base
FROM node:18-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY spaceApp/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY spaceApp ./

# Build the React app
RUN npm run build

# Use Nginx to serve the app
FROM nginx:alpine

# Copy built files to Nginx's HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

```

**Terraform module for ECR:**

- Create a new directory for the root project (e.g.terraform-ecs)
- Inside the project directory, create a directory for the Amazon ECR module (modules/ecr)
- Write a Terraform module modules/ecr/main.tf to create an Amazon ECR repository for storing Docker images
- Inside the project directory, create a directory for the ECS module modules/ecs
- Write a Terraform module modules/ecs/main.tf to provision an ECS cluster and deploy the Dockerized web app.
- Create the main Terraform configuration file main.tf in the project directory.
- Use the ECR and ECS modules to create the necessary infrastructure for hosting the web app.

### Deployment

- Build the Docker image of your web app.
- Push the Docker image to the Amazon ECR repository created by Terraform.

## Authors

👤 **Gbenga Kelvin Oyewunmi**

- GitHub: [@githubhandle](https://github.com/kelomo2502)
- Twitter: [@twitterhandle](https://twitter.com/kelomoJs)
- LinkedIn: [LinkedIn](https://linkedin.com/in/oyewunmi-gbenga)

👤 **Suleiman Olaide**

- GitHub: [@githubhandle](https://github.com/Ceemos96)
- Twitter: [@twitterhandle](https://twitter.com/Ceemos_dev)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/suleiman-olaide-97689b154/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/kelomo2502/Space-Travelers-Hub/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Microverse

## 📝 License

This project is [MIT](https://github.com/kelomo2502/Space-Travelers-Hub/blob/development/LICENSE) licensed.
