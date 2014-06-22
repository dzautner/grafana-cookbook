include_recipe "grafana::default"
include_recipe "apache2::default"

case node['grafana']['install_flavour']
when 'release'   
   final_install_dir="#{node['grafana']['install_dir']}/grafana"
when 'git'  
  final_install_dir="#{node['grafana']['install_dir']}/src"
else
  Chef::Application.fatal!("unsupported install flavour [#{node['grafana']['install_flavour']}]", 42)
end

web_app "grafana" do
  server_name "*"
  docroot final_install_dir
end
