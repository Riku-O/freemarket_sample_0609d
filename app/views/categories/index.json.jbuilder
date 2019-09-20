json.array! @sub_categories do |sub_category|
  json.id sub_category.id
  json.ancestry sub_category.ancestry
  json.name sub_category.name
end