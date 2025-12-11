# PAPPI Calculator Deployment

This repository contains the complete deployment configuration for the PAPPI Calculator application, which includes:

- **Frontend**: React application with Vite
- **Authentication Backend**: FastAPI service with PostgreSQL
- **Calculator Backend**: FastAPI service for GPA calculations

## Architecture

```
┌─────────────────┐
│   Frontend      │
│  (React/Vite)   │
│   Port: 3000    │
└────────┬────────┘
         │
         ├─────────────┬─────────────┐
         │             │             │
    ┌────▼────┐   ┌────▼────┐   ┌───▼────┐
    │  Auth   │   │Calculator│   │Postgres│
    │ Backend │   │ Backend  │   │   DB   │
    │Port:8001│   │Port:8002 │   │Port:5432
    └─────────┘   └──────────┘   └────────┘
```

## Prerequisites

- Docker Desktop installed and running
- Git installed
- (Optional) Docker Compose v2 or higher

## Quick Start

### For Windows (PowerShell)

```powershell
# Clone the repository
git clone https://github.com/dfadames/pappi_calculator_deployment.git
cd pappi_calculator_deployment

# Initialize and update submodules
git submodule update --init --recursive

# Start all services
.\start.ps1

# To stop all services
.\stop.ps1
```

### For Linux/Mac

```bash
# Clone the repository
git clone https://github.com/dfadames/pappi_calculator_deployment.git
cd pappi_calculator_deployment

# Initialize and update submodules
git submodule update --init --recursive

# Make scripts executable
chmod +x start.sh stop.sh

# Start all services
./start.sh

# To stop all services
./stop.sh
```

## Manual Docker Compose Commands

If you prefer to use Docker Compose commands directly:

```bash
# Start all services
docker-compose up -d

# Start with rebuild
docker-compose up --build -d

# View logs
docker-compose logs -f

# View logs for specific service
docker-compose logs -f frontend
docker-compose logs -f auth_backend
docker-compose logs -f calculator_backend

# Stop all services
docker-compose down

# Stop and remove volumes
docker-compose down -v
```

## Services

### Frontend (Port 3000)
- **URL**: http://localhost:3000
- **Technology**: React 19 with Vite
- **Description**: User interface for the calculator application

### Authentication Backend (Port 8001)
- **URL**: http://localhost:8001
- **API Documentation**: http://localhost:8001/docs
- **Technology**: FastAPI with PostgreSQL
- **Description**: User authentication and authorization service
- **Database**: PostgreSQL (Port 5432)

### Calculator Backend (Port 8002)
- **URL**: http://localhost:8002
- **API Documentation**: http://localhost:8002/docs
- **Technology**: FastAPI
- **Description**: GPA calculation service for university semesters

## Environment Variables

The authentication backend uses the following environment variables (configured in docker-compose.yml):

- `DATABASE_URL`: PostgreSQL connection string
- `SECRET_KEY`: JWT secret key for token generation
- `ALGORITHM`: JWT algorithm (HS256)
- `ACCESS_TOKEN_EXPIRE_MINUTES`: Token expiration time
- `APP_NAME`: Application name
- `DEBUG`: Debug mode (True/False)

## Project Structure

```
pappi_calculator_deployment/
├── docker-compose.yml              # Main orchestration file
├── start.ps1                       # Windows startup script
├── start.sh                        # Linux/Mac startup script
├── stop.ps1                        # Windows stop script
├── stop.sh                         # Linux/Mac stop script
├── README.md                       # This file
├── front-examen-arqsoft/           # Frontend submodule
│   ├── Dockerfile
│   ├── nginx.conf
│   └── ...
├── back_pappi_calculator_auth/     # Auth backend submodule
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── requirements.txt
│   └── ...
└── final_exam_calculator_be/       # Calculator backend submodule
    ├── Dockerfile
    ├── requirements.txt
    └── app/
```

## Submodules

This project uses Git submodules for managing the different services:

- **Frontend**: https://github.com/Zanat07/front-examen-arqsoft.git
- **Auth Backend**: https://github.com/UNxchange/back_pappi_calculator_auth.git
- **Calculator Backend**: https://github.com/dfadames/final_exam_calculator_be

### Updating Submodules

To pull the latest changes from all submodules:

```bash
git submodule update --remote --recursive
```

## Troubleshooting

### Docker is not running
Ensure Docker Desktop is installed and running before executing the scripts.

### Port conflicts
If you have other services running on ports 3000, 8001, 8002, or 5432, you'll need to modify the port mappings in `docker-compose.yml`.

### Database connection issues
Wait a few seconds for the PostgreSQL database to fully initialize. The health check ensures the database is ready before starting dependent services.

### Submodule not initialized
Run: `git submodule update --init --recursive`

### Build failures
Try cleaning up and rebuilding:
```bash
docker-compose down -v
docker system prune -a
docker-compose up --build
```

## Development

### Accessing Services

- **Frontend**: Open http://localhost:3000 in your browser
- **Auth API Docs**: http://localhost:8001/docs (Swagger UI)
- **Calculator API Docs**: http://localhost:8002/docs (Swagger UI)
- **Database**: localhost:5432 (credentials in docker-compose.yml)

### Making Changes

1. Navigate to the specific submodule directory
2. Make your changes
3. Commit and push changes in the submodule
4. Update the parent repository to reference the new commit

### Viewing Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f frontend
docker-compose logs -f auth_backend
docker-compose logs -f calculator_backend
docker-compose logs -f postgres
```

## Production Considerations

Before deploying to production:

1. **Change the SECRET_KEY** in docker-compose.yml to a strong random string
2. **Update database credentials** with secure passwords
3. **Set DEBUG=False** for production environments
4. **Configure proper CORS origins** instead of allowing all (*)
5. **Use environment files** (.env) instead of hardcoding values
6. **Set up SSL/TLS** for HTTPS
7. **Configure proper logging** and monitoring
8. **Set up backup strategy** for PostgreSQL data

## License

See individual submodule repositories for license information.

## Contributors

- Frontend: https://github.com/Zanat07
- Auth Backend: https://github.com/UNxchange
- Calculator Backend: https://github.com/dfadames

## Support

For issues related to specific services, please create an issue in the respective submodule repository.

---

#### 📊 **C&C View**
*Visual representation of system components and their interconnections*

<div align="center">

![C&C View](./CyC-Diagram.png)

</div>

## Components

### Frontend Components

**front-examen-arqsoft:**
This is the web frontend application. It acts as the interface between the browser and the backend services.

### Backend Components

**back_pappi_calculator_auth:**
This is a backend service responsible for authentication. It connects directly to the database to manage user credentials and sessions.

**final_exam_calculator_be:**
This component contains the logic for the P.A.P.P.I. calculation.

### Data Storage

**auth-db:**
This is the database component attached to the authentication service. It stores data via a PSQL Driver (PostgreSQL), holding the user information.