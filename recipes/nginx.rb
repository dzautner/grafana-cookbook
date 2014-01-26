include_recipe "grafana::default"
include_recipe "nginx::source"

template "#{node['nginx']['dir']}/sites-available/grafana.conf" do
  source "nginx/grafana.conf.erb"
  mode "0644"
  variables({
     :install_dir => node['grafana']['install_dir']
  })
end

nginx_site "grafana.conf"
