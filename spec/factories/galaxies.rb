FactoryGirl.define do
  factory :galaxy do
    galaxy_name "GALAXY NAME"
    galaxy_type "LSB"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
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
end
