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

autoscaling_group_name             = "eks-managed-node-20260305134536297600000007-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
autoscaling_group_max_size         = 3
autoscaling_group_min_size         = 0
autoscaling_group_desired_capacity = 1
autoscaling_group_capacity_rebalance = true
autoscaling_group_default_cooldown = 300
autoscaling_group_health_check_grace_period = 15
autoscaling_group_health_check_type = "EC2"
autoscaling_group_vpc_zone_identifier = [
  "subnet-028eab44c9937988a",
  "subnet-083c90a8048614a76"
]
autoscaling_group_termination_policies = [
  "AllocationStrategy",
  "OldestLaunchTemplate",
  "OldestInstance"
]
autoscaling_group_protect_from_scale_in = false
autoscaling_group_service_linked_role_arn = "arn:aws:iam::470037505301:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
autoscaling_group_enabled_metrics = [
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
autoscaling_group_launch_template_id      = "lt-0f9cc5046868cfc14"
autoscaling_group_launch_template_name    = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
autoscaling_group_launch_template_version = "1"

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
  cdk_toolkit = {
    name             = "CDKToolkit"
    capabilities     = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
    disable_rollback = false
    parameters = {
      FileAssetsBucketKmsKeyId        = "AWS_MANAGED_KEY"
      PublicAccessBlockConfiguration  = "true"
      UseExamplePermissionsBoundary   = "false"
      BootstrapVariant                = "AWS CDK: Default Resources"
      DenyExternalId                  = "true"
      Qualifier                       = "hnb659fds"
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

eip_domain               = "vpc"
eip_network_interface_id = "eni-0abf671af21a96b9c"
eip_network_border_group = "eu-central-1"
eip_public_ipv4_pool     = "amazon"
eip_tags = {
  Name = "basic-eks-eu-central-1a"
}

instances = {
  private_runner_do_not_delete = {
    ami_id                               = "ami-04f9a173520f395dd"
    instance_type                        = "t2.large"
    availability_zone                    = "eu-central-1a"
    subnet_id                            = "subnet-064f42dced8666a63"
    vpc_security_group_ids               = ["sg-0adb3e09fe11a19a1"]
    iam_instance_profile                 = "ec2_private_runner_role"
    key_name                             = "private-runner-workshop"
    source_dest_check                    = true
    tenancy                              = "default"
    ebs_optimized                        = false
    monitoring                           = false
    metadata_http_endpoint               = "enabled"
    metadata_http_protocol_ipv6          = "disabled"
    metadata_http_put_response_hop_limit = 2
    metadata_http_tokens                 = "required"
    metadata_instance_metadata_tags      = "disabled"
    tags = {
      Name = "private-runner-do-not-delete"
    }
  }
  managed_node = {
    ami_id                               = "ami-027ceff350abb2819"
    instance_type                        = "t3.medium"
    availability_zone                    = "eu-central-1b"
    subnet_id                            = "subnet-083c90a8048614a76"
    vpc_security_group_ids               = ["sg-02208ae357c6f1a58"]
    iam_instance_profile                 = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
    key_name                             = ""
    source_dest_check                    = true
    tenancy                              = "default"
    ebs_optimized                        = false
    monitoring                           = true
    metadata_http_endpoint               = "enabled"
    metadata_http_protocol_ipv6          = "disabled"
    metadata_http_put_response_hop_limit = 2
    metadata_http_tokens                 = "required"
    metadata_instance_metadata_tags      = "disabled"
    tags = {
      Name                              = "managed-node"
      "aws:autoscaling:groupName"       = "eks-managed-node-20260305134536297600000007-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
      "aws:ec2:fleet-id"                = "fleet-10bd0296-85ae-4ca7-061a-238a12adfc11"
      "k8s.io/cluster-autoscaler/eks-ms" = "owned"
      "kubernetes.io/cluster/eks-ms"    = "owned"
      "aws:eks:cluster-name"            = "eks-ms"
      "eks:cluster-name"                = "eks-ms"
      "aws:ec2launchtemplate:version"   = "1"
      "eks:nodegroup-name"              = "managed-node-20260305134536297600000007"
      "k8s.io/cluster-autoscaler/enabled" = "true"
      "aws:ec2launchtemplate:id"        = "lt-0f9cc5046868cfc14"
    }
  }
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
      Name                            = "approvalv2-dev2-IGW"
      Project                         = "approvalv2"
      "aws:cloudformation:stack-name" = "vpc-2"
      Enviroment                      = "dev2"
      "aws:cloudformation:stack-id"   = "arn:aws:cloudformation:eu-central-1:470037505301:stack/vpc-2/ae7abf60-c3f1-11f0-8fbf-0206c9183f9b"
      "aws:cloudformation:logical-id" = "IGW"
    }
  }
  "3banken_demo" = {
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
}

iam_instance_profiles = {
  eks_fece5f1f_94cc_37f3_cca2_2de45fbc88e4 = {
    name = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
    path = "/"
    role = "managed-node-eks-node-group-20260305134529526900000001"
  }
  ec2_private_runner_role = {
    name = "ec2_private_runner_role"
    path = "/"
    role = "ec2_private_runner_role"
  }
}

iam_role_autoscaling_name        = "AWSServiceRoleForAutoScaling"
iam_role_autoscaling_path        = "/aws-service-role/autoscaling.amazonaws.com/"
iam_role_autoscaling_description = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
iam_role_autoscaling_assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"autoscaling.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
iam_role_autoscaling_max_session_duration = 3600

key_pair_key_name   = "private-runner-workshop"
key_pair_public_key = ""

network_interfaces = {
  eni_0766757b2170188e5 = {
    subnet_id         = "subnet-083c90a8048614a76"
    description       = "aws-K8S-i-0b86bd1d36a4864dd"
    source_dest_check = true
    security_groups   = ["sg-02208ae357c6f1a58"]
    tags = {
      "eks:eni:owner"                        = "amazon-vpc-cni"
      "node.k8s.amazonaws.com/instance_id"   = "i-0b86bd1d36a4864dd"
      "node.k8s.amazonaws.com/createdAt"     = "2026-03-05T13:47:02Z"
      "cluster.k8s.amazonaws.com/name"       = "eks-ms"
    }
  }
  managed_node = {
    subnet_id         = "subnet-083c90a8048614a76"
    description       = ""
    source_dest_check = true
    security_groups   = ["sg-02208ae357c6f1a58"]
    tags = {
      Name                                   = "managed-node"
      "eks:eni:owner"                        = "amazon-vpc-cni"
      "node.k8s.amazonaws.com/instance_id"   = "i-0b86bd1d36a4864dd"
      "cluster.k8s.amazonaws.com/name"       = "eks-ms"
      "eks:cluster-name"                     = "eks-ms"
      "eks:nodegroup-name"                   = "managed-node-20260305134536297600000007"
    }
  }
  eni_0ae0ac032fb68be5b = {
    subnet_id         = "subnet-064f42dced8666a63"
    description       = ""
    source_dest_check = true
    security_groups   = ["sg-0adb3e09fe11a19a1"]
    tags              = {}
  }
}