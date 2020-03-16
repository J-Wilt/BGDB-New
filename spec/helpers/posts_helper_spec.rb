require 'rails_helper'

RSpec.describe PostsHelper, :type => :helper do

context '#contact_user_partial_path' do
  before(:each) do
    @current_user = create(:user, id: 1)
    helper.stub(:current_user).and_return(@current_user)
  end

  it "returns a contact_user partial's path" do
    helper.stub(:user_signed_in?).and_return(true)
    assign(:post, create(:post, user_id: create(:user, id: 2).id))
    expect(helper.contact_user_partial_path).to(
      eq 'posts/show/contact_user' 
    )
  end

  it "returns an empty partial's path" do
    helper.stub(:user_signed_in?).and_return(true)
    assign(:post, create(:post, user_id: @current_user.id))

    expect(helper.contact_user_partial_path).to(
      eq 'shared/empty_partial'
    )
  end

  it "returns an empty partial's path" do
    helper.stub(:user_signed_in?).and_return(false)
    expect(helper.contact_user_partial_path).to(
      eq 'posts/show/login_required'
    )
  end
end

context '#leave_message_partial_path' do
  it "returns an already_in_touch partial's path" do
    assign('message_has_been_sent', true)
    expect(helper.leave_message_partial_path).to(
      eq 'posts/show/contact_user/already_in_touch'
    )
  end

  it "returns an already_in_touch partial's path" do
    assign('message_has_been_sent', false)
    expect(helper.leave_message_partial_path).to(
      eq 'posts/show/contact_user/message_form'
    )
  end
end
    
end