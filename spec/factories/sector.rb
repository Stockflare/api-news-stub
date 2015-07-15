FactoryGirl.define do
  factory :sector do
    initialize_with { ROM.env.relation(:sectors).as(:sector).children(50).to_a.sample }
  end
end
