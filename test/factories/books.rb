Factory.define :book do |f|
  f.sequence(:title) { |n| "my_title_#{n}" }
  f.authors 'Efi Code'
  f.isbn '978-0-9776-1663-3'
  f.description 'Book description'
end
