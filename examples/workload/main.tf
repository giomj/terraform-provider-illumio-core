terraform {
  required_providers {
    illumio-core = {
      version = "0.1"
      source  = "illumio.com/labs/illumio-core"
    }
  }
}

provider "illumio-core" {
  //  pce_host              = "https://pce.my-company.com:8443"
  //  api_username          = "api_xxxxxx"
  //  api_secret            = "big-secret"
  request_timeout = 30
  org_id          = 1
}

resource "illumio-core_workload" "example" {
  name        = "test workload name"
  description = "test Desc"
  external_data_set       = "test set"
  external_data_reference = "test reference"
  hostname               = "test hostname"
  service_principal_name = "test spn 99"
  interfaces {
    name       = "test interface"
    link_state = "up"
    address    = "10.10.3.10"
  }
  service_provider = "test service provider"
  data_center      = "test data center"
  data_center_zone = "test data center zone"
  os_detail        = "test os details"
  os_id            = "test os id"
  online           = false
  labels {
    href = "/orgs/1/labels/1"
  }
  enforcement_mode = "visibility_only"
}

data "illumio-core_workload" "test" {
  href = "/orgs/1/workloads/e683b686-8afe-4675-88a1-4463395f0482"
}
