#!/bin/bash
set -e

case "$DEPLOY_ENVIRONMENT" in

	# Our development environment is single machine
	development)
		echo "Deploying to development"
		echo "Number of machines set to 1"
		;;

	# Our testing environments use a 2 machine cluster
	functional_test)
		echo "Deploying to functional_test"
		echo "Number of machines set to 2"
		;;

	# Our testing environments use a 2 machine cluster
	user_acceptance)
		echo "Deploying to user_acceptance"
		echo "Number of machines set to 2"
		;;

	# Our staging environment is 20 machines in a production like cluster
	staging)
		echo "Deploying to staging"
		echo "Number of machines set to 20"
		;;

	# Our production environment is 200 machines
	production)
		echo "Deploying to production"
		echo "Number of machines set to 200"
		;;

	# Fail the script if we don't get a valid environment
	*)
		echo "No valid deployment target given"
		exit 1
		;;
esac

