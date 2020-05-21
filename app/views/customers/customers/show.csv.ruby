require 'csv'

CSV.generate do |csv|
  column_names = %w(name URL 詳細)
  csv << column_names
  @bookmarks.each do |bookmark|
    column_values = [
      bookmark.bookmark_name,
      bookmark.bookmark_url,
      bookmark.bookmark_description
    ]
    csv << column_values
  end
end