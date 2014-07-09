FactoryGirl.define do
  factory :galaxy do
    galaxy_name "GALAXY NAME"
    galaxy_type "LSB"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
    stars 7.1
    vcr 8.1
    n 9.1
    r0 10.1
    n_g 11.1
    r_0 12.1
    sigma0 13.1
  end

  factory :invalid_galaxy, parent: :galaxy do
    galaxy_name nil #if you put an int, Rails will convert it to a string
    galaxy_type nil
    distance "abc"
    luminosity "abc"
    scale_length "abc"
    mass_hydrogen "abc"
    mass_disk "abc"
    stars "abc"
    vcr "abc"
    n "abc"
    r0 "abc"
    n_g "abc"
    r_0 "abc"
    sigma0 "abc"
  end

  factory :galaxy_post, parent: :galaxy do
    galaxy_name "newest galaxy"
    galaxy_type "LSB"
    distance 2.1
    luminosity 3.1
    scale_length 4.1
    mass_hydrogen 5.1
    mass_disk 6.1
    stars 7.1
    vcr 8.1
    n 9.1
    r0 10.1
    n_g 11.1
    r_0 12.1
    sigma0 13.1
  end
end
