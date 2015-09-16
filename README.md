# cf-bosh-cli
A container to work with CF and Bosh CLIs. It is a already configured container with many packages, programs or tools used to work with CF and Bosh. This image is intended to be used by DevOps engineers to operate, debug and develop automatic solutions. 


## Instructions to run Bosh CLI image

## Instructions to run CF CLI Image 

## Instructions to run Diego CLI Image

## Instructions to run Devbox Updater

```
$ docker run -i -t diegoteam/devbox-updater 

```

This image is going to generate some artifacts than can be reused if the updates fails in order to speed up need attempts or to use other manifests. If the artifacts are found in the folder, they won't be generated. 

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


## Instructions to run Devbox Manifest Generator 



## Instructions to run CATs

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/cats 

```

To run the tests using a personalized configuration: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/cats 

```

This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"
```

Alternatively, you can have a file named "env.conf" in the mounted volume which would be loaded when the container is launched. 


## Instructions to run DATs 

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/dats 

```

To run the tests using a personalized configuration or for other external environments: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/dats 

``` 


This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"

```

Alternatively, you can have a file named "env.conf" in the mounted volume which would be loaded when the container is launched. 

