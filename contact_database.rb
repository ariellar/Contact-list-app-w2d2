## TODO: Implement CSV reading/writing
# require "csv"
# require ""

class ContactDatabase
  @@fname_db = "contacts.csv"

  class << self
    def add_entry(contact)
      CSV.open("contacts.csv", "ab") do |csv|
        csv << contact.to_a
      end
    end

    def read_in_csv
      output = []
      CSV.foreach("contacts.csv") do |row|
        output << Contact.new(row[0], row[1], row[2], row[3])
      end
      output
      # @@contacts.all.sort_by(id)
    end

    def contact_duplicate?(email)
      duplicate = false
      @@contacts.each do |contact|
        duplicate = true if contact.email.downcase.include?(email)
      end
      duplicate
    end
  end
end



  # def initialize
  #   @name = name.to_s
  #   @email = email.to_s
  #   @id = id.to_i
  #   # @index = index




