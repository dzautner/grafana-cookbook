#
# Cookbook Name:: grafana
# Recipe:: default
#
# Copyright 2014, Fewbytes
#
# All rights reserved - Do Not Redistribute
#

case node['grafana']['install_flavour']
when 'release'
   ark "grafana" do
     url "http://grafanarel.s3.amazonaws.com/grafana-#{node['grafana']['release_version']}.zip"
     version node['grafana']['release_version']
     path node['grafana']['install_dir']
     action :put
   end
   final_install_dir="#{node['grafana']['install_dir']}/grafana"
when 'git'
  include_recipe "git::default"
  git node['grafana']['install_dir'] do
    repository node['grafana']['repo']
    revision node['grafana']['revision']
    reference node['grafana']['reference']
    action :sync
  end
  final_install_dir="#{node['grafana']['install_dir']}/src"
else
  Chef::Application.fatal!("unsupported install flavour [#{node['grafana']['install_flavour']}]", 42)
end

template "#{final_install_dir}/config.js" do
  source "config.js.erb"
  mode 644
  owner "root"
  group "root"
  variables({
     :elasticsearch_url => node["grafana"]["elasticsearch_url"],
     :datasources => node["grafana"]["datasources"]
  })
end