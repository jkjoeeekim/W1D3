require 'byebug'

def mersenne_prime(num)
    mersenne_primes = [3]
    until mersenne_primes.length == num
        i = mersenne_primes.last
        prime = []
        (0..(i**i)).any? do |exponent|
            number = (2 ** exponent) - 1
            prime << number if is_prime?(number) && !mersenne_primes.include?(number)
        end
        mersenne_primes.concat(prime)
    end

    mersenne_primes.last
end

def is_prime?(num)
    return false if num < 2

    (2...num).none? { |divisor| num % divisor == 0 }
end

# p is_prime?(1) == false
# p is_prime?(2) == true
# p is_prime?(3) == true
# p is_prime?(4) == false
# p is_prime?(6) == false
# p is_prime?(7) == true
# p mersenne_prime(1) == 3
# p mersenne_prime(2) == 7
# p mersenne_prime(3) == 31
# p mersenne_prime(4) == 127
# p mersenne_prime(6) == 131071
# p mersenne_prime(7) == 524287
# p mersenne_prime(8) == 2147483648


def triangular_word?(str)
    alpha = ('a'..'z').to_a
    encoded = 0
    str.each_char { |char| encoded += (alpha.index(char) + 1) }
    (1..(str.length * 26)).any? do |num|
        ((num * (num + 1)) / 2) == encoded
    end
end

# p triangular_word?('abc')       == true
# p triangular_word?('ba')        == true
# p triangular_word?('lovely')    == true
# p triangular_word?('question')  == true
# p triangular_word?('aa')        == false
# p triangular_word?('cd')        == false
# p triangular_word?('cat')       == false
# p triangular_word?('sink')      == false


def consecutive_collapse(array)
    return array if array.length < 2
    
    # debugger
    array.each_with_index do |num, idx|
        # debugger
        if (num + 1) == array[idx + 1] || (num - 1) == array[idx + 1]
            # debugger
            array.delete_at(idx + 1)
            array.delete_at(idx)
            consecutive_collapse(array)
        end
    end
end

# p consecutive_collapse([3, 4, 1])                     == [1]
# p consecutive_collapse([1, 4, 3, 7])                  == [1, 7]
# p consecutive_collapse([9, 8, 2])                     == [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               == [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   == [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               == [1]
# p consecutive_collapse([5, 7, 9, 9])                  == [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              == []


def pretentious_primes(array, num)
    array.map! do |ele|
        # debugger
        primes = []
        if num < 0
            # debugger
            (0...ele).to_a.reverse.each do |number|
                # debugger
                primes << nil if number == 0 && primes.length < num.abs()
                primes << number if is_prime?(number) && primes.length < num.abs()
            end
        else
            ((ele + 1)..(ele ** 2)).each do |number|
                # debugger
                primes << number if is_prime?(number) && primes.length < num.abs()
            end
        end
        # debugger
        primes.last
    end
end

p pretentious_primes([4, 15, 7], 1)             == [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)             == [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)    == [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)    == [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)            == [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)            == [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)           == [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)           == [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)           == [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)           == [17, nil, nil]