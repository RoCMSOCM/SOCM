FactoryGirl.define do
  factory :galaxy do
    galaxy_name "GALAXY NAME"
    galaxy_type "LSB"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1

    factory :galaxy_with_velocities do
      after(:create) do |galaxy, evaluator|
        create_list(:velocity, 1, galaxy: galaxy)
      end
    end
  end

  factory :invalid_galaxy, parent: :galaxy do
    galaxy_name nil
    galaxy_type nil
    distance "abc"
    luminosity "abc"
    scale_length "abc"
    mass_hydrogen "abc"
    mass_disk "abc"
  end

  factory :galaxy_post, parent: :galaxy do
    galaxy_name "newest galaxy"
    galaxy_type "LSB"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
  end

  factory :velocity do
    r 1
    vrot_data 2
    vrot_data_error 3
    galaxy
  end
end
