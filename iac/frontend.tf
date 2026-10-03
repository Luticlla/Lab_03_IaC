resource "docker_image" "frontend" {
 name = "nginx:latest"
 keep_locally = true
}
output "frontend_image_id" {
 value = docker_image.frontend.image_id
}
resource "docker_container" "frontend" {
    count = var.fron_replicas[terraform.workspace]
    name = "web-${terraform.workspace}-${count.index + 1}"
    image = docker_image.frontend.image_id
    ports {
        internal = 80
        external = var.frontend_port[terraform.workspace] + count.index
    }

    networks_advanced {
        name = docker_network.frontend_network.name
    }
}
