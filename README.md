# MapBender Docker Build

This Dockerfile clones the mapbender-starter git repository and builds
 Debian 11 container with PHP 7.4 with mapbender up and running.

To get started:

Do once:

* `git clone git@github.com:leogaggl/mapbender-docker.git `
* `cd mapbender-docker`
* `docker compose build`

To start:

* `docker compose up`
* `call http://localhost:9090 or http://localhost:9090/app.php in your browser`
