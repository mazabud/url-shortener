class RemovePart < ActiveRecord::Migration[6.1]
  def change
    remove_column :shorts, :shorturl, :string
    remove_column :shorts, :clicked, :integer
    
  end
end
