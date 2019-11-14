mine() {
    false # boom!
}
mine || {
    echo "You stepped on a mine!" 1>&2
    false
}
read -n 1 -s -r -p "Press any key to continue"