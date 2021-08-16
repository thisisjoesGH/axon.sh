# axon.sh

A Matrix Synapse administration tool written in bash

In early development. Currently supports:
 - logging in with username and password
 - logging out and invalidating session
 - retrieving and saving access token
 - getting server version information
 - creating new users
 - sending server notices

 ## How to use
 
### building

 This project uses [LINAC](https://git.thisisjoes.site/joe/linac). To use the provided version of LINAC to build
 axon.sh, do `mkdir build && ./utils/linac build axon.sh.build`.

### running

 Invoke like any other bash script, e.g. `bash build/axon.sh.build.sh`
