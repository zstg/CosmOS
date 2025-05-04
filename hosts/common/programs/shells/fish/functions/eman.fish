function eman
    # Check if a program name is passed as argument
    if not set -q argv[1]
        echo "Usage: man <program>"
        return 1
    end

    # Get the program name from the first argument
    set program $argv[1]

    # Open the man page using emt and call the open-man-page function in Emacs
    emt -e "(open-man-page \"$program\")"
end
