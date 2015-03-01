class WatirTumblr
	require 'Watir'

  def initialize(media)
  end

  def set_env(web_browser,username,password)
    browser = Watir::Browser.new :web_browser
    browser.goto "http://tumblr.com/login"
    browser.text_field(placeholder: "Email").send_keys(username)
    browser.text_field(placeholder: "Password").send_keys(password)
    browser.button(id: "signup_forms_submit").click
  end

  def wait(element,attribute,value)
    browser.element(attribute: value).wait_until_present
  end

  def handle_media(media)

  end

  def 


end


require 'Watir'

browser = Watir::Browser.new :ff
browser.goto "http://tumblr.com/login"

browser.text_field(placeholder: "Email").send_keys("tumblrtesting1991@hotmail.com")
browser.text_field(placeholder: "Password").send_keys("tumblrlogin")
browser.button(id: "signup_forms_submit").click

wait_nav_list = browser.nav(id: "post_buttons")
wait_nav_list.wait_until_present

browser.i(class: "icon_post_text").click
browser.div(class: "editor-plaintext").send_keys("Nini is Awesome!")
browser.div(class: "editor-richtext").send_keys("Nini has always been Awesome!")
browser.button(class: "create_post_button").click

browser.div(id: "post_112046810149").wait_until_present

browser.goto "http://megamellowmagazinepatrol.tumblr.com/"
if browser.h2(class: "title").text == "Nini is Awesome!" && browser.div(class: "body-text").text == "Nini has always been Awesome!"
  puts "Your message has successfuly been uploaded"
else
  puts "Your message has failed to upload"
end

browser.back
wait_nav_list.wait_until_present
browser.div(class: "close button").click

wait_nav_list.wait_until_present
browser.div(class: "creator").click
browser.div(class: "post_control delete show_label").click
browser.button(class: "ui_button btn_1").click

#Photo
#open photo link
browser.i(class: "icon_post_photo").click
browser.div(class: "dropzone-add-url-icon").click
browser.div(class: "editor-plaintext").send_keys("http://cdn1.theweek.co.uk/sites/theweek/files/3_liverpool_players_mark_hillsborough_tragedy_25_years_on.jpg")
browser.element(class: "editor-plaintext").send_keys(:enter)
browser.button(class: "editor-richtext").wait_until_present
browser.button(class: "create_post_button").click
wait_nav_list.wait_until_present

#browser.div(class: "photo-media-container--can-add").wait_until_present

#photo via file
browser.file_field(name: "photo").set("C:/Users/Academy5/Pictures/Sparta logo.png")


#Quote
browser.i(class: "icon_post_quote").click
browser.div(class: "editor-plaintext").send_keys("Nini is Awesome!")
browser.div(class: "editor-richtext").send_keys("Nini has always been Awesome!")

#link
browser.i(class: "icon_post_link").click
browser.div(class: "editor-plaintext")[1].send_keys("http://google.com")
browser.button(class: "create_post_button disabled").wait_while_present


#video via url
browser.i(class: "icon_post_video").click
browser.div(class: "dropzone-add-url-icon").click
browser.div(class: "editor-plaintext").send_keys("https://www.youtube.com/watch?v=sN6ZgBJOTO4")
browser.element(class: "editor-plaintext").send_keys(:enter)
browser.iframe(class: "embed iframe").wait_until_present
browser.button(class: "create_post_button").click

#video
browser.file_field(name: "video").set("C:/Users/Academy5/Videos/west.mp4")
browser.video(class: "vjs-tech").wait_until_present
browser.span(class: "binary_switch_button").click

#audio
browser.file_field(name: "audio").set("C:/Users/Academy5/Music/sexbomb.mp3")
browser.div(class: "audio_player_overlay").wait_until_present
browser.span(class: "binary_switch_button").click