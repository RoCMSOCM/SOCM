FactoryGirl.define do
  factory :admin do
    email "some_admin@herpderp.com"
    password "herpderp"
    approved true
  end

  factory :super_user, parent: :admin do
    email "super_user@herpderp.com"
    password "herpderp"
    approved true
    super_user true
  end
end
