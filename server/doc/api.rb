domain = 'http://localhost:3000/'
api = 'api/'
get = 'GET'
entity = {
  novel: :novels
}

puts 'VERB / URI'
puts "#{get} #{domain}#{api}#{entity[:novel]}/:id/publications?type"


novel: {
  characters:
    [:create, :index_novel, :destroy, :show, :index],
  staffs:
    [:create, :index, :destroy],
  publications:
    [:index],
  tags:
    [:create_novel, :index_novel, :destroy_novel],
  releases:
    [:create, :destroy_novel, :index_novel]
}
