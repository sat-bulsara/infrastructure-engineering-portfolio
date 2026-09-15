check_cedar_vm_size_availability() {
    az vm list-skus \
    --location uksouth \
    --resource-type virtualMachines \
    --size Standard_B2als_v2 \
    --all \
    --query "[?name=='Standard_B2s'].{Size:name, Restrictions:restrictions}" \
    --output yaml
}

find_available_cedar_b_series_vm_sizes() {
  az vm list-skus \
    --location uksouth \
    --resource-type virtualMachines \
    --size Standard_B \
    --all \
    --query "[?length(restrictions)==\`0\`].{Size:name, vCPUs:capabilities[?name=='vCPUs'].value | [0], MemoryGB:capabilities[?name=='MemoryGB'].value | [0]}" \
    --output table
}