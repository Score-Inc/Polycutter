editJsonJq() {
    cd $grasscutter_path || exit 1
    fileConfig="config.json"
    jq .$1 $fileConfig > ZEdit.json
    rm $fileConfig
    mv ZEdit.json $fileConfig
    $editConfigJson_Back
}