describe Print do
  let(:player1) { Player.new(name: "Darby", mark: "X") }
  let(:player2) { Player.new(name: "Andrew", mark: "O") }
  let(:players) { [player1, player2] }
  let(:game)    { Game.new(players) }
  let(:board)   { Board.new(game) }
  let(:print) { board.print }

  it 'prints welcome' do
    expect(print).to be(:welcome)
  end

  it 'prints grid' do
    expect(print).to be (:print_grid)
