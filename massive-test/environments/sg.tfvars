region = "eu-central-1"

athena_workgroups = {
  primary_eu_central_1 = {
    name                               = "primary"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
  }
  primary_us_east_1 = {
    name                               = "primary"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
  }
  primary_us_west_1 = {
    name                               = "primary"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    selected_engine_version            = "AUTO"
  }
}

cloudformation_stacks = {
  vpc_1 = {
    name             = "vpc-1"
    capabilities     = ["CAPABILITY_IAM"]
    disable_rollback = false
    parameters = {
      PrivateSubnet1CIDR = "10.20.30.0/24"
      PublicSubnet3CIDR  = "10.20.25.0/24"
      PublicSubnet2CIDR  = "10.20.20.0/24"
      VpcCIDR            = "10.20.0.0/16"
      ProjectName        = "stackguardian"
      EnvironmentName    = "dev"
      PrivateSubnet2CIDR = "10.20.40.0/24"
      PublicSubnet1CIDR  = "10.20.10.0/24"
    }
  }
  vpc_2 = {
    name             = "vpc-2"
    capabilities     = ["CAPABILITY_IAM"]
    disable_rollback = false
    parameters = {
      PrivateSubnet1CIDR = "10.20.30.0/24"
      PublicSubnet3CIDR  = "10.20.25.0/24"
      PublicSubnet2CIDR  = "10.20.20.0/24"
      VpcCIDR            = "10.20.0.0/16"
      ProjectName        = "approvalv2"
      EnvironmentName    = "dev2"
      PrivateSubnet2CIDR = "10.20.40.0/24"
      PublicSubnet1CIDR  = "10.20.10.0/24"
    }
  }
  cdktoolkit = {
    name             = "CDKToolkit"
    capabilities     = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
    disable_rollback = false
    parameters = {
      FileAssetsBucketKmsKeyId       = "AWS_MANAGED_KEY"
      PublicAccessBlockConfiguration = "true"
      UseExamplePermissionsBoundary  = "false"
      BootstrapVariant               = "AWS CDK: Default Resources"
      DenyExternalId                 = "true"
      Qualifier                      = "hnb659fds"
    }
  }
  deploy_cloudformation_sg = {
    name             = "Deploy-CloudFormation-SG"
    capabilities     = ["CAPABILITY_IAM"]
    disable_rollback = false
    parameters = {
      Environment = "dev"
      SsmParameterValueawsserviceamiamazonlinuxlatestamzn2amikernel510hvmx8664gp2C96584B6F00A464EAD1953AFF4B05118Parameter = "/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-5.10-hvm-x86_64-gp2"
    }
  }
}

instances = {
  private_runner_do_not_delete = {
    ami                    = "ami-04f9a173520f395dd"
    instance_type          = "t2.large"
    availability_zone      = "eu-central-1a"
    key_name               = "private-runner-workshop"
    subnet_id              = "subnet-064f42dced8666a63"
    vpc_security_group_ids = ["sg-0adb3e09fe11a19a1"]
    iam_instance_profile   = "ec2_private_runner_role"
    source_dest_check      = true
    tenancy                = "default"
    monitoring             = false
    tags = {
      Name = "private-runner-do-not-delete"
    }
  }
  managed_node = {
    ami                    = "ami-027ceff350abb2819"
    instance_type          = "t3.medium"
    availability_zone      = "eu-central-1b"
    key_name               = ""
    subnet_id              = "subnet-083c90a8048614a76"
    vpc_security_group_ids = ["sg-02208ae357c6f1a58"]
    iam_instance_profile   = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
    source_dest_check      = true
    tenancy                = "default"
    monitoring             = true
    tags = {
      Name                                     = "managed-node"
      "eks:cluster-name"                       = "eks-ms"
      "eks:nodegroup-name"                     = "managed-node-20260305134536297600000007"
      "k8s.io/cluster-autoscaler/enabled"      = "true"
      "k8s.io/cluster-autoscaler/eks-ms"       = "owned"
      "kubernetes.io/cluster/eks-ms"           = "owned"
    }
  }
}

eip_domain               = "vpc"
eip_network_border_group = "eu-central-1"
eip_public_ipv4_pool     = "amazon"
eip_tags = {
  Name = "basic-eks-eu-central-1a"
}

