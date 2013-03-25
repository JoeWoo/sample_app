require "spec_helper"



describe RelationshipsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "创建一个 relationship with Ajax" do
    it "应增加一个 Relationship" do
      expect do
        xhr :post, :create, relationship: { followed_id: other_user
                                            .id }
      end.to change(Relationship, :count).by(1)
    end

    it "应响应一个成功" do
      xhr :post, :create, relationship: { followed_id: other_user.id }
      response.should be_success
    end
  end

  describe "删除一个 relationship with Ajax" do
    before { user.follow!(other_user) }
    let(:relationship) { user.relationships.find_by_followed_id(other_user) }

    it "应减少一个 Relationship" do
      expect do
        xhr :delete, :destroy, id: relationship.id
      end.to change(Relationship, :count).by(-1)
    end

    it "应响应一个成功" do
      xhr :delete, :destroy, id: relationship.id
      response.should be_success
    end


  end

end
