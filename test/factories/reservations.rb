Factory.define :reservation do |f|
  f.association :book
  f.association :user
  f.state 'free'
end