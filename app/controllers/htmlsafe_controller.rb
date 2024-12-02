class HtmlsafeController < ApplicationController
  def index
    @html_content = "<strong>This is bold text</strong>"
    @links = Link.all
  end
end
