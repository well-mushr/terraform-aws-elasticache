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

func TestRedis(t *testing.T) {
	t.Parallel()

	expectedRedis := fmt.Sprintf("terratest-redis-%s", strings.ToLower(random.UniqueId()))
	awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/redis",
		Upgrade:      true,

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":   expectedRedis,
			"region": awsRegion,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	primaryAddress := terraform.Output(t, terraformOptions, "primary_address")
	readerAddress := terraform.Output(t, terraformOptions, "reader_address")

	assert.Contains(t, expectedRedis, primaryAddress)
	assert.Contains(t, expectedRedis, readerAddress)
}
