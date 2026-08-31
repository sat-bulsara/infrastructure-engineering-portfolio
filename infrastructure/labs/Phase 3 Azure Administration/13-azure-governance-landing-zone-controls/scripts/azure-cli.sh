# Create an isolated resource group for safely testing governance controls.
create_governance_resource_group() {
    az group create \
        --name rg-governance-lab-uks-01 \
        --location uksouth \
        --tags \
            owner=Sat \
            environment=lab \
            workload=governance \
            cost-centre=training \
            expiry-date=2026-09-24 \
            data-classification=public
}

# Verify the governance resource group without displaying subscription identifiers.
show_governance_resource_group() {
    az group show \
        --name rg-governance-lab-uks-01 \
        --query "{Name:name, Location:location, State:properties.provisioningState, Tags:tags}" \
        --output yaml
}

# Inspect built-in policies related to regions and tagging before assignment.
list_governance_policy_definitions() {
    az policy definition list \
        --query "[?policyType=='BuiltIn' && contains(['Allowed locations', 'Allowed locations for resource groups', 'Require a tag on resources', 'Require a tag on resource groups'], displayName)].{Policy:displayName, Mode:mode}" \
        --output table
}

# Inspect the Allowed locations definition before assigning it.
show_allowed_locations_policy() {
    az policy definition list \
        --query "[?policyType=='BuiltIn' && displayName=='Allowed locations'] | [0].{Policy:displayName, Mode:mode, Parameters:parameters, Effect:policyRule.then.effect}" \
        --output yaml
}

# Assign the Allowed locations policy in Audit mode at the isolated lab scope.
assign_allowed_locations_audit() {
        local resource_group_scope
        resource_group_scope="$(az group show \
        --name rg-governance-lab-uks-01 \
        --query id \
        --output tsv)"
            local policy_definition_id 
        policy_definition_id="$(az policy definition list \
        --query "[?policyType=='BuiltIn' && displayName=='Allowed locations'] | [0].name" \
        --output tsv)"

    az policy assignment create \
        --name audit-allowed-locations \
        --display-name "Audit allowed locations for governance lab" \
        --scope "$resource_group_scope" \
        --policy "$policy_definition_id" \
        --params '{"listOfAllowedLocations":{"value":["uksouth","ukwest"]},"effect":{"value":"Audit"}}' \
        --description "Audits resources outside UK South and UK West within the isolated governance lab." \
        --query "{Assignment:displayName, Enforcement:enforcementMode, Parameters:parameters}" \
        --output yaml
}

# Assign the Allowed locations policy in Deny mode at the isolated lab scope.
assign_allowed_locations_deny() {
    local resource_group_scope
    local policy_definition_name

    resource_group_scope="$(az group show \
        --name rg-governance-lab-uks-01 \
        --query id \
        --output tsv)"

    policy_definition_name="$(az policy definition list \
        --query "[?policyType=='BuiltIn' && displayName=='Allowed locations'] | [0].name" \
        --output tsv)"

    az policy assignment create \
        --name deny-allowed-locations \
        --display-name "Deny resources outside approved UK locations" \
        --scope "$resource_group_scope" \
        --policy "$policy_definition_name" \
        --params '{"listOfAllowedLocations":{"value":["uksouth","ukwest"]},"effect":{"value":"Deny"}}' \
        --description "Blocks resources outside UK South and UK West within the isolated governance lab." \
        --query "{Assignment:displayName, Enforcement:enforcementMode, Parameters:parameters}" \
        --output yaml
}

show_allowed_locations_assignment(){
    local resource_group_scope="$(az group show \
    --name rg-governance-lab-uks-01 \
    --query id \
    --output tsv)"
    az policy assignment show \
    --name audit-allowed-locations \
    --scope "$resource_group_scope" \
    --query "{Assignment:displayName, Enforcement:enforcementMode, Parameters:parameters}" \
    --output yaml
}

# Create a compliant UK South resource to test the Audit assignment.
create_compliant_policy_test() {
    az network nsg create \
    --resource-group rg-governance-lab-uks-01 \
    --name nsg-policy-test-compliant-uks-01 \
    --location uksouth \
    --output none
}

show_compliant_policy_test(){
    az network nsg show \
    --resource-group rg-governance-lab-uks-01 \
    --name nsg-policy-test-compliant-uks-01 \
    --query "{Name:name, Location:location, State: provisioningState}" \
    --output yaml
}

# Create an East US resource to confirm that Audit reports rather than blocks non-compliance.
create_noncompliant_policy_test() {
    az network nsg create \
    --resource-group rg-governance-lab-uks-01 \
    --name nsg-policy-test-noncompliant-eus-01 \
    --location eastus \
    --output none
}

# Verify that the East US resource was created while the policy was in Audit mode.
show_noncompliant_policy_test() {
    az network nsg show \
        --resource-group rg-governance-lab-uks-01 \
        --name nsg-policy-test-noncompliant-eus-01 \
        --query "{Name:name, Location:location, State:provisioningState}" \
        --output yaml     
}


remove_allowed_locations_audit() {
    local resource_group_scope="$(az group show \
    --name rg-governance-lab-uks-01 \
    --query id \
    --output tsv)"
    az policy assignment delete \
        --name audit-allowed-locations \
        --scope "$resource_group_scope" \
        --output none
}

# Evaluate the required environment tag without blocking resource changes.
assign_required_environment_tag_preview() {
    local resource_group_scope
    local policy_definition_name

    resource_group_scope="$(az group show \
        --name rg-governance-lab-uks-01 \
        --query id \
        --output tsv)"

    policy_definition_name="$(az policy definition list \
        --query "[?policyType=='BuiltIn' && displayName=='Require a tag on resources'] | [0].name" \
        --output tsv)"

    az policy assignment create \
        --name preview-require-env-tag \
        --display-name "Preview required environment tag" \
        --scope "$resource_group_scope" \
        --policy "$policy_definition_name" \
        --params '{"tagName":{"value":"environment"}}' \
        --enforcement-mode DoNotEnforce \
        --description "Evaluates the required environment tag without blocking resource changes." \
        --query "{Assignment:displayName, Enforcement:enforcementMode, Parameters:parameters}" \
        --output yaml
        
}