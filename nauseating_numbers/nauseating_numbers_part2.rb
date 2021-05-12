def anti_prime?(num)
    factors_array = Array.new
    (1..num).each { |int| factors_array << find_factors(int) }
    (0...(factors_array.length - 1)).all? { |idx| factors_array[-1].length > factors_array[idx].length }
end

def find_factors(num)
    (1..num).select { |divisor| num % divisor == 0 }
end

# p anti_prime?(24)   == true
# p anti_prime?(36)   == true
# p anti_prime?(48)   == true
# p anti_prime?(360)  == true
# p anti_prime?(1260) == true
# p anti_prime?(27)   == false
# p anti_prime?(5)    == false
# p anti_prime?(100)  == false
# p anti_prime?(136)  == false
# p anti_prime?(1024) == false


def matrix_addition(matrix1, matrix2)
    new_matrix = Array.new
    (0...matrix1.length).each do |idx|
        new_matrix << [matrix1[idx][0] + matrix2[idx][0], matrix1[idx][1] + matrix2[idx][1]]
    end
    new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) == [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) == [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) == [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) == [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
    (1..nums.max).select do |divisor|
        nums.all? { |num| num % divisor == 0 }
    end
end

# p mutual_factors(50, 30)            == [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   == [1, 5]
# p mutual_factors(8, 4)              == [1, 2, 4]
# p mutual_factors(8, 4, 10)          == [1, 2]
# p mutual_factors(12, 24)            == [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        == [1, 2, 4]
# p mutual_factors(22, 44)            == [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        == [1, 11]
# p mutual_factors(7)                 == [1, 7]
# p mutual_factors(7, 9)              == [1]


def tribonacci_number(num)
    tribonaccis = [1, 1, 2]
    (tribonaccis.length...num).each { |idx| tribonaccis << [tribonaccis[idx - 3], tribonaccis[idx - 2], tribonaccis[idx - 1]].sum }
    tribonaccis[num - 1]
end

# p tribonacci_number(1)  == 1
# p tribonacci_number(2)  == 1
# p tribonacci_number(3)  == 2
# p tribonacci_number(4)  == 4
# p tribonacci_number(5)  == 7
# p tribonacci_number(6)  == 13
# p tribonacci_number(7)  == 24
# p tribonacci_number(11) == 274