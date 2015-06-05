cmd = ARGV[0]
puts cmd

def create
  puts "I will create"
end 

case cmd
  when "create" then create
  else puts "no commands"
end



