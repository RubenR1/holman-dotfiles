# Description: Login to AWS using SSO

function awsrunlambda() {
	local current_date="$2"
	if [ -z "$current_date" ]; then
		current_date=$(date +"%Y-%m-%d")
	fi
	local attr='{"run_date": {"DataType": "String", "StringValue": "'"$current_date"'"}}'
	echo $attr
	aws sns publish --message-attribute "$attr" --message "manual" --topic-arn "arn:aws:sns:$AWS_REGION:$AWS_ACCOUNT:$1" | jq
	aws logs tail --follow "/aws/lambda/$1"
}

alias arl='awsrunlambda'

