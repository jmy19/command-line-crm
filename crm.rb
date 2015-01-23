require_relative './rolodex.rb'
require_relative './contact.rb'

class CRM
	attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an Attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
	end

	def main_menu
		puts "Welcome to #{@name}!"
		
		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end
	end

	def choose_option(option)
		case option
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all
			when 4 then display_one
			when 5 then display_attr
			when 6 then delete_contact
			when 7 
				puts "Goodbye!"
				return
		else 
			puts "Incorrect option, try again!"
		end
	end
	
	def add_contact
		puts "Provide contact details"
		
		print "First Name: "
		first_name = gets.chomp
		
		print "Last Name: "
		last_name = gets.chomp
		
		print "Email: "
		email = gets.chomp
		
		print "Notes: "
		notes = gets.chomp

		new_contact = Contact.new(first_name, last_name, email, notes)
		@rolodex.add_contact(new_contact)
	end

	def display_all
		@rolodex.display_all
	end

	def display_one
		puts "Enter id:"
		contact_id = gets.chomp.to_i
		puts @rolodex.find_contact(contact_id)
	end

	def delete_contact
		puts "Enter id:"
		contact_id = gets.chomp.to_i
		puts @rolodex.delete_contact(contact_id)
	end

	def display_attr
		puts "enter attribute to display ('first', 'last', 'email', or 'notes')"
		attr_to_display = gets.chomp.downcase
		@rolodex.display_attr(attr_to_display)
	end

	def modify_contact
		puts "Enter id:"
		contact_id = gets.chomp.to_i
		puts @rolodex.find_contact(contact_id)
		puts "confirm modification? 'Y' or 'N'"
		confirmation = gets.chomp.upcase
		if confirmation == "Y" then @rolodex.modify_contact(contact_id)
		end
	end
end

bitmaker = CRM.new("Bitmaker Labs CRM")
bitmaker.main_menu

