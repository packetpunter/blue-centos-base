# Personalized CentOS image for network troubleshooting

This image is based of my needs profesionally; it includes tools like nmap, wireshark, and perfsonar-tools. This image is not in Docker Hub, and assumes local building.

## Building and Usage

To Build: `docker build -t blue-centos-base .`
To Run: `docker run -it --privileged blue-centos-base`

This image runs with privleged because it is required for proper network access.