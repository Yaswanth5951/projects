jenkins-server-network-info = {
region = "ap-northeast-3"
vpc_cidr = "10.10.0.0/16"
subnet_names = [ "app-subnet-1","app-subnet-2" ]
subnet_azs = ["a","b"]
public_key_path = "~/.ssh/id_rsa.pub"
instance_size = "t2.micro"
ami_id = "ami-0690c54203f5f67da"
}
jenkins-server-sg = {
    name = "jenkins-sg"
    description = "this is application security group config"
    rules = [
        {
            type = "ingress"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_block = "0.0.0.0/0"
        },
         {
            type = "ingress"
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_block = "0.0.0.0/0"
        },
         {
            type = "egress"
            from_port = 0
            to_port = 655356
            protocol = "-1"
            cidr_block = "0.0.0.0/0"
        }
    ]
}