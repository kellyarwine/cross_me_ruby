require 'cross_me'

describe Solver do
  describe '#solve_puzzle' do
      it ' ' do
        solver = Solver.new
        expect(solver.solve_puzzle(
            [5, 5],
            [[3], [4], [3, 1], [4], [3]],
            [[1], [3], [5], [2, 2], [5]],
          )
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

    it ' ' do
      solver = Solver.new
      expect(solver.solve_puzzle(
          [3, 2],
          [[1], [1], [1]],
          [[1], [2]],
        )
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

  describe '#solve_columns' do
    it ' ' do
      solver = Solver.new
      expect(
        solver.solve_columns(
          [
            [1], [1], [1],
          ],
          [
            %w( \  \  ),
            %w( \  \  ),
            %w( \  \  ),
          ]
        )
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
        solver.solve_columns(
          [
            [4],
          ],
          [
            %w( \  \  \  \  ),
          ],
        )
      ).to match_array(
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

  describe '#solve_rows' do
    it ' ' do
      solver = Solver.new
      expect(
        solver.solve_rows(
          [
            [1], [2]
          ],
          [
            %w( \  \  \  ),
            %w( \  \  \  )
          ],
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
        solver.solve_rows(
          [
            [1], [1], [1], [1],
          ],
          [
            %w( \  ),
            %w( \  ),
            %w( \  ),
            %w( \  ),
          ],
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

  describe '#solve_empty_row_column' do
    xit ' ' do
      solver = Solver.new
      expect(solver.solve_empty_row_column(
        %w( \  \  \  \  \  \  \  \  \  \  ),
        [6])
      ).to eq([
        %w( x x x x x x \  \  \  \  ),
        %w( \  x x x x x x \  \  \  ),
        %w( \  \  x x x x x x \  \  ),
        %w( \  \  \  x x x x x x \  ),
        %w( \  \  \  \  x x x x x x ),
        ])
    end

    it ' ' do
      solver = Solver.new
      expect(solver.solve_empty_row_column(
        %w( \  \  \  ),
        [1, 1])
      ).to eq([
        %w( x \  x ),
        ])
    end
  end

  describe '#calculate_hints' do
    it ' ' do
      solver = Solver.new
      expect(solver.calculate_hints(%w( x x ), 'x')).to eq([2])
    end

    it ' ' do
      solver = Solver.new
      expect(solver.calculate_hints(%w( \  x x ), 'x')).to eq([2])
    end

    it ' ' do
      solver = Solver.new
      expect(solver.calculate_hints(%w( \  x x \  x ), 'x')).to eq([2, 1])
    end

    it ' ' do
      solver = Solver.new
      expect(solver.calculate_hints(%w( \  x x x x \  x x \  x x x x x x ), 'x')).to eq([4, 2, 6])
    end

    it ' ' do
      solver = Solver.new
      expect(solver.calculate_hints(%w( \  x x x x \  x x \  x x x x x x ), ' ')).to eq([1, 1, 1])
    end
  end
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
