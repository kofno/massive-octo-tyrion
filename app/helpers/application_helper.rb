module ApplicationHelper

  def account_nav_link_to(path, &block)
    link_to path, link_options(path), &block
  end

  def link_options(path)
    options = {}
    options[:class] = "active" if current_page? path
    options
  end

  def li_options(account)
    options = {}
    options[:class] = "active" if displaying_account?(account) 
    options
  end

  def displaying_account?(account)
    current_page? account_path(user_id, account.id)
  end
end
