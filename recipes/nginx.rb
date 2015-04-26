#
# Cookbook Name:: chef-docker-austenito
# Recipe::nginx
#

include_recipe 'docker'

remote_directory '/tmp/nginx' do
  source 'nginx'
end

docker_image 'austenito/austenito-nginx' do
  source '/tmp/nginx'
  tag '1.4.6-ssl'
  action :pull_if_missing
  cmd_timeout 900
end

if `sudo docker ps -a | grep nginx`.size > 0
  execute('stop container') { command "docker stop -t 60 nginx" }
  execute('remove container') { command "docker rm -f nginx" }
end

docker_container 'nginx' do
  image 'austenito/austenito-nginx:1.4.6-ssl'
  container_name 'nginx'
  port ['80:80', '443, 443']
  volumes_from 'blog'
  volume [
    '/usr/local/certs:/usr/local/certs',
    '/usr/local/nginx:/usr/local/nginx',
  ]
  detach true
  action :run
end
