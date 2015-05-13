describe CreditCardValidationPolicy do
  let(:policy) { CreditCardValidationPolicy }

  describe ".validate" do
    subject { policy.validate(card_number) }

    context "when the card number is valid" do
      let(:card_number) { 4111111111111111 }

      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when the card is invalid" do
      let(:card_number) { 1234567890123456 }

      it "returns false" do
        expect(subject).to be_falsey
      end
    end
  end
end
