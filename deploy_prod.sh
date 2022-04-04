aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 11.dkr.ecr.eu-central-1.amazonaws.com

docker build -t prod:latest -f compose/lambda_extended/Dockerfile .
docker tag prod:latest 11.dkr.ecr.eu-central-1.amazonaws.com/prod_demo_lambda_extended:latest
docker push 11.dkr.ecr.eu-central-1.amazonaws.com/prod_demo_lambda_extended:latest

docker build -t prod:latest -f compose/lambda_base/Dockerfile .
docker tag prod:latest 11.dkr.ecr.eu-central-1.amazonaws.com/prod_demo_lambda_base:latest
docker push 11.dkr.ecr.eu-central-1.amazonaws.com/prod_demo_lambda_base:latest

cd serverless_config && npx serverless deploy --stage prod
