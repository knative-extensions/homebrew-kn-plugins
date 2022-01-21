require './kn/checksums'

RSpec.describe Kn::Checksums, '#sha256' do
  context 'for kn-event v1.1.1' do
    let(:version) { 'v1.1.1' }
    let(:org) { 'knative-sandbox' }
    let(:repo) { 'kn-plugin-event' }
    let(:instance) { described_class.new(org, repo, version) }
    subject { instance.digest(os, arch) }

    context 'for linux, amd64' do
      let(:os) { 'linux' }
      let(:arch) { 'amd64' }
      it { expect(subject).to eq('6f26315a746f844ff006b1dac4592612957fdcc5cc988e59af8b56811092950d') }
    end

    context 'for darwin, arm64' do
      let(:os) { 'darwin' }
      let(:arch) { 'arm64' }
      it { expect(subject).to eq('886885792969f299443d984d57ead9c30242b3c21fb62769903f86802575595a') }
    end
  end
end