# Personalized CentOS image for network troubleshooting

This image is based of my needs profesionally; it includes tools like nmap, wireshark, and perfsonar-tools. This image is not in Docker Hub, and assumes local building. This assumes that the image will be run on a linux docker host, not a Windows one, as networking gets wonky.

## Building and Usage

To Build: `docker build -t blue-centos-base .`

To Run: `docker run -it --net=host blue-centos-base`

It is required to expose the host network to this VM to ensure that various networking tools are able to properly receive packets.
