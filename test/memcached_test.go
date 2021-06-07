package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestMemcached(t *testing.T) {
	t.Parallel()

	expectedMemcached := fmt.Sprintf("terratest-memcached-%s", strings.ToLower(random.UniqueId()))
	expectedClusterSize := 2
	awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/memcached",
		Upgrade:      true,

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":         expectedMemcached,
			"region":       awsRegion,
			"cluster_size": expectedClusterSize,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	clusterAddress := terraform.Output(t, terraformOptions, "cluster_address")
	cacheNodes := terraform.Output(t, terraformOptions, "cache_nodes")

	assert.Contains(t, expectedMemcached, clusterAddress)
	assert.Equal(t, expectedClusterSize, len(cacheNodes))
}
