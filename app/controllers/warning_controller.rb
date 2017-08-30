class WarningController < ApplicationController
  def index
    @no_navbar = true
    @no_footer = true
    @full_page = true
  end
end
