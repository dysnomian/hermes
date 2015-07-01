describe TransactionFactory do
  describe '.build' do
    subject { TransactionFactory.build(*input_array) }

    let(:input_array) { [valid?, type, account, amount] }
    let(:valid?)      { false }
    let(:account)     { "Mabel" }
    let(:amount)      { 25 }

    context 'when the operation is Add' do
      let(:type) { :add }

      it 'has the appropriate account' do
        expect(subject.account).to eq(account)
      end

      context 'and the card is valid' do
        let(:valid?) { true }
        let(:change) { TransactionFactory.send(:add_proc).with(amount) }

        before do
          allow(LuhnCheck).to receive(:valid?).and_return(true)
          allow(TransactionFactory).to receive(:add_proc)
        end

        it 'requests the appropriate proc' do
          subject
          expect(TransactionFactory).to have_received(:add_proc)
        end
      end

      context 'and the card is invalid' do
        before do
          allow(LuhnCheck).to receive(:valid?).and_return(false)
          allow(TransactionFactory).to receive(:error_proc)
        end

        it 'requests the appropriate proc' do
          subject
          expect(TransactionFactory).to have_received(:error_proc)
        end
      end
    end

    context 'when the operation is Credit' do
      let(:type) { :credit }

      before do
        allow(TransactionFactory).to receive(:credit_proc)
      end

      it 'has the appropriate account' do
        expect(subject.account).to eq(account)
      end

      it 'requests the appropriate proc' do
          subject
          expect(TransactionFactory).to have_received(:credit_proc)
      end
    end

    context 'when the operation is Charge' do
      let(:type) { :charge }

      before do
        allow(TransactionFactory).to receive(:charge_proc)
      end

      it 'has the appropriate account' do
        expect(subject.account).to eq(account)
      end

      it 'has the appropriate proc' do
          subject
          expect(TransactionFactory).to have_received(:charge_proc)
      end
    end

    context 'when the operation name is invalid' do
      let(:type) { :delete }

      it 'raises an FormatError' do
        expect { subject }.to raise_error(NotImplementedError)
      end
    end
  end
end
