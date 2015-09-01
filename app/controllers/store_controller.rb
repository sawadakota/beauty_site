class StoreController < ApplicationController
  def index
    @beauty_salons = BeautySalon.order('id ASC')
  end
end
