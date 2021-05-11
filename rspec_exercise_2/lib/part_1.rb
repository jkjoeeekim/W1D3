require "byebug"

def partition(array, num)
    partitioned = Array.new(2) {Array.new}
    array.each { |int| int < num ? partitioned[0] << int : partitioned[1] << int }
    partitioned
end

def merge(hash1, hash2)
    merged = Hash.new
    hash1.each { |key, value| merged[key] = value }
    hash2.each { |key, value| merged[key] = value }
    merged
end

def censor(str, array)
    str.split(" ").map { |word| array.include?(word.downcase) ? censor_word(word) : word }.join(" ")
end

def censor_word(str)
    str.split("").map { |char| "aeiou".include?(char.downcase) ? "*" : char }.join("")
end

def power_of_two?(num)
    return true if num == 1
    int = num.dup
    # debugger
    until int == 2.0 || int < 2
        # debugger
        int = int / 2.0
    end
    int == 2.0
end