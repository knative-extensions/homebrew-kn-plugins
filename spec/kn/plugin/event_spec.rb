require './kn/plugin/event'

RSpec.describe Kn::Plugin::Event do
  let(:version) { 'v1.1.1' }
  let(:instance) { described_class.new(version) }
  describe '#homepage' do
    subject { instance.homepage }
    it { is_expected.to eq 'https://github.com/knative-sandbox/kn-plugin-event' }
  end

  describe '#sha256' do
    before :each do
      uri = 'https://github.com/knative-sandbox/kn-plugin-event' +
        '/releases/download/knative-v1.1.1/checksums.txt'
      expect(Kn::OS).to receive(:mac?).and_return(false)
      expect(Kn::Net::Downloader).to receive(:get).with(uri).and_return <<~TXT
      6f26315  kn-none-linux-amd64
      12aac60  kn-none-darwin-amd64
      TXT
    end
    subject { instance.sha256 }
    it { is_expected.to eq '6f26315' }
  end
end
