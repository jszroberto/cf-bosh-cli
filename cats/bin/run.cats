#! /bin/bash


if [[ ! -d "$GOPATH/src/github.com/cloudfoundry/cf-acceptance-tests" ]]
then
	echo "ERROR: CATs are not installed"
	exit 1
fi

go get -u github.com/cloudfoundry/cf-acceptance-tests

pushd $GOPATH/src/github.com/cloudfoundry/cf-acceptance-tests

if [[ -n "$CATS_COMMIT" ]]
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
  "api": "api.bosh-lite.com",
  "admin_user": "admin",
  "admin_password": "admin",
  "apps_domain": "bosh-lite.com",
  "skip_ssl_validation": true,
  "use_http": true
}

EOF

fi

if [[ "$#" == 0 ]]
then
	if [[ $DETECT ]]; then
		/root/bin/checkout.acceptance.tests --cats
	fi 
	$(pwd)/bin/test_default
else 
	$(pwd)/bin/test $*
fi

if [[ -n "$CATS_COMMIT" ]]
then 
	git checkout $previous_hash
fi

popd
