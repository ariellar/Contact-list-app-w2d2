# has to have limitless number of phonenumbers 
# append to the string "1"


class Contact
@@contacts = [] 

  attr_reader :id, :name, :email, :phone_numbers

  def initialize(id, name, email, phone_numbers = nil)
    if phone_numbers
      puts "phone numbers are: " + phone_numbers.to_s
    end
    @id = id
    @name = name
    @email = email
    @phone_numbers = phone_numbers # phone_numbers - hashes, where the key is the label for the phonenumber value
  end

  def to_s
    # TODO: return string representation of Contact
    puts "#{@name} (email: #{@email}, phone numbers: #{@phone_numbers}, id: #{@id})"
  end

  def to_a
    numbers = ''
    @phone_numbers.each do |num| 
      if num
        numbers << num + '&'
      end
    end
    puts numbers
    numbers = numbers.slice(0..-2)
    puts numbers
    [@id, @name, @email, numbers]
  end
 
  ## Class Methods
  class << self
    def create(name, email, phone_numbers)
      id = @@contacts.length + 1 
      new_contact = self.new(id, name, email, phone_numbers)
      @@contacts << new_contact
      ContactDatabase.add_entry(new_contact)

      # TODO: Will initialize a contact as well as add it to the list of contacts
    end
 
    def find(name)
      print if contact.include? "#{name}"
    end

    def load_all
      @@contacts = ContactDatabase.read_in_csv
    end
 
    def all
      @@contacts
      # @@contacts.each { |id, name, email, phone_numbers| puts "#{id}: #{name} #{email} #{phone_numbers}"}
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      if self.include? "#{id}"
        puts self
      else
        puts "there is no contact with #{id}"
      end
    end
  end
end