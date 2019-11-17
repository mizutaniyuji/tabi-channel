class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :title
      t.string :area
      t.string :creater_name

      t.timestamps
    end
  end
end
