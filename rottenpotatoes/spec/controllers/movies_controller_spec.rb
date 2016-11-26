require 'rails_helper'

describe MoviesController do
    describe "similar_movies" do
       it "Given a correct id" do
          @id = "1"
           @movie = double('test_movie', director: "Tester")
           expect(Movie).to receive(:find).with(@id).and_return(@movie)
           post :similar_movies, {:id => 1}
           expect(response).to render_template('similar_movies')
       end
       it "Given an incorrect id" do
          @id = "1"
          @movie = double('test_movie', director: "", title: "Blah")
          expect(Movie).to receive(:find).with(@id).and_return(@movie)
           post :similar_movies, {:id => 1}
           expect(response).to redirect_to(movies_path)
       end
    end
    
    describe "show" do
       it "Given an id" do
           @id = "1"
           expect(Movie).to receive(:find).with(@id).and_return(@movie)
           post :show, {id: 1}
           expect(response).to render_template('show')
       end
    end
    
    describe "new" do
        it "Given nothing" do
        end
    end
    
    describe "destroy" do
        it "Given a valid id" do
            @id = "1"
            @movie = double('test_movie', title: "Blah", destroy: 1)
            expect(Movie).to receive(:find).with(@id).and_return(@movie)
            post :destroy, {id: 1}
            expect(response).to redirect_to(movies_path)
        end 
    end
    
    describe "index" do
      it "Given title as ordering" do
        post :index, {sort: "title"}
        expect(assigns(:title_header)).to eq 'hilite'
      end
      it "Given release_date as ordering" do
        post :index, {sort: "release_date"}
        expect(assigns(:date_header)).to eq 'hilite'
      end
    end
end