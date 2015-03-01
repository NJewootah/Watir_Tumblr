class WatirTumblr
	require 'Watir'

  def initialize()
  end

  def open_Tumblr(web_browser)
    goto "http://tumblr.com/login"
  end

  def login(username,password)
    text_field(placeholder: "Email").send_keys(username)
    text_field(placeholder: "Password").send_keys(password)
    button(id: "signup_forms_submit").click
  end

  def wait(element,attribute,value)
    element(attribute: value).wait_until_present
  end
end
