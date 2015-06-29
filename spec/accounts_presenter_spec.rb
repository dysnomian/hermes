describe AccountsPresenter do
  let(:presenter)  { AccountsPresenter.new(accounts) }
  let(:accounts) { { 'Mabel' => 35, 'Soos' => -12, 'Dipper' => nil } }

  describe '#printable_accounts' do
    subject { presenter.printable_accounts }
    let(:readable) { "Dipper: error\nMabel: $35.00\nSoos: -$12.00\n" }

    it 'returns a human readable string of account balances' do
      expect(subject).to eq(readable)
    end
  end
end
