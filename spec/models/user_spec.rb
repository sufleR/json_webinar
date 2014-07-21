require 'spec_helper'

describe User do

  it { should validate_presence_of(:custom_fields) }
  # this is not working since it is trying to save string with 5 charcters
  #it { should ensure_length_of(:custom_fields).is_at_most(4) }


  let(:user) { build :user}


  describe "validates length of custom_fields" do
    context "when json have less than 4 keys" do
      it "should be valid" do
        expect(user.valid?).to be_true
      end
    end
    context "when json have less more 4 keys" do
      it "should not be valid" do
        user1 = User.new(custom_fields: { a: 1, b: 2, c: 3, d: 4, e: 5 } )
        expect(user1.valid?).to be_false
      end
    end
  end


end
