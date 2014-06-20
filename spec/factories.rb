FactoryGirl.define do
  factory :galaxy do
    galaxy "GALAXY NAME"
    galaxy_type "ABC"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
    stars 7.1
    vcr 8.1
  end

  factory :invalid_galaxy, parent: :galaxy do
    galaxy nil #if you put an int, Rails will convert it to a string
    galaxy_type nil
    distance "abc"
    luminosity "abc"
    scale_length "abc"
    mass_hydrogen "abc"
    mass_disk "abc"
    stars "abc"
    vcr "abc"
  end

  factory :galaxy_post, parent: :galaxy do
    galaxy "newest galaxy"
    galaxy_type "ZYX"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
    stars 7.1
    vcr 8.1
  end
end
