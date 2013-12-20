#!/bin/sh

set_gemfile(){
  echo "Switching Gemfile..."
  export BUNDLE_GEMFILE="`pwd`/Gemfile"
}

# Target postgres
export DB=postgres

# Sap defaults
echo "Setup"
bundle check || bundle update

# Sap API
echo "Setup Sap API"
cd api; set_gemfile; bundle update;


# Set Core
echo "Setup Sap Core"
cd ../core; set_gemfile; bundle update;