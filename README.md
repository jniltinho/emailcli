[![CircleCI](https://circleci.com/gh/jniltinho/emailcli.svg?style=shield)](https://circleci.com/gh/jniltinho/emailcli)

# Emailcli

Because surprisingly, everything else out there just barely fails to
be useful to me.

This utility does exactly one thing: wrap a Golang email library in a
command line interface.

## Install on Linux (https://github.com/jniltinho/emailcli/releases)

```
wget https://github.com/jniltinho/emailcli/releases/download/v0.0.4/email-cli_linux
mv email-cli_linux /usr/local/bin/email-cli
chmod +x /usr/local/bin/email-cli
```

## Build

```
git clone https://github.com/jniltinho/emailcli.git
cd emailcli
make
```

## Usage

```
email-cli --username test@gmail.com --password somepassword \
    --host smtp.gmail.com --port 587 \
    --subject "Test mail" \
    --body "Test Body" test@gmail.com
```

For security, it also supports reading settings from environment
variables:
```
export EMAIL_PASSWORD=somepassword
email-cli --username test@gmail.com \
    --host smtp.gmail.com --port 587 \
    --subject "Test mail" \
    --body "Test Body" test@gmail.com
```

All command line variables can be used as environment variables by
appending EMAIL_ to the parameter name and capitalizing.
