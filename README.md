# git-clean-branches

Clean up script to delete remote obsolote branches.

A branch is obsolete if:
1. it is not dev or master
2. it is merged and nothing commited since
3. it it not updated in the last 100 days

To dry run:

- ./git-clean-branches.sh
  
To actually do the delete:

- ./git-clean-branches.sh CONFIRM
  
Take care!
