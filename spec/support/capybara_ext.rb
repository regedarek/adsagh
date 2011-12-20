module CapybaraExt
  # Just a shorter way of writing it.
  def assert_seen(text, opts={})
    if opts[:within]
      within(selector_for(opts[:within])) do
        page.should have_content(text)
      end
    else
      page.should have_content(text)
    end
  end

  def assert_no_link_for!(id_or_text)
    lambda { find_link(id_or_text) }.should(raise_error(Capybara::ElementNotFound), "Expected there not to be a link for #{id_or_text.inspect} on page, but there was")
  end
  
  def flash_alert!(text)
    within("#flash_alert") do
      assert_seen(text)
    end
  end

  def flash_notice!(text)
    within("#flash_notice") do
      assert_seen(text)
    end
  end
  
  def selector_for(identifier)
    case identifier
    when :title
      "#title"
    when :name
      "#name"
    when :ad_content
      "#ad_content"
    when :price
      "#price"
    when :display_counter
      "#display_counter"
    when :email
    "#email"
    else
      pending "No selector defined for #{identifier}. Please define one in spec/support/capybara_ext.rb"
    end
  end
  
  # Just shorter to type.
  def page!
    save_and_open_page
  end
end

RSpec.configure do |config|
  config.include CapybaraExt
end