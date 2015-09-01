class AddGoFlagToBeautySalon < ActiveRecord::Migration
  def change
    add_column :beauty_salons, :go_flag, :boolean, default: false, null: false
  end
end
