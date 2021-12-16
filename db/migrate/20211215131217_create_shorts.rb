class CreateShorts < ActiveRecord::Migration[6.1]
  def change
    create_table :shorts do |t|
      t.string :url
      t.string :shorturl
      t.integer :clicked, default:0
      

      t.timestamps
    end
  end
end
