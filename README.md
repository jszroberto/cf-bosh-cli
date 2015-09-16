# Diego, Bosh and CF containers for DevOps

A set of containers built to work with CF, Diego and Bosh. It is a already configured container with many packages, programs or tools used to work with CF, Diego and Bosh. This images are intended to be used by DevOps engineers to operate, debug and develop automatic solutions. 

## Instructions valid for all images

To set up any enviromental variable, you can have a file named "env.conf" in the mounted volume which is loaded when the container is launched. For mounting a volume just add this option to the 'docker run' command: 

```
docker run -v $(pwd):/workspace

```

## Instructions to run Devbox Updater

This image updates or set up a Bosh Lite with latest CF version and other compatible releases: 

```
$ docker run -i -t diegoteam/devbox-updater 

```

This image generates some artifacts than can be reused if the updates fails in order to speed up need attempts or to use other manifests. If the artifacts are found in the folder, they won't be generated. 

```

compatibility.csv
manifests/
	cf.yml
	diego.yml

```

You just need to mount a folder from your host machine: 

```
$ docker run -i -t -v $(pwd):/workspace diegoteam/devbox-updater 

```

You can set up some other optional environment variables for the container: 
	- STEMCELL: specifies a determinate stemcell. Ex: 
	- NO_UPLOAD=1: new releases tarballs won't be uploaded. 
	- CLEANUP=1 : removes all unused stemcells and releases in the Bosh director
	- CF_VERSION: the environment will be updated using this CF version. 

## Instructions to run CATs

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/cats 

```

To run the tests using a personalized configuration or against remote environments: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/cats 

```

This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"

```

## Instructions to run DATs 

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/dats 

```

To run the tests using a personalized configuration or for other remote environments: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/dats 

``` 


This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"

```

