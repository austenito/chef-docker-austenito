name             'chef-docker-austenito'
maintainer       'Austen Ito'
maintainer_email 'austen.dev@gmail.com'
license          'MIT License'
description      'Installs/Configures austenito.com'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends          'chruby'
depends          'docker', '0.37.0'
