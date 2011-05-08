#/bin/bash 

env="development"
if [ $# -gt 0 ]; then
	env=$1
fi

gem uninstall simple_uploader -I
gem build simple_uploader.gemspec
gem install --no-rdoc --no-ri simple_uploader-1.0.0.gem
