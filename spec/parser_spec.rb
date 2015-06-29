describe Parser do
  let(:parser)   { Parser.new(filename) }
  let(:filename) { 'filename.txt' }

  before do
    allow(File).to receive(:readlines)
      .with(filename).and_return(input)
  end

  let(:input) do
    ["Add Soos 4111111111111111 $1000\n",
     "Credit Dipper $200\n"]
  end

  describe '#parse' do
    subject { parser.parse }

    it 'returns an array of InputLines' do
      expect(subject.first).to be_an(InputLine)
    end
  end
end
