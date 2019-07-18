title 'Check GKE Cluster'

PROJECT_NAME = attribute('gcp_project_id', description: 'gcp project name')
CLUSTER_NAME = attribute('cluster_name', description: 'gcp cluster name')
CLUSTER_ZONE = attribute('gcp_location', description: 'gcp cluster zone')

control 'node_standard' do
google_container_node_pools(project: PROJECT_NAME, zone: CLUSTER_ZONE, cluster_name: CLUSTER_NAME).node_pool_names.each do |node_pool_name_standard|
  describe google_container_node_pool(project: PROJECT_NAME, zone: CLUSTER_ZONE, cluster_name: CLUSTER_NAME, nodepool_name: node_pool_name_standard) do
    it { should exist }
    its('status') { should eq 'RUNNING' }
  end
end
