class WatirTumblr
  require 'Watir'
  attr_accessor :browser

  def initialize(web_browser)
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

  def media_via_text(icon,primary,secondary=nil)
    @browser.i(class: find_id(icon)).click
    if icon == 'link'
      @browser.divs(class: "editor-plaintext")[1].send_keys(primary)
      @browser.button(class: "create_post_button disabled").wait_while_present
    elsif icon == 'text' || icon == 'quote'
      @browser.div(class: "editor-plaintext").send_keys(primary)
      @browser.div(class: "editor-richtext").send_keys(secondary)
    else
      puts 'Please use Link, Text or Quote in first param'
    end
    @browser.button(class: "create_post_button").click
  end

  def media_via_url(icon,url)
    @browser.i(class: find_id(icon)).click
    @browser.div(class: "dropzone-add-url-icon").click
    @browser.div(class: "editor-plaintext").send_keys(url)
    @browser.element(class: "editor-plaintext").send_keys(:enter)
    @browser.button(class: "create_post_button disabled").wait_while_present
    @browser.button(class: "create_post_button").click
  end

  def media_via_file(icon,url)
    @browser.i(class: find_id(icon)).click
    @browser.file_field(name: icon).set(url)
    if icon == 'video'
      wait('video',:class,"vjs-tech")
      @browser.span(class: "binary_switch_button").click
    end
    if icon == 'audio'
      wait('div',:class,"audio_player_overlay")
      @browser.span(class: "binary_switch_button").click
    end
    @browser.button(class: "create_post_button disabled").wait_while_present
    @browser.button(class: "create_post_button").click
  end

  def display()
    @browser.goto "http://megamellowmagazinepatrol.tumblr.com/"
    wait('header',:id,"header")
  end

  def delete()
    @browser.div(class: "close button").click
    wait('nav',:id,"post_buttons")
    @browser.div(class: "creator").click
    @browser.div(class: "post_control delete show_label").click
    @browser.button(class: "ui_button btn_1").click
  end

  def delete_dashboard()
    login("tumblrtesting1991@hotmail.com","tumblrlogin")
    wait('nav',:id,"post_buttons")
    delete
  end

  def find_id(icon)
    case icon
    when "text"
      return "icon_post_text"
    when "photo"
      return "icon_post_photo"
    when "video"
      return "icon_post_video"
    when "quote"
      return "icon_post_quote"
    when "audio"
      return "icon_post_audio"
    when "link"
      return "icon_post_link"
    else
      return "Please provide a valid media source"
    end
  end
end

class child << WatirTumblr

