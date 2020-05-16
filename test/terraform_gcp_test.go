package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the Terraform module in examples/terraform-aws-dynamodb-example using Terratest.
func TestTerraformGcp(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	region := "us-east1"
	saName := fmt.Sprintf("sa-name-%s", strings.ToLower(random.UniqueId()))
	organization := "CallePuzzle"
	repository := "terraform-google-github-continuous-testing"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"project": projectId,
			"region": region,
			"sa_name": saName,
			"organization": organization,
			"repository": repository,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
