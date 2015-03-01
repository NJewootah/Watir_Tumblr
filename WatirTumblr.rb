class WatirTumblr
	require 'Watir'
  attr_accessor :browser

  def initialize()
  end

  def open_Tumblr(web_browser)
    @browser = Watir::Browser.new web_browser
  end

  def login(username,password)
    @browser.goto "http://tumblr.com/login"
    @browser.text_field(placeholder: "Email").send_keys(username)
    @browser.text_field(placeholder: "Password").send_keys(password)
    @browser.button(id: "signup_forms_submit").click
  end

  def wait(element,attribute,value)
    @browser.element(attribute => value).wait_until_present
  end

  def upload(icon,primary,secondary=nil)
    @browser.i(class: find_id(icon)).click
    if icon == 'Link'
      @browser.divs(class: "editor-plaintext")[1].send_keys(primary)
      @browser.button(class: "create_post_button disabled").wait_while_present
      @browser.button(class: "create_post_button").click
    elsif icon == 'Text' || icon == 'Quote'
      @browser.div(class: "editor-plaintext").send_keys(primary)
      @browser.div(class: "editor-richtext").send_keys(secondary)
      @browser.button(class: "create_post_button").click
    else
      puts 'Please use Link, Text or Quote in first param'
    end
  end

  def delete()
    browser.div(class: "close button").click
    browser.nav(id: "post_buttons").wait_until_present
    browser.div(class: "creator").click
    browser.div(class: "post_control delete show_label").click
    browser.button(class: "ui_button btn_1").click
  end

  def find_id(icon)
    case icon
    when "Text"
      return "icon_post_text"
    when "Photo"
      return "icon_post_photo"
    when "Video"
      return "icon_post_video"
    when "Quote"
      return "icon_post_quote"
    when "Audio"
      return "icon_post_audio"
    when "Link"
      return "icon_post_link"
    else
      return "Please provide a valid media source"
    end
  end
end
