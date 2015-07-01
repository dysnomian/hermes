describe UIText do
  describe '#file_format_error' do
    subject { UIText.file_format_error(filename) }

    let(:filename) { "fnord.txt" }
    let(:text)     { "fnord" }

    before do
      allow(File).to receive(:read).with(filename).and_return(text)
    end

    it 'returns a Hermes::FileFormatError' do
      expect(subject.name).to eq("FileFormatError")
    end

    it 'has the appropriate filename' do
      expect(subject.filename).to eq(filename)
    end

    it 'has the appropriate text' do
      expect(subject.text).to eq(text)
    end
  end
end
