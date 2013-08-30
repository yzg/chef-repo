
remote_file "#{Chef::Config[:file_cache_path]}/epel-release-5-4.noarch.rpm" do
  source "http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/5/x86_64/epel-release-5-4.noarch.rpm"
end

package "#{Chef::Config[:file_cache_path]}/epel-release-5-4.noarch.rpm"

