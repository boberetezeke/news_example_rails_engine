class CreateErxtwoArticles < ActiveRecord::Migration
  def change
    create_table :erxtwo_articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
