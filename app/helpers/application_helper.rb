require 'redcarpet'

module ApplicationHelper

  def markdown(text)
    options = [:hard_wrap,:no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end


  def is_logged_in
    return (current_user ? true : false)
  end


end
