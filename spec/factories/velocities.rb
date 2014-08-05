FactoryGirl.define do
  factory :valid_velocity, parent: :velocity do
    r 1
    vrot_data 2
    vrot_data_error 3
  end

  factory :velocity_post, parent: :velocity do
    r 1
    vrot_data 2
    vrot_data_error 3
  end

  factory :invalid_velocity, parent: :velocity do
    r nil
    vrot_data nil
    vrot_data_error nil
  end
end
