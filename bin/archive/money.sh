#!/bin/zsh

counter=1

function lyrics {
    case $counter in
    1)
        echo "Money, get away";;
    2)
        echo "Get a job with good pay and you're okay";;
    3)
        echo "Money it's a gas";;
    4)
        echo "Grab that cash with both hands and make a stash";;
    5)
        echo "New car, caviar, four star daydream,";;
    6)
        echo "Think I'll buy me a football team";;
    7)
        echo "Money get back";;
    8)
        echo "I'm all right Jack keep your hands off my stack";;
    9)
        echo "Money it's a hit";;
    10)
        echo "Don't give me that do goody good bullshit";;
    11)
        echo "I'm in the hi-fidelity first class travelling set";;
    12)
        echo "And I think I need a Lear jet";;
    13)
        echo "Money it's a crime";;
    14)
        echo "Share it fairly but don't take a slice of my pie";;
    15)
        echo "Money so they say";;
    16)
        echo "Is the root of all evil today";;
    17)
        echo "But if you ask for a raise it's no surprise that they're";;
    18)
        echo "giving none away";;
    esac
}

while [ $counter -lt 19 ]
do
    sleep 1
    echo "$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$""$"
    sleep 1
    lyrics $counter
    counter=$((counter + 1))
done
