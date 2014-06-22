include_recipe "grafana::default"
include_recipe "nginx::source"

case node['grafana']['install_flavour']
when 'release'   
   final_install_dir="#{node['grafana']['install_dir']}/grafana"
when 'git'  
  final_install_dir="#{node['grafana']['install_dir']}/src"
else
  Chef::Application.fatal!("unsupported install flavour [#{node['grafana']['install_flavour']}]", 42)
end

template "#{node['nginx']['dir']}/sites-available/grafana.conf" do
  source "nginx/grafana.conf.erb"
  mode "0644"
  variables({
     :install_dir => final_install_dir
  })
end

nginx_site "grafana.conf"
