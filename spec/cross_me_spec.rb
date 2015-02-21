require 'cross_me'

describe Solver do
  describe '#solve_puzzle' do
    it ' ' do
      solver = Solver.new
      expect(solver.solve_puzzle(
        [
          %w( \  \  \  ),
          %w( \  \  \  ),
        ],
        [
          [[1], [1], [1]],
          [[1], [2]]
        ])
      ).to eq(
        [
          [
            %w( x \  \  ),
            %w( \  x x ),
          ],
          [
            %w( \  \  x ),
            %w( x x \ ),
          ]
        ]
      )
    end
  end

  describe '#solve_column' do
    it ' ' do
      solver = Solver.new
      expect(solver.solve_column(
        [
          %w( \  \  \  ),
          %w( \  \  \  ),
        ],
        [
          [1], [1], [1],
        ])
      ).to match_array(
        [
          [
            %w( x x x ),
            %w( \  \  \  ),
          ],
          [
            %w( x x \  ),
            %w( \  \  x ),
          ],
          [
            %w( x \  x ),
            %w( \  x \  ),
          ],
          [
            %w( x \  \  ),
            %w( \  x x ),
          ],
          [
            %w( \  x x ),
            %w( x \  \  ),
          ],
          [
            %w( \  x \  ),
            %w( x \  x ),
          ],
          [
            %w( \  \  x ),
            %w( x x \  ),
          ],
          [
            %w( \  \  \  ),
            %w( x x x ),
          ]
        ]
      )
    end

    it ' ' do
      solver = Solver.new
      expect(
        solver.solve_column(
          [
            %w( \  ),
            %w( \  ),
            %w( \  ),
            %w( \  ),
          ],
          [
            [4],
          ]
        )).to match_array(
          [
            [
              %w( x ),
              %w( x ),
              %w( x ),
              %w( x ),
            ],
          ]
        )
    end
  end

  describe '#solve_row' do
    it ' ' do
      solver = Solver.new
      expect(
        solver.solve_row(
          [
            %w( \  \  \  ),
            %w( \  \  \  ),
          ],
          [
            [1], [2]
          ]
        )).to match_array(
          [
            [
              %w( x \  \  ),
              %w( \  x x ),
            ],
            [
              %w( x \  \  ),
              %w( x x \  ),
            ],
            [
              %w( \  x \  ),
              %w( \  x x ),
            ],
            [
              %w( \  x \  ),
              %w( x x \  ),
            ],
            [
              %w( \  \  x ),
              %w( x x \  ),
            ],
            [
              %w( \  \  x ),
              %w( \  x x ),
            ]
          ]
        )
    end

    it ' ' do
      solver = Solver.new
      expect(
        solver.solve_row(
          [
            %w( \  ),
            %w( \  ),
            %w( \  ),
            %w( \  ),
          ],
          [
            [1], [1], [1], [1],
          ]
        )).to match_array(
          [
            [
              %w( x ),
              %w( x ),
              %w( x ),
              %w( x ),
            ],
          ]
        )
    end
  end

  # describe '#solve_empty_row_or_column' do
  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.solve_empty_row_or_column(
  #       %w( \  \  \  \  \  \  \  \  \  \  ),
  #       [6])
  #     ).to eq([
  #       %w( x x x x x x \  \  \  \  ),
  #       %w( \  x x x x x x \  \  \  ),
  #       %w( \  \  x x x x x x \  \  ),
  #       %w( \  \  \  x x x x x x \  ),
  #       %w( \  \  \  \  x x x x x x ),
  #       ])
  #   end

  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.solve_empty_row_or_column(
  #       %w( \  \  \  ),
  #       [1, 1])
  #     ).to eq([
  #       %w( x \  x ),
  #       ])
  #   end
  # end

  # describe '#calculate_hints' do
  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.calculate_hints(%w( x x ), 'x')).to eq([2])
  #   end

  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.calculate_hints(%w( \  x x ), 'x')).to eq([2])
  #   end

  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.calculate_hints(%w( \  x x \  x ), 'x')).to eq([2, 1])
  #   end

  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.calculate_hints(%w( \  x x x x \  x x \  x x x x x x ), 'x')).to eq([4, 2, 6])
  #   end

  #   it ' ' do
  #     solver = Solver.new
  #     expect(solver.calculate_hints(%w( \  x x x x \  x x \  x x x x x x ), ' ')).to eq([1, 1, 1])
  #   end
  # end
end

# it ' ' do
#   solver = Solver.new
#   expect(solver.solve(%w( \  x \  ), 2)).to eq([%w( x x \  ), %w( \  x x )])
#   expect(solver.solve(%w( \  x \  ), 2)).to eq([%w( x x \  ), %w( \  x x )])
# end

# it ' ' do
#   solver = Solver.new
#   expect(solver.solve(%w( \  x \  \  ), 2)).to eq([%w( x x \  \  ), %w( \  x x \  )])
# end

# it ' ' do
#   solver = Solver.new
#   expect(solver.solve(['x', 'x'], 2)).to eq([['x', 'x']])
#   expect(solver.solve(%w( x x ), 2)).to eq([%w( x x )])
# end