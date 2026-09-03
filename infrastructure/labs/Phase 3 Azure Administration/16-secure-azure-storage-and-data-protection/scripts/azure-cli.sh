create_northstar_storage_resource_group(){
    az group create \
    --name rg-northstar-storage-lab-uks-01 \
    --location uksouth \
    --tags \
        owner=Sat \
        environment=lab \
        workload=document-storage \
        company=northstar-design \
        expiry-date=2026-09-08 
}

show_northstar_storage_resource_group(){
    az group show \
    --name rg-northstar-storage-lab-uks-01 \
    --query "{Name: name, Location: location, State: properties.provisioningState, Tags: tags}" \
    --output yaml
}

check_northstar_storage_account_name(){
    az storage account check-name \
    --name stnorthstardocsuks01 
}

create_northstar_storage_account(){
    az storage account create \
    --resource-group rg-northstar-storage-lab-uks-01 \
    --name stnorthstardocsuks01 \
    --location uksouth \
    --kind StorageV2 \
    --sku Standard_ZRS \
    --access-tier Hot \
    --https-only true \
    --min-tls-version TLS1_2 \
    --allow-blob-public-access false \
    --allow-shared-key-access false \
    --public-network-access Enabled \
    --default-action Deny \
        --bypass None \
        --tags \
            owner=Sat \
            environment=lab \
            workload=document-storage \
            company=northstar-design \
            expiry-date=2026-09-08 \
        --output none
}

show_northstar_storage_security_baseline(){
    az storage account show \
    --resource-group rg-northstar-storage-lab-uks-01 \
    --name stnorthstardocsuks01 \
    --query "{Name:name, State:provisioningState, Kind:kind \
    , SKU:sku.name, AccessTier:accessTier, HTTPSOnly:enableHttpsTrafficOnly \
    , MinimumTLS:minimumTlsVersion, AnonymousBlobAccess:allowBlobPublicAccess \
    , SharedKeyAccess:allowSharedKeyAccess, PublicNetworkAccess:publicNetworkAccess \
    , FirewallDefault:networkRuleSet.defaultAction, FirewallBypass:networkRuleSet.bypass \
    , Tags:tags}" \
    --output yaml
}

create_northstar_document_container(){
    az storage container-rm create \
    --storage-account stnorthstardocsuks01 \
    --resource-group rg-northstar-storage-lab-uks-01 \
    --name documents \
    --public-access off \
    --output none
}

show_northstar_document_container(){
    az storage container-rm show \
    --storage-account stnorthstardocsuks01 \
    --resource-group rg-northstar-storage-lab-uks-01 \
    --name documents \
    --query "{Name:name, PublicAccess:publicAccess, State:provisioningState}" \
    --output yaml
}

create_northstar_blob_contributor_group(){
    az ad group create \
    --display-name sg-northstar-blob-contributors \
    --mail-nickname sg-northstar-blob-contributors \
    --query "{DisplayName:displayName, ObjectId:id, SecurityEnabled:securityEnabled}" \
    --output yaml
}

add_current_user_to_northstar_blob_contributor_group() {
    local current_user_id
    current_user_id="$(az ad signed-in-user show \
        --query id \
        --output tsv)"

    az ad group member add \
        --group sg-northstar-blob-contributors \
        --member-id "$current_user_id"
}

# Grant the Northstar security group Blob data access only to the documents container.
assign_northstar_blob_contributor_role() {
    local group_object_id
    local container_scope

    group_object_id="$(az ad group show \
        --group sg-northstar-blob-contributors \
        --query id \
        --output tsv)"

    container_scope="$(az storage container-rm show \
        --resource-group rg-northstar-storage-lab-uks-01 \
        --storage-account stnorthstardocsuks01 \
        --name documents \
        --query id \
        --output tsv)"

    az role assignment create \
        --assignee-object-id "$group_object_id" \
        --assignee-principal-type Group \
        --role "Storage Blob Data Contributor" \
        --scope "$container_scope" \
        --query "{Role:roleDefinitionName, PrincipalType:principalType, Scope:scope}" \
        --output yaml
}

# Enable recovery controls for accidentally deleted or overwritten documents.
enable_northstar_blob_data_protection() {
    az storage account blob-service-properties update \
        --resource-group rg-northstar-storage-lab-uks-01 \
        --account-name stnorthstardocsuks01 \
        --enable-versioning true \
        --enable-delete-retention true \
        --delete-retention-days 14 \
        --enable-container-delete-retention true \
        --container-delete-retention-days 14 \
        --output none
}