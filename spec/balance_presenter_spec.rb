describe BalancePresenter do
  let(:presenter) { BalancePresenter.new(balances) }
  let(:balances)  { { 'Mabel' => 35, 'Soos' => -12, 'Dipper' => nil } }
  let(:readable)  { "Dipper: error\nMabel: $35\nSoos: -$12\n" }

  describe '#print' do
    subject { presenter.print }

    before do
      allow(STDOUT).to receive(:puts).with(readable)
      subject
    end

    it 'prints a human readable string of account balances' do
      expect(STDOUT).to have_received(:puts)
    end
  end
end
