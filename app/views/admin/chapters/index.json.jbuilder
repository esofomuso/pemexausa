json.array!(all_chapters) do |admin_chapter|
  json.extract! admin_chapter, :id
  json.url admin_chapter_url(admin_chapter, format: :json)
end
