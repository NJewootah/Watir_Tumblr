require 'spec_helper'

describe 'WatirTumblr' do
  let(:watir){WatirTumblr.new()}
  let(:close){watir.browser.close}
  let(:primary){"Nini is Awesome!"}
  let(:secondary){"Nini is always Awesome!"}
  let(:google){"http://google.com"}
  let(:wait_home){watir.wait('nav',:id,"post_buttons")}
  let(:wait_first){watir.wait('div',:class,"post_title")}
  let(:wait_user){watir.wait('header',:id,"header")}

  describe 'Set_Environment' do
    it "should open a firefox browser" do
      watir.open_Tumblr(:ff)
      expect(watir.browser.body.visible?).to eq(true)
      expect(watir.browser.body.text).to eq("")
      close
    end

    it "should login successfully to Tumblr" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      expect(watir.browser.nav(id: "post_buttons").visible?).to eq(true)
      close
    end
	end

  describe 'Text' do
    it "should upload a TEXT to Tumblr" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.upload("Text",primary,secondary)
      wait_first
      expect(watir.browser.div(class: "post_title").text).to include(primary)
      close
    end

    it "should display TEXT uploads on user page" do
      watir.open_Tumblr(:ff)
      watir.browser.goto "http://megamellowmagazinepatrol.tumblr.com/"
      wait_user
      expect(watir.browser.article(class: "text").visible?).to eq(true)
      expect(watir.browser.article(class: "text").text).to include(primary)
      close
    end

    it "should delete the uploaded TEXT from the dashboard" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.delete
      close
    end
  end

  describe 'Quote' do
    it "should upload a QUOTE to Tumblr" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.upload("Quote",primary,secondary)
      wait_first
      expect(watir.browser.div(class: "post_title").text).to include(primary)
      close
    end

    it "should display QUOTE uploads on user page" do
      watir.open_Tumblr(:ff)
      watir.browser.goto "http://megamellowmagazinepatrol.tumblr.com/"
      wait_user
      expect(watir.browser.article(class: "quote").visible?).to eq(true)
      expect(watir.browser.article(class: "quote").text).to include(primary)
      close
    end

    it "should delete the uploaded QUOTE from the dashboard" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.delete
      close
    end
  end

  describe 'Link' do

    it "should upload a LINK to Tumblr" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.upload("Link",google)
      wait_first
      expect(watir.browser.a(class: "link_title").text).to include('Google')
      close
    end

    it "should display LINK uploads on user page" do
      watir.open_Tumblr(:ff)
      watir.browser.goto "http://megamellowmagazinepatrol.tumblr.com/"
      wait_user
      expect(watir.browser.article(class: "link").visible?).to eq(true)
      expect(watir.browser.article(class: "link").text).to include('Google')
      close
    end

    it "should delete the uploaded LINK from the dashboard" do
      watir.open_Tumblr(:ff)
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.delete
      close
    end
  end

end