resource "docker_image" "backend" {
    name = "nmatsui/hello-world-api:latest"
    keep_locally = true
}
output "backend_image_id" {
    value = docker_image.backend.image_id
}
resource "docker_container" "backend" {
    name = "api-${terraform.workspace}"
    image = docker_image.backend.image_id
    ports {
        internal = 3000
        external = var.backend_port[terraform.workspace]
        }
 # El backend es el puente: habla con el frontend y con la base de datos
        networks_advanced {
        name = docker_network.frontend_network.name
        }
        networks_advanced {
        name = docker_network.backend_network.name
        }
}