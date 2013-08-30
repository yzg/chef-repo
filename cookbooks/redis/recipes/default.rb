
include_recipe "yum::epel"

package "redis"

service "redis" do
  action [:enable, :start]
end

