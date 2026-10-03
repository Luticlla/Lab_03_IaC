resource "docker_image" "frontend" {
    name = "nginx:latest"
    keep_locally = true
}
output "frontend_image_id" {
    value = docker_image.frontend.image_id
}
resource "docker_container" "frontend" {
    name = "web-${terraform.workspace}"
    image = docker_image.frontend.image_id
    ports {
        internal = 80
        external = var.frontend_port[terraform.workspace]
        }
#Ve el frontend
    networks_advanced {
        name = docker_network.frontend_network.name
        }
}