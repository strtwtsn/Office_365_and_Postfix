bash "Install Postfix" do
user "root"
code <<-EOH
sudo apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install postfix
EOH
end

service "postfix" do
service_name "postfix"
supports :restart => true, :status => true, :reload => true
end


template "/etc/postfix/main.cf" do
source "main.cf.erb"
mode 0644
end

template "/etc/postfix/sasl_passwd" do
source "sasl_passwd.erb"
mode 0600
end

template "/etc/postfix/generic" do
source "generic.erb"
mode 0600
end


bash "Configuration" do
user "root"
code <<-EOH
sudo postmap /etc/postfix/sasl_passwd
cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem|sudo tee -a /etc/postfix/cacert.pem
sudo newaliases
sudo postmap /etc/postfix/generic
EOH
end


service "postfix" do
service_name "postfix"
supports :restart => true, :status => true, :reload => true
end
