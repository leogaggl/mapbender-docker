This Dockerfile clones the mapbender-starter git repository and builds
a Debian 11 container with mapbender up and running.

To get started:

Do once:

* `git clone git@github.com:mapbender/docker.git mapbender`
* `cd mapbender`
* `docker-compose build`

To start:

* `docker-compose up`
* `call http://localhost:9090 or http://localhost:9090/app.php in your browser`
