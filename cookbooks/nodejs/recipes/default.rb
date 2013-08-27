
package "python26"
package "gcc-c++"

version = "0.10.9"

remote_file "#{Chef::Config[:file_cache_path]}/node-v#{version}.tar.gz" do
  source "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  not_if "which node"
end

bash "build nodejs" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar -zxvf node-v#{version}.tar.gz
  (cd node-v#{version} && python26 ./configure)
  (cd node-v#{version} && make -j #{node["cpu"]["total"]} && make install)
  EOF
  not_if "which node"
end

