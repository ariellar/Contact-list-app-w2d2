require "./contact.rb"
require "./contact_database"
require "csv"
require "pry"

cmd = ARGV[0]
puts cmd
Contact.load_all

def help
    puts "Here is a list of available commands:"
    puts "new  - Create a new contact"
    puts "list - List all contacts"
    puts "show - Show a contact based on their id (write id beside show)"
    puts "find - Find a contact based on their name (write their name beside find"
    puts "please write either new, list, show, or find"    
end


def email_exists?(email)
  exists = Contact.all.select  { |con| con.email == email }
  if exists
    puts "sorry it appears that there is a contact with that email already"
  end
end

#create a new contact on the contact list, should add to cvs
def add
  puts 'Please enter the email of the contact'
  email = STDIN.gets.chomp
# need to check if the email already exists
  puts 'Please enter the name of the contact'
  name = STDIN.gets.chomp 
  # phone_numbers = []
  phone = "not empty"
   # phone_numbers.empty?if
  puts 'if you wish to add only 1 phone number use the format <label: number>, for example' 
  puts 'mobile: 1231231234;'
  puts 'if you wish to add multiple phone numbers use the format mentioned above and separate your numbers with a ; for example'
  puts 'mobile: 1231231234; homephone: 9879879876;'
  phone = STDIN.gets.chomp

  # have to then split inputed gets.chomp phone into key and value and append to phone_array
  phone_numbers = phone.split(/\;\s/)

  # end
  puts phone_numbers
  # if Contact.contact_duplicate?(email)
    # puts "Contact already exists. Use 'find' to search for '#{email}'."
  # else

  puts Contact.create(name, email, phone_numbers)

  # end
end


def list
   Contact.all.each { |contact| puts contact}
end

def show(ind)
  match = Contact.all.select  { |con| con.id == ind }
  if match 
    puts match
  else
    puts "there is no contact with id: #{id}"
  end
end

def find(name)
  match = Contact.all.select  { |con| con.name == name }
  if match 
    puts match
  else
    puts "there is no contact with that name"
  end
end
# if contact.include? "#{name}"

  #   print 
# end




case cmd
  when "help" then help 
  when "new" then add
  when "list" then list
  when "show" then show(ARGV[1])
  when "find" then find(ARGV[1])  
  else puts "sorry I didn't get that"  
end














