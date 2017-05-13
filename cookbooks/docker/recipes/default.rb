
case node[:platform]
when 'windows' then
  chocolatey_package [
    'docker',
    'docker-machine',
  ]
when 'ubuntu' then
  package [
    'apt-transport-https',
    'ca-certificates',
    'curl',
    'software-properties-common'
  ]
  
  # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  # sudo apt-key fingerprint 0EBFCD88
  
  apt_repository 'docker' do
    uri 'https://download.docker.com/linux/ubuntu'
    distribution 'xenial'
    arch 'amd64'
    components ['stable']
  end
  
  #include_recipe 'apt'
  execute 'apt-get update'
  
  package 'docker-ce'
  
  service 'docker' do
    action [:enable, :start]
  end
end

