name 'lamp'
maintainer 'Michael Romero'
maintainer_email 'romerom@gmail.com'
license 'MIT'
description 'Installs/Configures lamp'
long_description 'Installs/Configures lamp'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/p0six/learn-chef/issues' if respond_to?(:issues_url)
source_url 'https://github.com/p0six/learn-chef' if respond_to?(:source_url)
supports 'ubuntu'

depends 'httpd', '~> 0.6'
depends 'mysql', '~> 8.5'
depends 'mysql2_chef_gem', '~> 2.1'
depends 'database', '~> 6.1'
