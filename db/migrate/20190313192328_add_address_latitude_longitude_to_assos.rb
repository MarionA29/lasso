class AddAddressLatitudeLongitudeToAssos < ActiveRecord::Migration[5.2]
  def change
    add_column :assos, :address, :string
    add_column :assos, :latitude, :float
    add_column :assos, :longitude, :float
  end
end
