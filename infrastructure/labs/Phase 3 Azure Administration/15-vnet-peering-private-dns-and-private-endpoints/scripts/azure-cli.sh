# Create an isolated resource group for application spoke.
create_application_spoke_resource_group() {
    az group create \
    --name rg-application-spoke-lab-uks-01 \
    --location uksouth \
    --tags owner=Sat \
           environment=lab \
           workload=private-connectivity \
           expiry-date=2026-09-30 
}

# Create the manually managed hub virtual network for Project 15.
create_hub_virtual_network() {
    az network vnet create \
    --resource-group rg-connectivity-hub-lab-uks-01 \
    --name vnet-connectivity-hub-uks-01 \
    --location uksouth \
    --address-prefixes 10.40.0.0/16 \
    --subnet-name snet-private-endpoints-uks-01 \
    --subnet-prefixes 10.40.1.0/24 \
    --tags \
    owner=Sat \
    environment=lab \
    workload=private-connectivity \
    expiry-date=2026-09-30 \
    --query "{Name:name, Location:location, State:provisioningState, AddressSpace:addressSpace.addressPrefixes[0]}" \
    --output none 
    az network vnet show \
    --resource-group rg-connectivity-hub-lab-uks-01 \
    --name vnet-connectivity-hub-uks-01 \
    --query "{Name:name, Location:location, State:provisioningState, AddressSpace:addressSpace.addressPrefixes[0]}" \
    --output yaml
}

show_hub_private_endpoint_subnet() {
    az network vnet subnet show \
        --resource-group rg-connectivity-hub-lab-uks-01 \
        --vnet-name vnet-connectivity-hub-uks-01 \
        --name snet-private-endpoints-uks-01 \
        --query "{Name:name, AddressPrefix:addressPrefix, State:provisioningState}" \
        --output yaml
}
