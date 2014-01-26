name             'grafana'
maintainer       'Fewbytes'
maintainer_email 'daniel@fewbytes.com'
license          'All rights reserved'
description      'Installs/Configures grafana'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'git'
depends 'apache2'
depends 'nginx'