internet_gateways = {
  hd_vpc_beta = {
    vpc_id = "vpc-0d5ffeeebd645cf5a"
    tags = {
      Name = "hd-vpc-beta"
    }
  }
  basic_eks = {
    vpc_id = "vpc-046e4c08ba6dbab3d"
    tags = {
      Name = "basic-eks"
    }
  }
  sg_vpc_092 = {
    vpc_id = "vpc-0997f6730d02c6d80"
    tags = {
      Name = "sg-vpc-092"
    }
  }
  sg_vpc_1109 = {
    vpc_id = "vpc-09588946e9486d4e3"
    tags = {
      Name = "sg-vpc-1109"
    }
  }
  vpc_rp = {
    vpc_id = "vpc-07982d303cf990a25"
    tags = {
      Name = "vpc-rp"
    }
  }
  vpc_name = {
    vpc_id = "vpc-0e50f5cedb17e651b"
    tags = {
      Name = "vpc_name"
    }
  }
  vpc = {
    vpc_id = "vpc-0a1737138b61a5310"
    tags = {
      Name = "vpc"
    }
  }
  full_stack_xx = {
    vpc_id = "vpc-0a3ac87e9d3a5a57b"
    tags = {
      Name = "full-stack-xx"
    }
  }
  vpc_ms = {
    vpc_id = "vpc-0e278706bd05fe100"
    tags = {
      Name = "vpc-ms"
    }
  }
  sg_vpc_3 = {
    vpc_id = "vpc-0d59da957f232a9bf"
    tags = {
      Name = "sg-vpc-3"
    }
  }
  sg_vpc_jkdsbfkjdsabv = {
    vpc_id = "vpc-0e383da95ac6085aa"
    tags = {
      Name = "sg-vpc-jkdsbfkjdsabv"
    }
  }
  approvalv2_dev2_igw = {
    vpc_id = "vpc-07ab137e2cc49c068"
    tags = {
      Name                              = "approvalv2-dev2-IGW"
      Project                           = "approvalv2"
      Enviroment                        = "dev2"
      "aws:cloudformation:stack-name"   = "vpc-2"
      "aws:cloudformation:stack-id"     = "arn:aws:cloudformation:eu-central-1:470037505301:stack/vpc-2/ae7abf60-c3f1-11f0-8fbf-0206c9183f9b"
      "aws:cloudformation:logical-id"   = "IGW"
    }
  }
  3banken_demo = {
    vpc_id = "vpc-07e5b53843631120e"
    tags = {
      Name = "3banken-demo"
    }
  }
  sg_vpc_nedap = {
    vpc_id = "vpc-0a898a5629c7c765a"
    tags = {
      Name = "sg-vpc-nedap"
    }
  }
  sg_vpc_heidelberg_demo = {
    vpc_id = "vpc-0f70d6809d6945084"
    tags = {
      Name = "sg-vpc-heidelberg-demo"
    }
  }
  sg_vpc_xx = {
    vpc_id = "vpc-01ca0a8f2d4176761"
    tags = {
      Name = "SG-VPC-XX"
    }
  }
  do_not_delete_vpc = {
    vpc_id = "vpc-0f45d49d62599ff66"
    tags = {
      Name = "do-not-delete-vpc"
    }
  }
  dagdasg = {
    vpc_id = "vpc-0bf3fccad6030473b"
    tags = {
      Name = "dagdasg"
    }
  }
  sg_vpc_2 = {
    vpc_id = "vpc-0b293571b9e90486c"
    tags = {
      Name = "sg-vpc-2"
    }
  }
  private_runner_igw = {
    vpc_id = "vpc-00784ac9c64d4472b"
    tags = {
      Name = "private-runner-igw"
    }
  }
  sg_vpc_amit = {
    vpc_id = "vpc-0300246a0c7a5c8f9"
    tags = {
      Name = "sg-vpc-amit"
    }
  }
  sg_vpc_xxklkl = {
    vpc_id = "vpc-092e2c24e01e5e088"
    tags = {
      Name = "sg-vpc-xxklkl"
    }
  }
  usa_stack_vpc_frankfurt = {
    vpc_id = "vpc-014fb726b6506f4ae"
    tags = {
      Name = "usa-stack-vpc-frankfurt"
    }
  }
  demo_cluster_vpc = {
    vpc_id = "vpc-09ee384c27faaec4a"
    tags = {
      Name = "DemoClusterVPC"
    }
  }
}

