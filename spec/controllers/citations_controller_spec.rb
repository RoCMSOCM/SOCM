require 'spec_helper'

describe CitationsController do
  include Devise::TestHelpers

  let!(:citation) { FactoryGirl.create(:citation) }

  before (:each) do
    @current_admin = FactoryGirl.create(:admin)
    sign_in @current_admin
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response.status).to eq(200)
      response.should render_template :index
    end
  end

  context "GET show" do
    context "with valid ID" do
      before(:each) do
        Citation.stub(:find).and_return(citation)
        Citation.stub(:save).and_return(true)
      end

      it "returns a citation" do
        Citation.should_receive(:find).with(1).and_return(citation)
        citation = Citation.find(1)

        expect(citation.id).should_not be_nil
        expect(citation.author).to eq("some author")
        expect(citation.title).to eq("some title")
        expect(citation.journal).to eq("some journal")
        expect(citation.year).to eq(2014)
        expect(citation.volume).to eq(1)
        expect(citation.pages).to eq(1)
        expect(citation.month).to eq("December")
        expect(citation.note).to eq("some note")
        expect(citation.key).to eq("some key")
      end

      it "assigns the returned citation to @citation" do
        get :show, id: citation
        assigns(:citation).should eq(citation)
      end

      it 'renders the show view' do
        get :show, id: citation
        response.should render_template :show
      end
    end

    context "with invalid ID" do
      it "should return 404" do
        get :show, id: -1
        response.should render_template "errors/404"
      end
    end
  end

  context "POST create" do
    context "with valid params" do
      it "creates a new Citation" do
        citation_post = FactoryGirl.attributes_for(:citation_post)
        expect{
            post :create, citation: citation_post
        }.to change(Citation, :count)
      end
    end

    context "with invalid params" do
      before(:each) do
        @invalid_citation = FactoryGirl.attributes_for(:invalid_citation)
      end

      it "does not save the new citation" do
        expect{
            post :create, citation: @invalid_citation
        }.to_not change(Citation, :count)
      end

      it "renders the new form" do
        post :create, citation: @invalid_citation
        response.should render_template :new
      end
    end
  end

  context "PUT update/:id" do
    context "with valid attributes" do
      before(:each) do
        Citation.stub(:save).and_return(true)
        @attr = { :author => "author", :title => "title",
                  :journal => "journal", :year => 2014, :volume => 1, :pages => 1,
                  :month => "Dec", :note => "note", :key => "key"}
      end

      it "updates an existing Citation and gets a redirect response" do
        put :update, :id => citation.id, :citation => @attr
        citation.reload

        expect(response.status).to eq(302)
      end

      it "updates an existing Citation" do
        put :update, :id => citation.id, :citation => @attr
        citation.reload

        expect(citation.author).to eq("author")
        expect(citation.title).to eq("title")
        expect(citation.journal).to eq("journal")
        expect(citation.year).to eq(2014)
        expect(citation.volume).to eq(1)
        expect(citation.pages).to eq(1)
        expect(citation.month).to eq("Dec")
        expect(citation.note).to eq("note")
        expect(citation.key).to eq("key")
      end
    end

    context "with invalid attributes" do
      it "does not update the citation attributes" do
        put :update, id: citation, citation: FactoryGirl.attributes_for(:invalid_citation)
        citation.reload

        citation.author.should_not eq(nil)
        citation.title.should_not eq(nil)
        citation.journal.should_not eq(nil)
        citation.year.should_not eq(nil)
        citation.volume.should_not eq(nil)
        citation.pages.should_not eq(nil)
        citation.month.should_not eq(nil)
        citation.note.should_not eq(nil)
        citation.key.should_not eq(nil)
      end

      it "renders the edit view when receiving invalid attributes" do
        put :update, id: citation, citation: FactoryGirl.attributes_for(:invalid_citation)
        response.should render_template :edit
      end
    end
  end

  context "DELETE destroy" do
    it "deletes the citation" do
      expect{
        delete :destroy, id: citation
      }.to change(Citation, :count).by(-1)
    end

    it "redirects to citation#index" do
      delete :destroy, id: citation
      response.should redirect_to citations_url
    end
  end
end
