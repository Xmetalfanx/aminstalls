#!/bin/bash

function mainMenu() {
    bold="\033[1m"
    end_bold="\033[0m"

    clear
    x=1
    while [ $x -eq 1 ]; do
        echo "==========================="
        echo "Main Menu"
        echo "==========================="
        echo -e "\nSelect an option:\n"
        echo -e "1) ${bold}Install AM (App Manager)${end_bold}"
        echo -e "2) ${bold}Install Apps${end_bold}"
        echo -e "\nQ) Quit"
        echo -n "Please select an option (1-2): "
        read -r choice

        case $choice in
        1)
            echo "Running AM installer..."
            bash ./install_am.sh
            ;;

        2)
            echo "Running App installer..."
            bash ./install_apps.sh
            ;;

        [Qq])
            echo "Exiting."
            x=0
            ;;

        *)
            echo "Invalid option. Try again."
            sleep 2
            ;;
        esac
    done
}

# Call the main menu function
mainMenu
