#!/bin/bash

create_directory(){
	mkdir demo
}

if ! create_directory; then
	echo "The cod eis being exited as the directory already exists"
	exit 1
fi

echo "This should not worl because the code is interrupted "
