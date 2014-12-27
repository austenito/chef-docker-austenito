#
# Cookbook Name:: chef-docker-austenito
# Recipe::blog
#

include_recipe 'docker'

remote_directory '/tmp/blog' do
  source 'blog'
end

docker_image 'austenito/austenito-blog' do
  source '/tmp/blog'
  action :pull_if_missing
  cmd_timeout 900
end

if `sudo docker ps -a | grep blog`.size > 0
  execute('stop container') { command "docker stop -t 60 blog" }
  execute('remove container') { command "docker rm -f blog" }
end

docker_container 'blog' do
  image 'austenito/austenito-blog'
  container_name 'blog'
  volumes_from 'gem-cache'
  detach true
  action :run
end
