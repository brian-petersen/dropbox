# `dropbox`

A private bin I can use to share out text, binaries, etc.

## Listing Files

1. `fly ssh sftp shell`
1. `ls /uploads`

## SSH

To SSH into the box on Fly:

1. Uncomment the `:debug` line in `Dockerfile`
1. Deploy the new release: `fly deploy`
1. SSH in to the box: `fly ssh console -C /busybox/sh`
