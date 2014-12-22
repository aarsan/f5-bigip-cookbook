#
# Cookbook Name:: f5-bigip
# Recipe:: default
#
# Copyright 2014, Target Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-vault'

chef_gem 'soap4r-spox' do
  version '1.6.0'
end

cookbook_file "#{Chef::Config[:file_cache_path]}/f5-icontrol.gem" do
  source 'f5-icontrol-11.4.1.0.gem'
end
resources(:cookbook_file => "#{Chef::Config[:file_cache_path]}/f5-icontrol.gem").run_action(:create)

chef_gem 'f5-icontrol' do
  source "#{Chef::Config[:file_cache_path]}/f5-icontrol.gem"
  version '11.4.1.0'
end
