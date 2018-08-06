function repair_venv() {
    for venv in "$@"
    do
        python=$(venv_python_version "$venv")
        echo "--> Repairing $venv ($python)"
        find "$venv" -type l -delete
        virtualenv --python $python "$venv"
        echo ""
    done
}
