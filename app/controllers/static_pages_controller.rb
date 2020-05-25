class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
    temp_user = current_user
    @temp_uesrname = "FUUUUCk " + temp_user.displayname
  end

  def about
  end
end
