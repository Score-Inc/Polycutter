edit_configjson_Server_http_policies() {
    credit_hah
    line5 "Edit config.json [policies]"
    echo "1. ${CCB}cors${WC}"
    echo "2. ${CCB}cores${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_policies_input
    case $edit_configjson_Server_http_policies_input in
    "1") edit_configjson_Server_http_policies_cors ;;
    "2") edit_configjson_Server_http_policies_cores ;;
    "0") edit_configjson_Server_http ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_Server_http_policies
        ;;
    esac
}
