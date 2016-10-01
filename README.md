Sometimes pods get stuck in terminating state. This removes them.

This has been observed happening when a node is removed from the
cluster, but the controller manager does not completely remove the
pods. These pods still count against autoscale, etc.

This checks for pods in Terminating state that are scheduled to a node
that does not exist and removes them.
