
include_recipe 'apt'

branch = node['ceph']['branch']

distribution_codename =
case node['lsb']['codename']
when 'jessie' then 'sid'
else node['lsb']['codename']
end

apt_preference 'ceph_repo' do
  glob '*'
  pin 'origin "ceph.com"'
  pin_priority '1001'
end

apt_repository 'ceph' do
  repo_name 'ceph'
  uri node['ceph']['debian'][branch]['repository']
  distribution distribution_codename
  components ['main']
  key node['ceph']['debian'][branch]['repository_key']
end
