describe Sector do
  subject(:sector) { build(:sector) }

  it { should respond_to(:name) }

  it { should respond_to(:code) }

  specify { expect { subject.name = 'foo' }.to raise_error }

  specify { expect { subject.code = 51 }.to raise_error }

  specify { expect(subject.children).to_not be_empty }
end
