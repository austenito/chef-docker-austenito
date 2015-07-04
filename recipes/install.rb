package 'vim'
package 'gcc'
package 'make'

execute 'update apt' do
  command 'sudo apt-get update'
end

node.set['chruby']['rubies'] = {
  "1.9.3-p392" => false,
  "2.2.2" => true
}

include_recipe 'chruby::system'
