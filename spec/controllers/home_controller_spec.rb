require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    context "with valid address" do
      let(:address) { "Drayton Grn, London W13 0LT, United Kingdom" }

      it "assigns the address" do
        get :index, params: { address: address }
        expect(response).to render_template("index")
      end

      it "assigns the forecast" do
        get :index, params: { address: address }
        expect(assigns(:forecast)).to include(
          :current_temp => a_kind_of(Numeric),
          :high => a_kind_of(Numeric),
          :low => a_kind_of(Numeric)
        )
      end

      it "assigns the address" do
        get :index, params: { address: address }
        expect(assigns(:address)).to eq(address)
      end
    end
  end
end
