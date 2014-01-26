#
# Cookbook Name:: grafana
# Recipe:: default
#
# Copyright 2014, Fewbytes
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git::default"

git node['grafana']['install_dir'] do
  repository node['grafana']['repo']
  reference node['grafana']['revision']
  action :sync
end

template "#{node['grafana']['install_dir']}/src/config.js" do
  source "config.js.erb"
  mode 644
  owner "root"
  group "root"
  variables({
     :elasticsearch_url => node["grafana"]["elasticsearch_url"],
     :graphite_url => node["grafana"]["graphite_url"]
  })
end