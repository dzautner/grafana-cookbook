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