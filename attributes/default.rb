default['grafana']['install_flavour']= 'release'
default['grafana']['release_version']= '1.6.1'
default['grafana']['revision'] = "810f46c450c9582de763395c2edc4f209abc3632"
default['grafana']['reference'] = "master"
default['grafana']['install_dir'] = "/opt/grafana"
default['grafana']['repo'] = "https://github.com/torkelo/grafana.git"
default['grafana']['elasticsearch_url'] = '"http://"+window.location.hostname+":9200"'
default['grafana']['datasources'] = {
	'graphite' => { 'type' => 'graphite', 'url' => '"http://"+window.location.hostname+":8080"', 'default' => 'true'},
}
default['grafana']['port'] = "80"
default['grafana']['nginx']['install_recipe'] = 'source'