domain = 'http://localhost:3000/'
api = 'api/'
get = 'GET'
entity = {
  novel: :novels
}

puts 'VERB / URI'
puts "#{get} #{domain}#{api}#{entity[:novel]}/:id/publications?type"