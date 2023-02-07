
# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Generate_Keystore() {
    credit_hah
    Center_Text "Generate Keystore File"
    if [ ! -d $HOME/Grasscutter ]; then
        echo "${RC}Error${WC} : The directory ${CCB}$HOME/Grasscutter${WC} does not exist."
        echo
        echo -n "Press any key to back to the main menu..."
        read -n 1
        Grasscutter_Tools
    fi
    getIp=$(ifconfig 2>/dev/null | grep "inet " | sed -n 's/.*inet \([0-9.]*\) .*/\1/p')
    getType=$(ifconfig 2>/dev/null | sed -n 's/^\([a-z0-9_]*\):.*/\1/p')
    echo "${GC}Please choose the ip address to create the keystore file:${WC}"
    numberIp=0
    for ip in $getIp
    do
        numberIp=$(($numberIp+1))
        echo "$numberIp. ${CCB}$ip${WC} (${YC}$(echo "$getType" | sed -n "${numberIp}p")${WC})"
    done
    echo "0. ${RC}Back${WC}"
    echo
    read -p "Please input the number of ip address: " num
    if [ "$num" = "0" ]; then
        Grasscutter_Tools
    fi
    ip=$(echo "$getIp" | sed -n "${num}p")
    echo "Are you sure to create the keystore file with the ip address ${CCB}$ip${WC} ?"
    read -p "Please input ${CCB}yes${WC} or ${CCB}no${WC}: " answer
    if [ "$answer" = "yes" ]; then
        mkdir .ElaXan/certs
        cd .ElaXan/certs
        echo "Create the keystore file with the ip address ${CCB}$ip${WC} ..."
        openssl req -x509 -nodes -days 25202 -newkey rsa:2048 -subj "/C=GB/ST=Essex/L=London/O=Grasscutters/OU=Grasscutters/CN=$ip" -keyout CAkey.key -out CAcert.crt
        openssl genpkey -out ssl.key -algorithm rsa
        cat > csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn
[ dn ]
C = GB
ST = Essex
L = London
O = Grasscutters
OU = Grasscutters
CN = $ip
[ req_ext ]
subjectAltName = @alt_names
[ alt_names ]
IP.1 = $ip
EOF
        openssl req -new -key ssl.key -out ssl.csr -config csr.conf
        cat > cert.conf <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, keyAgreement, dataEncipherment
subjectAltName = @alt_names
[alt_names]
IP.1 = $ip
EOF
        openssl x509 -req -in ssl.csr -CA CAcert.crt -CAkey CAkey.key -CAcreateserial -out ssl.crt -days 25202 -sha256 -extfile cert.conf
        openssl pkcs12 -export -out keystore.p12 -inkey ssl.key -in ssl.crt -certfile CAcert.crt -passout pass:123456
        if [ -f $HOME/Grasscutter/keystore.p12 ]; then
            rm $HOME/Grasscutter/keystore.p12
        fi
        mv ./keystore.p12 $HOME/Grasscutter/keystore.p12
        cd ..
        rm -rf certs
        echo "The keystore file has been created successfully."
        echo "The keystore file is ${CCB}$HOME/Grasscutter/keystore.p12${WC}."
        echo "The password of the keystore file is ${CCB}123456${WC}."
        echo
        echo -n "Press any key to continue..."
        read -n 1
        Grasscutter_Tools
    else
        Generate_Keystore
    fi

}