class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :file
      t.string :url
      t.string :source, default: 'file'
      t.references :user, index: true

      t.timestamps
    end
  end
end
