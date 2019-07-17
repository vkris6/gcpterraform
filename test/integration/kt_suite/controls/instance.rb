control 'instance' do
describe google_container_cluster(project: 'newdemo-246311', zone: 'europe-west1-b', name: 'my-cluster') do
  it { should exist }
  its('name') { should eq 'newdemo-246311' }
  its('status') { should eq 'RUNNING' }
  its('zone') { should match 'europe-west1-b' }
  its('network') { should eq 'vpc-network' }
  its('subnetwork') { should eq 'vpc-subnetwork' }
  its('initial_node_count') { should eq 1 }
  its('node_config.disk_size_gb'){should eq 100}
  its('node_config.image_type'){should eq "COS"}
  its('node_pools.count'){should eq 2}
  its('private_cluster_config.enable_private_nodes'){should eq true}
  # its('master_authorized_networks_config.cidr_blocks'){should include '"cidrBlock":"90.221.77.132/32"'}
  end
end

