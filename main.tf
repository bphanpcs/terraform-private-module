# main.tf

provider "aws" {
  region = "us-west-2"
}

module "private_module" {
  source = "git::ssh://git@github.com/your_username/private_module.git"
  
  variable1 = "value1"
  variable2 = "value2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # Use output from the private module
  subnet_id = module.private_module.subnet_id
}
