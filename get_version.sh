#!/usr/bin/env bash

# Get the date, layout name and short commit hash
date=$(date -u +"%Y%m%d")
layout=$1
module_commit=$(git --git-dir=/tmp/zmk-config/MWave-zephyr-module/.git/ --work-tree=/tmp/zmk-config/MWave-zephyr-module rev-parse --short HEAD)
commit=$(git rev-parse --short HEAD)

uppercase_char() {
    local char=$1

    (echo $char | tr '[a-z]' '[A-Z]' 2> /dev/null) || echo "${char^^}"
}

# Function to transform characters to ZMK key behaviours
transform_char() {
    local char=$1

    if [[ $char =~ [A-Za-z] ]]; then
        echo "<&kp $(uppercase_char $char)>, "
    elif [[ $char =~ [0-9] ]]; then
        echo "<&kp N${char}>, "
    elif [ "$char" = "." ]; then
        echo "<&kp DOT>, "
    elif [ "$char" = "-" ]; then
        echo "<&kp MINUS>, "
    fi
}

# Iterate over the date and format characters
formatted_date=""
for ((i = 0; i < ${#date}; i++)); do
    formatted_date+=$(transform_char "${date:$i:1}")
done

# Insert separator between date and layout
formatted_date+="<&kp MINUS>, "

# Iterate over the layout and format characters
formatted_layout=""
for ((i = 0; i < ${#layout}; i++)); do
    formatted_layout+=$(transform_char "${layout:$i:1}")
done

# Insert separator between layout and commit hash
formatted_layout+="<&kp MINUS>, "

# Iterate over the module commit and format characters
formatted_module_commit=""
for ((i = 0; i < ${#layout}; i++)); do
    formatted_module_commit+=$(transform_char "${module_commit:$i:1}")
done

# Insert separator between module commit and commit hash
formatted_module_commit+="<&kp MINUS>, "

# Iterate over the commit hash and format characters
formatted_commit=""
for ((i = 0; i < ${#commit}; i++)); do
    formatted_commit+=$(transform_char "${commit:$i:1}")
done

# Combine the formatted string, add trailing carriage return
formatted_result="$formatted_date$formatted_layout$formatted_module_commit$formatted_commit"
formatted_result+="<&kp RET>"

echo $formatted_result
# Create new macro to define version, overwrite previous one

echo '#define VERSION_MACRO' > "$2/config/version.dtsi"
echo 'macro_ver: macro_ver {' >> "$2/config/version.dtsi"
echo 'compatible = "zmk,behavior-macro";' >> "$2/config/version.dtsi"
echo '#binding-cells = <0>;' >> "$2/config/version.dtsi"
echo "bindings = $formatted_result;" >> "$2/config/version.dtsi"
echo '};' >> "$2/config/version.dtsi"