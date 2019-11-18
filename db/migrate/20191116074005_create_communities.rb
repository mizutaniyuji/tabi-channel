class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :title
      t.string :area
      t.string :creater_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
