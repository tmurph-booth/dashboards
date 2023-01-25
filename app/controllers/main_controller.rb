class MainController < ApplicationController
  def primary
    render({ :template => "index_templates/main.html.erb" })
  end
end
