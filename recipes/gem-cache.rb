#
# Cookbook Name:: chef-docker-austenito
# Recipe:: gem-cache
#

include_recipe 'docker'

remote_directory '/tmp/gem-cache' do
  source 'gem-cache'
end

docker_image 'austenito/gem-cache' do
  source '/tmp/gem-cache'
  action :pull_if_missing
  cmd_timeout 900
end

docker_container 'gem-cache' do
  image 'austenito/gem-cache'
  detach true
  action :run
end
