Factory.define :reservation do |f|
  f.association :book
  f.state 'free'
  f.email 'library@eficode.com'
end