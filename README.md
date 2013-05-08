# A simpler charon? #

This is a simple illustration of re-proxying with nginx.

- The header foo is passed from the first reply to the second request.
- The header bar is passed from the first reply to the client reply.

## Preparation ##

        $ brew install nginx node
        $ npm install -g coffee-script

## Run it ##

- Run the handlers with:

        $ make handlers

- Run `nginx` with:

        $ make nginx

- Run the `curl` test with:

        $ make test