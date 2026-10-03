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
