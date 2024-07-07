# Terraform GCP Infrastructure

This Terraform project sets up a basic Google Cloud Platform (GCP) infrastructure, including a static IP address, a compute instance, and a firewall rule to allow HTTP and HTTPS traffic.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Setup

1. **Clone the repository:**

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Create a `terraform.tfvars` file:**

    Create a `terraform.tfvars` file in the root of your project directory and add your variable values:

    ```hcl
    project_id       = "your-gcp-project-id"
    credentials_file = "path/to/your-credentials-file.json"
    startup_script   = "path/to/your-startup-script.sh"
    ```

3. **Initialize Terraform:**

    Initialize the Terraform configuration. This step will download the necessary provider plugins:

    ```sh
    terraform init
    ```

4. **Plan the deployment:**

    Generate an execution plan to see what resources Terraform will create or change:

    ```sh
    terraform plan
    ```

5. **Apply the configuration:**

    Apply the Terraform configuration to create the resources:

    ```sh
    terraform apply
    ```

    Confirm the apply action by typing `yes` when prompted.

## Variables

The following variables are defined in `variables.tf`:

- `project_id`: The project ID to deploy to.
- `region`: The region to deploy to (default: `europe-west1`).
- `zone`: The zone to deploy to (default: `europe-west1-b`).
- `credentials_file`: The path to the GCP credentials file.
- `instance_name`: The name of the compute instance (default: `terraform-instance`).
- `machine_type`: The type of machine to create (default: `f1-micro`).
- `image`: The image to use for the boot disk (default: `debian-cloud/debian-11`).
- `static_ip_name`: The name of the static IP (default: `my-static-ip2`).
- `firewall_name`: The name of the firewall rule (default: `allow-http-https`).
- `startup_script`: The path to the startup script.

## Files

- `main.tf`: The main Terraform configuration file.
- `variables.tf`: The file where variables are defined.
- `terraform.tfvars`: A file to set the values for the variables (not included, you need to create it).
- `startup_script.sh`: Your custom startup script (you need to provide this file).

## Cleaning Up

To remove the resources created by this Terraform configuration, run:

```sh
terraform destroy
