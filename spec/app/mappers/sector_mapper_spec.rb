describe SectorMapper do
  subject(:orm) { ROM.env }

  specify { expect { subject.relation(:sectors).as(:sector) }.to_not raise_error }

  describe 'return value' do
    let(:code) { (50..59).to_a.sample }

    specify { expect(subject.relation(:sectors).as(:sector).by_code(code).one!).to be_an_instance_of Sector }
  end

  describe 'mapped attributes' do
    let(:code) { (50..59).to_a.sample }

    let(:sector) { subject.relation(:sectors).by_code(code).one! }

    let(:name) { sector[:name] }

    specify { expect(subject.relation(:sectors).as(:sector).by_code(code).one!.name).to eq name }

    specify { expect(subject.relation(:sectors).as(:sector).by_code(code).one!.code).to eq code }
  end
end
