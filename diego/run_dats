#! /bin/bash


if [[ ! -d "$GOPATH/src/github.com/cloudfoundry-incubator/diego-acceptance-tests" ]]
then
	echo "ERROR: DATs are not installed"
	exit 1
fi

go get -u github.com/cloudfoundry-incubator/diego-acceptance-tests

pushd $GOPATH/src/github.com/cloudfoundry-incubator/diego-acceptance-tests

if [[ -n "$DATS_COMMIT" ]]
then 
	previous_hash=$(git rev-parse HEAD)
    git checkout $commit
   
fi 

if [[ -z "$CONFIG" ]]
then 
	echo "INFO: Not configuration specified. Running tests against a default Bosh lite installation"
	export CONFIG=$(pwd)/integration_config.json
	cat > integration_config.json <<EOF
{
  "api": "api.10.244.0.34.xip.io",
  "admin_user": "admin",
  "admin_password": "admin",
  "apps_domain": "10.244.0.34.xip.io",
  "skip_ssl_validation": true,
  "secure_address": "10.244.0.42:4001"
}
EOF

fi

if [[ "$#" == 0 ]]
then
	$(pwd)/bin/test
else 
	$(pwd)/bin/test $*
fi

if [[ -n "$DATS_COMMIT" ]]
then 
	git checkout $previous_hash
fi

popd
