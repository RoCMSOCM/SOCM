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
    galaxy_name nil #if you put an int, Rails will convert it to a string
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
