#!/bin/bash
set -e

# Import lib.
source ./lib.sh

# Clean on error.
trap clean ERR

function main {
    ensureAzLogin

    # Create test environment.
    createAKS "$DAPR_PERF_CLUSTER1_RESOURCE_GROUP_NAME" "$DAPR_PERF_CLUSTER_REGION" "$DAPR_PERF_CLUSTER_NODE_COUNT" "$DAPR_PERF_CLUSTER_NODE_SKU"
    createAKS "$DAPR_PERF_CLUSTER2_RESOURCE_GROUP_NAME" "$DAPR_PERF_CLUSTER_REGION" "$DAPR_PERF_CLUSTER_NODE_COUNT" "$DAPR_PERF_CLUSTER_NODE_SKU"
    createAKS "$DAPR_PERF_CLUSTER3_RESOURCE_GROUP_NAME" "$DAPR_PERF_EXTERNAL_CLUSTER_REGION" "$DAPR_PERF_CLUSTER_NODE_COUNT" "$DAPR_PERF_CLUSTER_NODE_SKU"
}

# Run main program.
main