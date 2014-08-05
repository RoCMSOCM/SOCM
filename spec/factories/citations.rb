FactoryGirl.define do
  factory :citation do
    author "some author"
    title "some title"
    journal "some journal"
    year 2014
    volume 1
    pages 1
    month "December"
    note "some note"
    key "some key"
    bibtex ""
  end

  factory :citation_post, parent: :citation do
    author "some author 2"
    title "some title 2"
    journal "some journal 2"
    year 2015
    volume 1
    pages 1
    month "December"
    note "some note"
    key "some key"
    bibtex ""
  end

  factory :invalid_citation, parent: :citation do
    author nil
    title nil
    journal nil
    year nil
    volume nil
    pages nil
    month nil
    note nil
    key nil
    bibtex ""
  end
end
