require 'spec_helper'

describe Citation do

  let!(:citation) { FactoryGirl.create(:citation) }

  it "should be a valid citation" do
    citation.should be_valid
  end

  it "should set bibtex after saving" do
    citation.bibtex.should eq(
                "@article{#{citation.author}+#{citation.year}"\
                "author = \"#{citation.author}\","\
                "title = \"#{citation.title}\","\
                "journal = \"#{citation.journal}\","\
                "year = \"#{citation.year}\","\
                "volume = \"#{citation.volume}\","\
                "number = \"#{citation.number}\","\
                "pages = \"#{citation.pages}\","\
                "month = \"#{citation.month}\","\
                "note = \"#{citation.note}\","\
                "key = \"#{citation.key}\""\
                "}"
              )
  end

  context "after initialize" do
    it "sets galaxy_ids_array" do
      galaxy = FactoryGirl.create(:galaxy)
      citation.galaxies << galaxy

      citation.galaxies.size.should eq(1)
      citation.galaxy_ids_array[0].should eq(citation.galaxies.first.id)
    end
  end
end
