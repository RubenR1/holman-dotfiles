# Description: Login to AWS using SSO

function awslogin() {
    export AWS_PROFILE=$1
    export AWS_DEFAULT_PROFILE="eu-west-1"

    unset AWS_CA_BUNDLE
    # set CA when on at work
    ping discoveryinsureprod.discsrv.co.za -c 1 -t 1 > /dev/null 2>&1 && export AWS_CA_BUNDLE=~/Discovery_Chain.crt
    if [ -z "$AWS_CA_BUNDLE" ]; then
      # set CA when on VPN
      ping vpn.discovery.co.za -c 1 -t 1 > /dev/null 2>&1 && export AWS_CA_BUNDLE=~/Discovery_Chain.crt
    fi

    aws sso login --profile $AWS_PROFILE

    export AWS_ACCOUNT=$(aws sts get-caller-identity --query 'Account' --output text)
    export AWS_REGION=$(aws configure get region --profile $AWS_PROFILE)
}