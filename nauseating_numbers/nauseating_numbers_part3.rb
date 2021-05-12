def matrix_addition_reloaded(*matrices)
    return nil if matrices.any? { |matrix| matrices[0].length != matrix.length }

    matrices.transpose.map! do |matrix|
        matrix.transpose.map! { |pair| pair.sum }
    end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              ==  [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    ==  [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        ==  [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              ==  [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    ==  nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    ==  nil


def squarocol?(arrays)
    arrays.any? { |array| array.uniq.length == 1 } || arrays.transpose.any? { |array| array.uniq.length == 1 }
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) == true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) == true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) == false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) == true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) == false


def squaragonal?(arrays)
    diag = []
    reverse_diag = []
    (0...arrays[0].length).each do |idx|
        diag << arrays[idx][idx]
        reverse_diag << arrays.reverse[idx][idx]
    end
    diag.uniq.length == 1 || reverse_diag.uniq.length == 1
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) == true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) == true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) == true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) == false


def pascals_triangle(num)
    triangle = [[1], [1, 1]]
    until triangle.length == num
        previous_row = triangle.last
        new_row = []
        (0..previous_row.length).each do |idx|
            if idx == 0 || idx == previous_row.length
                new_row << 1
            else
                new_row << previous_row[idx] + previous_row[idx - 1]
            end
        end
        triangle << new_row
    end
    triangle
end

# p pascals_triangle(2) ==
# [
#     [1],
#     [1, 1]
# ]

# p pascals_triangle(3) ==
# [
#     [1],
#     [1, 1],
#     [1, 2, 1]
# ]

# p pascals_triangle(5) == 
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7) == 
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]