key_pairs = {
  terraform_20250805092643233600000001 = {
    key_name   = "terraform-20250805092643233600000001"
    public_key = ""
  }
  terraform_20251209191557983800000001 = {
    key_name   = "terraform-20251209191557983800000001"
    public_key = ""
  }
  ansible_instance_key = {
    key_name   = "ansible-instance-key"
    public_key = ""
  }
  terraform_20250918101151466100000001 = {
    key_name   = "terraform-20250918101151466100000001"
    public_key = ""
  }
  terraform_20250808191030201100000001 = {
    key_name   = "terraform-20250808191030201100000001"
    public_key = ""
  }
  terraform_20251205131243007800000001 = {
    key_name   = "terraform-20251205131243007800000001"
    public_key = ""
  }
  terraform_20260120130007422200000001 = {
    key_name   = "terraform-20260120130007422200000001"
    public_key = ""
  }
  terraform_20251208143239155600000001 = {
    key_name   = "terraform-20251208143239155600000001"
    public_key = ""
  }
  terraform_20251126171648379000000001 = {
    key_name   = "terraform-20251126171648379000000001"
    public_key = ""
  }
  terraform_20260304162139662600000001 = {
    key_name   = "terraform-20260304162139662600000001"
    public_key = ""
  }
  terraform_20250904093615572000000001 = {
    key_name   = "terraform-20250904093615572000000001"
    public_key = ""
  }
  terraform_20251008190417907000000001 = {
    key_name   = "terraform-20251008190417907000000001"
    public_key = ""
  }
  terraform_20260409124158325300000001 = {
    key_name   = "terraform-20260409124158325300000001"
    public_key = ""
  }
  private_runner_workshop = {
    key_name   = "private-runner-workshop"
    public_key = ""
  }
  terraform_20251111221723280600000001 = {
    key_name   = "terraform-20251111221723280600000001"
    public_key = ""
  }
  terraform_20250902132225782700000001 = {
    key_name   = "terraform-20250902132225782700000001"
    public_key = ""
  }
  terraform_20260116182307058200000001 = {
    key_name   = "terraform-20260116182307058200000001"
    public_key = ""
  }
}

launch_templates = {
  eks_managed_node_xx_eks_node_group_20240402200025013900000005 = {
    name = "eks-managed-node-XX-eks-node-group-20240402200025013900000005"
    tags = {
      "0"    = "zero"
      name   = "workshop"
      "1"    = "one"
    }
  }
  managed_node_eks_node_group_20250724120439200500000005 = {
    name = "managed-node-eks-node-group-20250724120439200500000005"
    tags = {}
  }
  eks_managed_node_00_eks_node_group_20240117191754195000000005 = {
    name = "eks-managed-node-00-eks-node-group-20240117191754195000000005"
    tags = {
      "0"    = "zero"
      name   = "workshop"
      "1"    = "one"
    }
  }
  eks_managed_node_xx_eks_node_group_20240223114548434300000005 = {
    name = "eks-managed-node-XX-eks-node-group-20240223114548434300000005"
    tags = {
      "0"    = "zero"
      name   = "workshop"
      "1"    = "one"
    }
  }
  managed_node_eks_node_group_20260202133022326400000005 = {
    name = "managed-node-eks-node-group-20260202133022326400000005"
    tags = {}
  }
  one_2025080507384391980000000e = {
    name = "one-2025080507384391980000000e"
    tags = {}
  }
  managed_node_eks_node_group_20260305134530612400000005 = {
    name = "managed-node-eks-node-group-20260305134530612400000005"
    tags = {}
  }
  eks_managed_node_55_eks_node_group_20240305225309102900000005 = {
    name = "eks-managed-node-55-eks-node-group-20240305225309102900000005"
    tags = {
      "0"    = "zero"
      name   = "workshop"
      "1"    = "one"
    }
  }
  eks_fece5f1f_94cc_37f3_cca2_2de45fbc88e4 = {
    name = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
    tags = {
      "eks:cluster-name"   = "eks-ms"
      "eks:nodegroup-name" = "managed-node-20260305134536297600000007"
    }
  }
}

nat_gateway_allocation_id = "eipalloc-0b9b08b9b06cfc421"
nat_gateway_subnet_id     = "subnet-046ecb922ddd59f33"
nat_gateway_tags = {
  Name = "basic-eks-eu-central-1a"
}

