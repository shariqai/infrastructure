import os

# Define the directory structure and files
structure = {
    "terraform_project": {
        "main.tf": "",
        "variables.tf": "",
        "outputs.tf": "",
        "providers.tf": "",
        "modules": {
            "vpc": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "ecs": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "rds": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "s3": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "cloudwatch": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "secrets_manager": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "iam": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "api_gateway": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
            "lambda": {
                "main.tf": "",
                "variables.tf": "",
                "outputs.tf": "",
            },
        }
    }
}

# Function to create directories and files
def create_structure(base_path, structure):
    for name, content in structure.items():
        path = os.path.join(base_path, name)
        if isinstance(content, dict):
            os.makedirs(path, exist_ok=True)
            create_structure(path, content)
        else:
            with open(path, 'w') as f:
                f.write(content)

# Set up the directory structure
base_path = "."
create_structure(base_path, structure)

print("Terraform project structure has been set up.")
