class Solver
  def solve_puzzle(rows, hints)
    column_solution = solve_column(rows, hints[0])
    row_solution = solve_row(rows, hints[1])
    column_solution & row_solution
  end

  def solve_column(rows, column_hints)
    column_solution = []
    columns = build_columns_from(rows)

    0.upto(columns.length - 1) do |i|
      column_solution << solve_empty_row_or_column(columns[i], column_hints[i])
    end

    product = column_solution[0].product(*column_solution.last(column_solution.length - 1))

    answer = []
    product.each { |solution_in_columns| answer << build_rows_from(solution_in_columns) }
    answer
  end

  def solve_row(rows, row_hints)
    solution = []
    0.upto(rows.length - 1) do |i|
      solution << solve_empty_row_or_column(rows[i], row_hints[i])
    end

    solution[0].product(*solution.last(solution.length - 1))
  end

  def solve_empty_row_or_column(row_or_column, hints)
    1.upto(hints.reduce(:+)) do
      index_of_blank = row_or_column.index(' ')
      row_or_column[row_or_column.index(' ')] = 'x'
    end

    solutions = row_or_column.permutation.to_a.uniq

    solutions.select do |solution|
      calculate_hints(solution, 'x') == hints
    end
  end

  def calculate_hints(solution, space_type)
    index = 0
    runs = []

    while solution.length >= index + 1

      if solution.at(index) == space_type
        accum, index = calculate_hint(solution, index, space_type)
        runs << accum
      end

      index += 1
    end

    runs
  end

  def calculate_hint(solution, index, space_type)
    accum = 0

    while solution.at(index) == space_type
      accum += 1
      index += 1
    end

    return accum, index
  end
end

  def build_columns_from(rows)
    columns = []

    0.upto(rows.first.length - 1) do |i|
      column = []
      rows.each { |row| column << row[i] }
      columns << column
    end

    columns
  end

  def build_rows_from(columns)
    rows = []
    columns

    0.upto(columns.first.length - 1) do |i|
      row = []
      columns.each { |column| row << column[i] }
      rows << row
    end

    rows
  end

# def solve(row, hints)
#   indexes_of_x = []
#   row.each_with_index { |space, i| indexes_of_x << i if space == 'x' }

#   index_of_blank = row.index(' ')
#   return [row] if index_of_blank.nil?
#   row[row.index(' ')] = 'x'

#   solutions = row.permutation.to_a.uniq

#   solutions.select do |solution|
#     # original x's coming in must be in the solution
#     indexes_of_x.each { |index| solution.at(index) != 'x' ? break : true } &&
#     # reject solutions with runs over the hint qty
#     calculate_hints(solution, 'x').index(hints)
#   end
# end