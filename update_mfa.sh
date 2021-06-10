#!/bin/bash

# What is your normal access profile? NOTE: this needs an access_key_id and secret_access_key in .aws/credentials
root_profile= 
# What is then ARN of your Virtual MFA device?
mfa_arn=arn:aws:iam::123456789012:mfa/foobar
# What profile would you like to use for the AWS STS profile?
mfa_profile=
# For how long is the token valid (in seconds)?
duration=86400 #default 24h

# STOP EDITING HERE!

echo "What is your MFA token?"
read token
read AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN <<< \
$( aws sts get-session-token \
    --duration-seconds $duration \
    --serial-number $mfa_arn \
    --token-code $token \
    --profile $root_profile \
    --output text  | awk '{ print $2, $4, $5 }')

if [ -z "$AWS_ACCESS_KEY_ID" ]
then
    echo "operation failed"
    exit 1
fi
`aws --profile $mfa_profile configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"`
`aws --profile $mfa_profile configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"`
`aws --profile $mfa_profile configure set aws_session_token "$AWS_SESSION_TOKEN"`
echo "profile updated successfully"
