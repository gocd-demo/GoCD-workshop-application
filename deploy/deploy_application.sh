#!/bin/bash
set -e

case "$DEPLOY_ENVIRONMENT" in

	# Our development environment is single machine
	development)
		echo "Deploying to development"
		echo "Number of machines set to 1"
		sh -c "cd application/hello-world/; npm install; SERVER_PORT=3004 nohup node hello_world.js >>/dev/null 2>&1 &"
		;;

	# Our testing environments use a 2 machine cluster
	functional_test)
		echo "Deploying to functional_test"
		echo "Number of machines set to 2"
		sh -c "npm install --prefix application/hello-world; SERVER_PORT=3003 nohup node application/hello-world/hello_world.js >>/dev/null 2>&1 &"
		;;

	# Our testing environments use a 2 machine cluster
	user_acceptance)
		echo "Deploying to user_acceptance"
		echo "Number of machines set to 2"
		sh -c "npm install --prefix application/hello-world; SERVER_PORT=3002 nohup node application/hello-world/hello_world.js >>/dev/null 2>&1 &"
		;;

	# Our staging environment is 20 machines in a production like cluster
	staging)
		echo "Deploying to staging"
		echo "Number of machines set to 20"
		sh -c "npm install --production --prefix application/hello-world; SERVER_PORT=3001 nohup node application/hello-world/hello_world.js >>/dev/null 2>&1 &"
		;;

	# Our production environment is 200 machines
	production)
		sh deploy/stop_server.sh
		echo "Deploying to production"
		echo "Number of machines set to 200"
		sh -c "npm install --production --prefix application/hello-world; SERVER_PORT=3000 nohup node application/hello-world/hello_world.js >>/dev/null 2>&1 &"
		;;

	# Fail the script if we don't get a valid environment
	*)
		echo "No valid deployment target given"
		exit 1
		;;
esac
