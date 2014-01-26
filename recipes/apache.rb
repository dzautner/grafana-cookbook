include_recipe "grafana::default"
include_recipe "apache2::default"

web_app "grafana" do
  server_name "*"
  docroot "#{node['grafana']['install_dir']}/src"
end
