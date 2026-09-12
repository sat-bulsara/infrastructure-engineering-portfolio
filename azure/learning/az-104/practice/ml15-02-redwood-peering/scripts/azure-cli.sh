#!/usr/bin/env bash

# Display a public-safe summary of the active Azure subscription context.
show_active_subscription_context() {
    az account show \
    --query "{Subscription: name, State: state , Default: isDefault}" \
    --output table
}
