class CreateBeautySalons < ActiveRecord::Migration
  def change
    create_table :beauty_salons do |t|
      t.text     :salon_name
      t.text     :salon_image
      t.timestamps
    end
  end
end
