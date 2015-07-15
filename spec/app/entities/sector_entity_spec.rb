describe SectorEntity do
  subject { SectorEntity }

  it { is_expected.to represent(:name) }

  it { is_expected.to represent(:code) }
end
