# Dev Notes
Files to transfer into next.js project are stored in this directory's files-to-transfer directory. joelgrayson.com has an endpoint (https://joelgrayson.com/software/create-joel-app/files-to-transfer.tgz) that redirects to the raw GitHub serving of the zipped files-to-transfer.tgz file. When npx create-joel-app is run, the most recent files-to-transfer.tgz is curled and unzipped in order to transfer into the user's project.

Run `./publish.sh` in order to update changes.

