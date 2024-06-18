#!/bin/bash

# Define the log file to keep track of processed parameters
log_file="1_run_all_relations.log"

# Read the JSON array from a file or directly as a string
json='["P101", "P103", "P106", "P108", "P127", "P1303", "P136", "P1376", "P138", "P140", "P1412", "P159", "P176", "P178", "P19", "P190", "P20", "P264", "P27", "P279", "P30", "P36", "P364", "P37", "P39", "P407", "P413", "P449", "P463", "P47", "P495", "P530", "P740", "P937"]'

# Use jq to parse the JSON array
for param in $(echo "$json" | jq -c '.[]'); do
    # Remove double quotes from the param variable
    param=$(echo "$param" | sed 's/"//g')

    # Check if the parameter has already been processed
    if grep -q "^$param$" "$log_file"; then
        echo "Skipping already processed parameter: $param"
        continue
    fi

    # Run the shell script with the parameter
    echo "Running 1_run_mlm.sh with parameter: $param"
    bash 1_run_mlm.sh $param

    # Log the parameter as processed
    echo "$param" >> "$log_file"
done
