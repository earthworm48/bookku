class AddColumnsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :subtitle, :string
    add_column :books, :big_image, :string
    add_column :books, :author, :string
    add_column :books, :published_date, :date
    add_column :books, :pages, :integer
    add_column :books, :language, :string
    add_column :books, :country, :string
    add_column :books, :rating_average, :integer
    add_column :books, :rating_count, :integer
    add_column :books, :publisher, :string
    add_column :books, :preview_link, :string
    add_column :books, :section, :string
  end
end
