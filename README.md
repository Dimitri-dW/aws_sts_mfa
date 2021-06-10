# aws_sts_mfa

This script enables you to refresh your MFA tokens for AWS CLI access though AWS STS.

How to use this:

IMPORTANT: You need an IAM user with Console Access and MFA set up before starting. How to do this: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html

1. Create a profile with your normal IAM access codes
  
    `aws configure --profile pastbook`
    
Enter at least the `aws_access_key_id` and `aws_secret_access_key` value

2. Open the script in your preferred IDE
3. declare tbe variables on top. For the MFA ARN, substitute 123456789012 with your AWS account ID and FooBar with your IAM Account Name
4. run the script
5. You can now use the CLI with an MFA enabled account though your new profile!
