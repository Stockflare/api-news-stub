describe SectorRelation do
  subject(:orm) { ROM.env }

  specify { expect { subject.relation(:sectors) }.to_not raise_error }

  describe '#by_code relation' do
    subject(:rel) { orm.relation(:sectors) }

    let(:code) { (50..59).to_a.sample }

    specify { expect(subject.by_code(code).to_a).to_not be_empty }

    specify { expect(subject.by_code(code).one[:code]).to eq code }

    specify { expect { subject.by_code(code).one! }.to_not raise_error }
  end

  describe '#children relation' do
    describe 'with code' do
      subject(:rel) { orm.relation(:sectors) }

      let(:code) { (50..59).to_a.sample }

      let(:exp) { /^#{code}[0-9]{2}$/ }

      specify { expect(subject.children(code).to_a).to_not be_empty }

      specify { expect(subject.children(code).to_a.sample[:code].to_s).to match exp }
    end

    describe 'without code' do
      subject(:rel) { orm.relation(:sectors) }

      let(:root_range) { 50..59 }

      let(:code) { root_range.to_a.sample }

      specify { expect(subject.children.to_a).to_not be_empty }

      specify { expect(root_range).to cover(subject.children.to_a.sample[:code]) }
    end
  end
end
