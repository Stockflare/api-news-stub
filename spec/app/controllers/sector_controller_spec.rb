describe SectorController, type: :controller do
  describe 'a root call' do
    before { get '/' }

    specify { expect_json_types :array }

    specify { expect_status 200 }

    specify { expect(response).to_not be_empty }
  end

  describe 'a valid sector call' do
    let(:sector) { (50..54).to_a.sample }

    before { get "/#{sector}" }

    specify { expect_json_types :array }

    specify { expect_status 200 }

    specify { expect(response).to_not be_empty }
  end

  describe 'an invalid sector call' do
    let(:sector) { (70..74).to_a.sample }

    before { get "/#{sector}" }

    specify { expect_json_types :object }

    specify { expect_status 404 }

    specify { expect_json_types :object }

    specify { expect_json_types(error: :string) }
  end
end
