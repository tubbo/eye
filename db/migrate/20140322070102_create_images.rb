class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :file
      t.string :url
      t.references :user, index: true
      t.boolean :is_mirror, default: false

      t.timestamps
    end
  end
end
