describe Parser do
  let(:parser)   { Parser.new(filename) }
  let(:filename) { 'filename.txt' }
  let(:account)  { "Soos" }

  let(:input) do
    [ "Add #{account} 4111111111111111 $1000\n"]
  end

  let(:transaction) { double(:transaction) }

  before do
    allow(File).to receive(:readlines).with(filename) { input }
  end

  describe '#transaction_array' do
    subject { parser.transaction_array }

    before do
      allow(TransactionFactory).to receive(:build).
        with(true, :add, account, 1000) { transaction }
    end

    it 'returns the expected array of transactions' do
      expect(subject.first).to eq(transaction)
    end
  end
end
