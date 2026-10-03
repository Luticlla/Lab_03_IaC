variable "POSTGRES_USER" {
    type = string
    description = "Administrador de postgresql"
    default = "admin"
}
variable "POSTGRES_PASSWORD" {
    type = string
    description = "contrasena"
    sensitive = true
    default = "admin"
}
variable "database_port" {
    type = map(number)
    description = "puerto que se expone la bd"
}

variable "backend_port" {
    type = map(number)
    description = "Puerto donnde se expone el backend"
}

variable "frontend_port" {
    type = map(number)
    description = "Puerto donnde se expone el frontend"
}

variable "replicas" {
    type = map(number)
    description = "Cantidad de réplicas del backend, por ambiente."
}