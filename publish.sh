#comandos para borrar docker localmente
git adocker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f
#docker build -t terraform-dev-repo:shipping-service-latest .
#docker tag terraform-dev-repo:shipping-service-latest 713010966457.dkr.ecr.us-east-1.amazonaws.com/terraform-dev-repo:shipping-service-latest
#aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 713010966457.dkr.ecr.us-east-1.amazonaws.com
#docker push 713010966457.dkr.ecr.us-east-1.amazonaws.com/terraform-dev-repo:shipping-service-latest 