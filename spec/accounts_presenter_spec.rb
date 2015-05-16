describe AccountsPresenter do
  let(:presenter)  { AccountsPresenter.new(accounts) }
  let(:accounts) { { 'Mabel' => 35, 'Soos' => -12, 'Dipper' => nil } }

  describe '#print' do
    subject { presenter.print }
    let(:readable) { "Dipper: error\nMabel: $35\nSoos: -$12\n" }

    it 'returns a human readable string of account balances' do
      expect(subject).to eq(readable)
    end
  end
end
