require 'spec_helper'

describe 'WatirTumblr' do
  let(:watir){WatirTumblr.new(:ff)}
  let(:close){watir.browser.close}
  let(:primary){"Nini is Awesome!"}
  let(:secondary){"Nini is always Awesome!"}
  let(:google){"http://google.com"}
  let(:wait_home){watir.wait('nav',:id,"post_buttons")}

  describe 'Set_Environment' do
    it "should open a firefox browser" do
      watir
      expect(watir.browser.body.visible?).to eq(true)
      expect(watir.browser.body.text).to eq("")
      close
    end

    it "should login successfully to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      expect(watir.browser.nav(id: "post_buttons").visible?).to eq(true)
      close
    end
	end

  describe 'Text' do
    it "should upload a text to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_text("text",primary,secondary)
      watir.browser.div(class: "post_title").wait_until_present
      expect(watir.browser.div(class: "post_title").text).to include(primary)
      close
    end

    it "should display text uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "text").visible?).to eq(true)
      expect(watir.browser.article(class: "text").text).to include(primary)
      close
    end

    it "should delete the uploaded text from the dashboard" do
      watir.delete_dashboard
      close
    end
  end

  describe 'Quote' do
    it "should upload a quote to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_text("quote",primary,secondary)
      watir.browser.div(class: "post_title").wait_until_present
      expect(watir.browser.div(class: "post_title").text).to include(primary)
      close
    end

    it "should display quote uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "quote").visible?).to eq(true)
      expect(watir.browser.article(class: "quote").text).to include(primary)
      close
    end

    it "should delete the uploaded quote from the dashboard" do
      watir.delete_dashboard
      close
    end
  end

  describe 'Link' do
    it "should upload a link to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_text("link",google)
      watir.browser.div(class: "link_text").wait_until_present
      expect(watir.browser.div(class: "link_text").text).to include('Google')
      close
    end

    it "should display link uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "link").visible?).to eq(true)
      expect(watir.browser.article(class: "link").text).to include('Google')
      close
    end

    it "should delete the uploaded link from the dashboard" do
      watir.delete_dashboard
      close
    end
  end

  describe 'Video' do
    it "should upload a video to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_url("video","https://www.youtube.com/watch?v=sN6ZgBJOTO4")
      watir.browser.iframe(class: "embed_iframe").wait_until_present
      close
    end

    it "should display video uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "video").visible?).to eq(true)
      expect(watir.browser.iframe(src: "https://www.youtube.com/embed/sN6ZgBJOTO4?feature=oembed&enablejsapi=1&origin=http://safe.txmblr.com&wmode=opaque").visible?).to eq(true)
      close
    end

    it "should delete the uploaded video from the dashboard" do
      watir.delete_dashboard
      close
    end

    it "should upload a video to Tumblr via a file" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_file("video","C:/Users/Academy5/Videos/west.mp4")
      watir.browser.iframe(class: "embed_iframe").wait_until_present
      watir.delete
      close
    end
  end

  describe 'Photo' do
    it "should upload a photo to Tumblr" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_url("photo","https://pbs.twimg.com/profile_images/1847862599/Grad_LFC_Crest_twitter_400x400.jpg")
      watir.browser.img(class: "post_media_photo").wait_until_present
      close
    end

    it "should display photo uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "photo").visible?).to eq(true)
      expect(watir.browser.img(height: "400").visible?).to eq(true)
      close
    end

    it "should delete the uploaded photo from the dashboard" do
      watir.delete_dashboard
      close
    end

    it "should upload a photo to Tumblr via a file" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_file("photo","C:/Users/Academy5/Pictures/Sparta logo.png")
      watir.browser.img(class: "post_media_photo").wait_until_present
      watir.delete
      close
    end
  end

  describe 'Audio' do
    it "should upload an audio to Tumblr via a file" do
      watir.login("tumblrtesting1991@hotmail.com","tumblrlogin")
      wait_home
      watir.media_via_file("audio","C:/Users/Academy5/Music/sexbomb.mp3")
      watir.browser.div(class: "audio_player").wait_until_present
      close
    end

    it "should display audio uploads on user page" do
      watir.display
      expect(watir.browser.article(class: "audio").visible?).to eq(true)
      close
    end

    it "should delete the uploaded audio from the dashboard" do
      watir.delete_dashboard
      close
    end
  end
end

