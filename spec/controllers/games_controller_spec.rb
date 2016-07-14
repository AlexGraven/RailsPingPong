require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:game).attributes.except!('id')
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:game, :players_are_same).attributes.except!('id')
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all games as @games" do
      game = Game.create! valid_attributes
      get :index, {}, session: valid_session
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      game = Game.create! valid_attributes
      get :show, {id: game.to_param}, session: valid_session
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET #new" do
    it "assigns a new game as @game" do
      get :new, {}, session: valid_session
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "GET #edit" do
    it "assigns the requested game as @game" do
      game = Game.create! valid_attributes
      get :edit, {id: game.to_param}, session: valid_session
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, {game: valid_attributes}, session: valid_session
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, {game: valid_attributes}, session: valid_session
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, {game: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Game.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved game as @game" do
        post :create, {game: invalid_attributes}, session: valid_session
        expect(assigns(:game)).to be_a_new(Game)
      end

      it "re-renders the 'new' template" do
        post :create, {game: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:game).attributes.except!('id')
      }

      it "updates the requested game" do
        game = Game.create! valid_attributes
        put :update, {id: game.to_param, game: new_attributes}, session: valid_session
        game.reload
        expect(game.player_2_score).to eq new_attributes['player_2_score']
      end

      it "assigns the requested game as @game" do
        game = Game.create! valid_attributes
        put :update, {id: game.to_param, game: valid_attributes}, session: valid_session
        expect(assigns(:game)).to eq(game)
      end

      it "redirects to the game" do
        game = Game.create! valid_attributes
        put :update, {id: game.to_param, game: valid_attributes}, session: valid_session
        expect(response).to redirect_to(game)
      end
    end

    context "with invalid params" do
      it "assigns the game as @game" do
        game = Game.create! valid_attributes
        put :update, {id: game.to_param, game: invalid_attributes}, session: valid_session
        expect(assigns(:game)).to eq(game)
      end

      it "re-renders the 'edit' template" do
        game = Game.create! valid_attributes
        put :update, {id: game.to_param, game: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested game" do
      game = Game.create! valid_attributes
      expect {
        delete :destroy, {id: game.to_param}, session: valid_session
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      game = Game.create! valid_attributes
      delete :destroy, {id: game.to_param}, session: valid_session
      expect(response).to redirect_to(games_url)
    end
  end

end
