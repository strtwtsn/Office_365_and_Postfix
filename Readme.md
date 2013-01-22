Firstly check out the Repo

sudo git clone https://github.com/strtwtsn/Office_365_and_Postfix.git /var/chef

**Before you begin**

Navigate to /var/chef/cookbooks/postfix/templates/default and make the following changes:-

**In sasl_passwd.erb**

Change [Office 365 SMTP Sever] to the Office 365 mail server you want to use to send email

Change email@domain.com to the email address of the user you want to send as

Change Password to the password of the user above



**In generic.erb**

Replace local email address with the local email address of the local user sending email

This should be something like

root@hostname from /etc/hosts

Replace Office 365 email address with the address used in sasl_passwd.erb


***After configuration***

/usr/local/bin/chef-solo -c /var/chef/config/chefsolo.rb -j /var/chef/roles/postfix.json
