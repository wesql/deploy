#!/bin/bash

echo ''

# Function: Validate email format using regular expressions
validate_email() {
    local email_regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
    if [[ $1 =~ $email_regex ]]; then
        return 0
    else
        return 1
    fi
}

# Function: Escape special characters in a JSON string
escape_json() {
    local input="$1"
    # Replace backslashes with double backslashes
    input="${input//\\/\\\\}"
    # Replace double quotes with escaped double quotes
    input="${input//\"/\\\"}"
    # Replace newline characters with escaped newline
    input="${input//$'\n'/\\n}"
    # Replace carriage return characters with escaped carriage return
    input="${input//$'\r'/\\r}"
    echo "$input"
}

# Prompt and validate Email
while true; do
    read -p "Please enter your Email (required): " EMAIL
    if [[ -z "$EMAIL" ]]; then
        echo "Email cannot be empty, please re-enter."
        continue
    fi
    if validate_email "$EMAIL"; then
        break
    else
        echo "Invalid email format, please re-enter."
    fi
done

# Prompt for optional fields
read -p "Please enter your GitHub username (optional): " GITHUB
read -p "Please enter your first name (optional): " FIRSTNAME
read -p "Please enter your last name (optional): " LASTNAME

# Escape JSON special characters in input
EMAIL_ESCAPED=$(escape_json "$EMAIL")
GITHUB_ESCAPED=$(escape_json "$GITHUB")
FIRSTNAME_ESCAPED=$(escape_json "$FIRSTNAME")
LASTNAME_ESCAPED=$(escape_json "$LASTNAME")

# Set X_API_KEY by decoding a Base64 string
export X_API_KEY=$(echo 'dTZqYzFoSjFESjNzM2JkeFdaTkhONkh0b1Y4SUtBQXpmQmVMV0lkNgo=' | base64 --decode)

# Manually construct JSON data
JSON_DATA=$(cat <<EOF
{
    "region": "us-west-2",
    "email": "${EMAIL_ESCAPED}",
    "Github": "${GITHUB_ESCAPED}",
    "FirstName": "${FIRSTNAME_ESCAPED}",
    "LastName": "${LASTNAME_ESCAPED}"
}
EOF
)

echo "Generating S3 Bucket..."

# Use curl to send a POST request and capture the response
RESPONSE=$(curl -s -X POST https://spumszsqmd.execute-api.us-west-2.amazonaws.com/prod/create-wesql-free-bucket \
    -H "Content-Type: application/json" \
    -H "x-api-key: ${X_API_KEY}" \
    -d "$JSON_DATA")

# Check for errors in the response
if echo "$RESPONSE" | grep -q '"message"'; then
    echo "Request error: $RESPONSE"
    exit 1
fi

# Extract values from the JSON response
BucketName=$(echo "$RESPONSE" | sed -n 's/.*"BucketName": *"\([^"]*\)".*/\1/p')
Region=$(echo "$RESPONSE" | sed -n 's/.*"Region": *"\([^"]*\)".*/\1/p')
AccessKeyId=$(echo "$RESPONSE" | sed -n 's/.*"AccessKeyId": *"\([^"]*\)".*/\1/p')
SecretAccessKey=$(echo "$RESPONSE" | sed -n 's/.*"SecretAccessKey": *"\([^"]*\)".*/\1/p')

# Hardcode variable names without quotes
S3_BUCKET_NAME=$BucketName
AWS_REGION=$Region
AWS_ACCESS_KEY_ID=$AccessKeyId
AWS_SECRET_ACCESS_KEY=$SecretAccessKey

# Check if all values were successfully extracted
if [[ -z "$S3_BUCKET_NAME" || -z "$AWS_REGION" || -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo "Unable to extract all necessary values from the response. Response content: $RESPONSE"
    exit 1
fi

# Write to wesql.env file without double quotes
echo "Generating wesql.env file..."
cat > wesql.env <<EOF
WESQL_OBJECTSTORE_BUCKET=$S3_BUCKET_NAME
WESQL_OBJECTSTORE_REGION=$AWS_REGION
WESQL_OBJECTSTORE_ACCESS_KEY=$AWS_ACCESS_KEY_ID
WESQL_OBJECTSTORE_SECRET_KEY=$AWS_SECRET_ACCESS_KEY
EOF

echo "wesql.env file has been generated."
echo ''