network_acls = {
  acl_002a010e6f61e9ae6 = {
    vpc_id = "vpc-07ab137e2cc49c068"
    subnet_ids = [
      "subnet-07971bba1b7a42270",
      "subnet-047686cbdc216e5a1",
      "subnet-0ac80964ef0acb99c",
      "subnet-0b2bfeab9b9600478",
      "subnet-03e7a88db06b8263a"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_0148a060c7592cba0 = {
    vpc_id = "vpc-0300246a0c7a5c8f9"
    subnet_ids = [
      "subnet-044030478d6ac74bd",
      "subnet-019bb58a1054f5b13",
      "subnet-0cd4f27ad4f1d5f35",
      "subnet-0cfc1b10e7ebbc037"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_02e6cb3cfff349453 = {
    vpc_id = "vpc-0997f6730d02c6d80"
    subnet_ids = [
      "subnet-0e2242e016256aec1",
      "subnet-0f0eb65e8a2604da7",
      "subnet-07a8d22bded48fd92",
      "subnet-011ecca679d30a603"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_03c5263da4e5170f2 = {
    vpc_id = "vpc-00784ac9c64d4472b"
    subnet_ids = [
      "subnet-064f42dced8666a63",
      "subnet-070f56eea88d75567"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_04e36ea020e5c62c3 = {
    vpc_id = "vpc-07982d303cf990a25"
    subnet_ids = [
      "subnet-020e12cfe35cc02f1",
      "subnet-0533be8fc6028b6c0"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_0535c42d9c0bb9ffd = {
    vpc_id = "vpc-0a1737138b61a5310"
    subnet_ids = [
      "subnet-0f8745a48328bff82",
      "subnet-04bb9cff8849b5e46",
      "subnet-04ebe5c77ce8b6ad3",
      "subnet-0e013d18dd5c196a6"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  acl_054676d775910a012 = {
    vpc_id = "vpc-0b293571b9e90486c"
    subnet_ids = [
      "subnet-04fd2f3e941012f7b",
      "subnet-0315161523817a77d",
      "subnet-0e5a46529f2302a9a",
      "subnet-064e973d23b5c1d7c"
    ]
    ingress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress = [
      {
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
}

asg_name                                           = "eks-managed-node-20260305134536297600000007-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
asg_max_size                                       = 3
asg_min_size                                       = 0
asg_desired_capacity                               = 1
asg_vpc_zone_identifier                            = ["subnet-028eab44c9937988a", "subnet-083c90a8048614a76"]
asg_capacity_rebalance                             = true
asg_default_cooldown                               = 300
asg_health_check_grace_period                      = 15
asg_health_check_type                              = "EC2"
asg_new_instances_protected_from_scale_in          = false
asg_service_linked_role_arn                        = "arn:aws:iam::470037505301:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
asg_termination_policies                           = ["AllocationStrategy", "OldestLaunchTemplate", "OldestInstance"]
asg_enabled_metrics = [
  "WarmPoolDesiredCapacity",
  "GroupPendingInstances",
  "WarmPoolPendingCapacity",
  "GroupStandbyCapacity",
  "GroupTotalCapacity",
  "GroupTerminatingRetainedCapacity",
  "WarmPoolTotalCapacity",
  "GroupInServiceInstances",
  "GroupInServiceCapacity",
  "WarmPoolWarmedCapacity",
  "GroupTerminatingRetainedInstances",
  "GroupTerminatingCapacity",
  "GroupMaxSize",
  "GroupAndWarmPoolTotalCapacity",
  "GroupTotalInstances",
  "WarmPoolTerminatingRetainedCapacity",
  "GroupMinSize",
  "GroupStandbyInstances",
  "GroupDesiredCapacity",
  "WarmPoolMinSize",
  "GroupAndWarmPoolDesiredCapacity",
  "GroupTerminatingInstances",
  "WarmPoolTerminatingCapacity",
  "WarmPoolPendingRetainedCapacity",
  "GroupPendingCapacity"
]
asg_mixed_instances_policy_launch_template_id      = "lt-0f9cc5046868cfc14"
asg_mixed_instances_policy_launch_template_version = "1"
asg_mixed_instances_policy_override_instance_type  = "t3.medium"
asg_tag_eks_cluster_name                           = "eks-ms"
asg_tag_k8s_autoscaler_eks_ms                      = "owned"
asg_tag_kubernetes_cluster_eks_ms                  = "owned"
asg_tag_eks_nodegroup_name                         = "managed-node-20260305134536297600000007"
asg_tag_k8s_autoscaler_enabled                     = "true"