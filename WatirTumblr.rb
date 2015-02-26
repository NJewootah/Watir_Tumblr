require 'Watir'

browser = Watir::Browser.new :ff
browser.goto "http://tumblr.com/login"

browser.text_field(placeholder: "Email").send_keys("tumblrtesting1991@hotmail.com")
browser.text_field(placeholder: "Password").send_keys("tumblrlogin")
browser.button(id: "signup_forms_submit").click

wait_nav_list = browser.nav(id: "post_buttons")
wait_nav_list.wait_until_present

browser.span(class: "new_post_label_text").click
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
