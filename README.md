# shell-scripts
Any useful little shell utilities I happen to write and want cross-systems

## gen_new_app_secrets
In order to have secure secrets for my apps, those secrets implicitly must not be in my git repos! In Rails, at least, the answer to
this is to store secrets in an environment variable, which your application can read to access said secret. This script will take in
an app name (hyphen or underscore delimited) and generate a secret in the user's bash_profile under the variable name APP_NAME_SECRET.
The script also currently can accept a second argument `pepper` from the user, which it uses to generate a secure pepper to be used in
password hashing with Devise.

Additionally, the script includes de-duplication logic that will prevent the user from generating two identically named environment variables.

**Usage:**
```zsh
./gen_new_app_secrets my-app
# Output: 
# export MY_APP_SECRET=<rand_alphanumeric_string>

./gen_new_app_secrets my-app pepper
# Output:
# export MY_APP_SECRET=<rand_alphanumeric_string>
# export MY_APP_PEPPER=<rand_alphanumeric_string>
```
