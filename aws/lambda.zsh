# Description: Login to AWS using SSO

function awsrunlambda() {
	aws sns publish --message 'manual' --topic-arn "arn:aws:sns:$AWS_REGION:$AWS_ACCOUNT:$1" | jq
	aws logs tail --follow "/aws/lambda/$1"
}
