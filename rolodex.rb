class Rolodex
	@@ids = 1
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		contact
	end

	def display_all
		@contacts.each { |contact| puts contact}		
	end

	def find_contact(id)
		@contacts.find { |contact| contact.id == id}
	end

	def delete_contact(id)
		deleted_contact = find_contact(id)
		@contacts.delete(deleted_contact)	
	end

	def display_attr(attr_to_display)
		@contacts.each do |contact|
			case attr_to_display
				when "first" then contact.first_name
				when "last" then contact.last_name
				when "email" then contact.email
				when "notes" then contact.notes
			end
		end	
	end

	def modify_contact(id)
		puts "Select an option:"
		puts "[1] Modify first name"
		puts "[2] Modify last name"
		puts "[3] Modify email"
		puts "[4] Modify notes"
		option = gets.chomp.to_i
		case option
			when 1 then modify_first(id)
			when 2 then modify_last(id)
			when 3 then modify_email(id)
			when 4 then modify_notes(id)
		end
	end

	def modify_first(id)
		puts "Type name:"
		name = gets.chomp
		contact = @contacts.find(id).first
		contact.first_name = name
	end
	
	def modify_last(id)
		puts "Type name:"
		name = gets.chomp
		contact = @contacts.find(id).first
		contact.last_name = name
	end

	def modify_email(id)
		puts "Type name:"
		email = gets.chomp
		contact = @contacts.find(id).first
		contact.email = email
	end

	def modify_notes(id)
		puts "Type name:"
		notes = gets.chomp
		contact = @contacts.find(id).first
		contact.notes = notes
	end
end
