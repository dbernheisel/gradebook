class PagesController < ApplicationController
  skip_before_action :require_login

  def about
  end

  def contact
  end
end
