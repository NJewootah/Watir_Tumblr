require 'spec_helper'

describe 'WatirTumblr' do
  let(:watir){WatirTumblr.new()}

  describe 'Set_Environment' do
    it "should open the Tumblr login page" do
      watir.open_Tumblr(:ff)
      expect(watir.h1(id: "logo").visible?).to eq(true)
    end

    it "should login successfully to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      expect(watir.nav(id: "post_buttons").visible?).to eq(true)
    end
	end

end