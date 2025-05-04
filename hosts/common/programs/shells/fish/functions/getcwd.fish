function getcwd
    echo (dirname (readlink -m (status --current-filename)))
end
