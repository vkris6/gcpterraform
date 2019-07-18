title 'Check GKE Cluster'

PROJECT_NAME = attribute('gcp_project_id', description: 'gcp project name')
CLUSTER_NAME = attribute('cluster_name', description: 'gcp cluster name')
CLUSTER_ZONE = attribute('gcp_location', description: 'gcp cluster zone')

control 'instance' do
  title 'Check GKE Cluster'

  describe google_container_cluster(project: PROJECT_NAME, zone: CLUSTER_ZONE, name: CLUSTER_NAME) do
    it { should exist }
    its('name') { should eq CLUSTER_NAME }
    its('status') { should eq 'RUNNING' }
    its('zone') { should match CLUSTER_ZONE }
    its('network') { should eq 'vpc-network' }
    its('subnetwork') { should eq 'vpc-subnetwork' }
    its('initial_node_count') { should eq 1 }
    its('node_config.disk_size_gb'){should eq 100}
    its('node_config.image_type'){should eq "COS"}
    its('node_pools.count'){should eq 2}
    its('private_cluster_config.enable_private_nodes'){should eq true}
 
  end
end