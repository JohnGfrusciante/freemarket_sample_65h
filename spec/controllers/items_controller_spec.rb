require "rails_helper"

describe ItemsController do
  describe "GET #show" do
    it "show.html.hamlの呼び出しはできているか" do
    # idを引数にしてテストを書く。
      # get :show (1)
      # expect(response).to render_template :show
    end

    it "変数に正しい値が入っているか" do
      item= create(:item)
      get :show, params: {id: item}
    end
  end
end