#!/bin/bash
set -e

# if [ -z $DEPLOY_ENVIRONMENT ]; then echo "No Deployment Environment"; exit; fi

case "$DEPLOY_ENVIRONMENT" in
	development)
		echo "Deploying to development"
		;;
	functional_test)
		echo "Deploying to functional_test"
		;;
	user_acceptance)
		echo "Deploying to user_acceptance"
		;;
	staging)
		echo "Deploying to staging"
		;;
	production)
		echo "Deploying to production"
		;;
	*)
		echo "No valid deployment target given"
		exit 1
		;;
esac

# echo "Deploying to $DEPLOY_ENVIRONMENT"
