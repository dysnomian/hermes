describe TransactionProcessor do
  let(:processor) { TransactionProcessor.new(filename) }
  let(:filename)  { 'filename.txt' }
  let(:input) do
    ["Add Soos 4111111111111111 $1000\n",
     "Credit Dipper $200\n"]
  end

  describe '#run' do
    subject { processor.run }
    let(:parser) { double('parser', parse: input) }

    before do
      allow(Parser).to receive(:new).with(filename).and_return(parser)
    end

    context 'with a properly formatted file' do
      it 'returns an array of Transactions' do
        expect(subject.first).to be_a(Transaction)
      end

    end

    context 'with a bad file' do
      before do
        allow(File).to receive(:read).with(filename).and_return(input)
        allow(Transaction).to receive(:generate_from).and_raise { FormatError }
      end

      it 'returns false'
      it 'prints an bad input error message'
    end
  end
end
