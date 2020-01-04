#!/bin/bash

# configure cluster
flynn cluster add --no-git -p $PIN $CLUSTER_NAME $HOSTNAME $KEY

# run the command that was passed in
exec flynn $@;
