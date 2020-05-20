class StaticPagesController < ApplicationController
  def home

    @var = "FROM_STATIC_CONtrOLLER" + current_user.displayname

  end

  def about
  end
end
