#!/bin/bash

<< task
Deploy Weather Web App using Nginx
task

code_clone() {
    echo "Cloning Weather App..."

    if [ -d "weather-app" ]; then
        echo "Weather app directory already exists"
    else
        git clone https://github.com/harshpandey3996/Weather-Web-.git weather-app
    fi
}

install_requirements() {
    echo "Installing Nginx..."

    sudo apt-get update
    sudo apt-get install nginx -y
}

required_restarts() {
    echo "Starting Nginx..."

    sudo systemctl enable nginx
    sudo systemctl restart nginx
}

deploy() {
    echo "Deploying Weather App..."

    sudo rm -rf /var/www/html/*
    sudo cp -r weather-app/* /var/www/html/

    sudo systemctl restart nginx
}

echo "********** WEATHER APP DEPLOYMENT STARTED ***********"

if ! code_clone; then
    echo "Code cloning failed"
    exit 1
fi

if ! install_requirements; then
    echo "Nginx installation failed"
    exit 1
fi

if ! required_restarts; then
    echo "Nginx restart failed"
    exit 1
fi

if ! deploy; then
    echo "Deployment failed"
    exit 1
fi

echo "********** WEATHER APP DEPLOYMENT SUCCESSFUL ***********"																				
															
									
