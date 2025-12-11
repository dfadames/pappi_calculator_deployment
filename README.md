# Pappi Calculator APP
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