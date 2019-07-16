control 'instance' do

  describe command("gcloud --project=newdemo-246311 container clusters --zone=europe-west1-b describe my-cluster) do
    it { should exist }
    its('name') { should eq CLUSTER_NAME }
    its('status') { should eq 'RUNNING' }
  end
end