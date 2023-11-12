# Create VPC
resource "aws_vpc" "ntier-vpc" {
  cidr_block = var.jenkins-server-network-info.vpc_cidr
  tags = { Name = "ntier-vpc"}
}
# Create Subnets 
resource "aws_subnet" "ntier-subnets" {

  count = length(var.jenkins-server-network-info.subnet_names)
  vpc_id = aws_vpc.ntier-vpc.id
  cidr_block = cidrsubnet(var.jenkins-server-network-info.vpc_cidr, 8, count.index)
  availability_zone = "${var.jenkins-server-network-info.region}${var.jenkins-server-network-info.subnet_azs[count.index]}"
  tags = {Name = var.jenkins-server-network-info.subnet_names[count.index]}
  depends_on = [ aws_vpc.ntier-vpc ]
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier-vpc.id
  tags = {Name = "igw"}
  depends_on = [ aws_vpc.ntier-vpc ]
}
# Route table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.ntier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id 
  }
   tags = {Name = "rt"}
}
# Route table association
resource "aws_route_table_association" "rt-association" {
    subnet_id = aws_subnet.ntier-subnets[0].id
    route_table_id = aws_route_table.rt.id
}

## Create a keypair
resource "aws_key_pair" "public-key" {
  key_name = "ntier_keypair"
  public_key = "${file(var.jenkins-server-network-info.public_key_path)}"
}