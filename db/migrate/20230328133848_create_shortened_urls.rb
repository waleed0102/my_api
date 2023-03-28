class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|

      t.string :original_url
      t.string :access_code
      t.string :title
      t.string :fetched_count, default: 0

      t.timestamps
    end

    add_index :shortened_urls, :access_code
    add_index :shortened_urls, :fetched_count
  end
end
