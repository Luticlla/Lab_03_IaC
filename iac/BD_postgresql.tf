resource "docker_image" "database" {
 name = "postgres:latest"
 keep_locally = true
}
    output "database_image_id" {
        value = docker_image.database.image_id
    }
    resource "docker_container" "database" {
        name = "db-${terraform.workspace}"
        image = docker_image.database.image_id
    env = [
        "POSTGRES_USER=${var.POSTGRES_USER}",
        "POSTGRES_PASSWORD=${var.POSTGRES_PASSWORD}"
    ]
    ports {
        internal = 5432
        external = var.database_port[terraform.workspace]
    }
    # Solo para el backend
    networks_advanced {
        name = docker_network.backend_network.name
    }
}