class AddPart < ActiveRecord::Migration[6.1]
  def change
    add_column :shorts, :shortcode, :string
    add_column :shorts, :redirectcount, :integer, default:0
  end
end
