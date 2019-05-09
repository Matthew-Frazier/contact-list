@contacts = [
  {first_name: "Matthew", last_name: "Frazier", phone: "111-111-1111"},
  {first_name: "Amanda", last_name: "Garcia", phone: "222-222-2222"},
  {first_name: "Jacob", last_name: "Garcia", phone: "333-333-3333"}
]

def main_menu
  puts 
  puts "--- Ruby Contact List ---"
  puts "1) View Contacts"
  puts "2) Create Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  puts "_________________________"
  print "> "
  input = gets.strip
  case input
    when "1"
      view_contacts
      main_menu
    when "2"
      create_contact
      main_menu
    when "3"
      edit_contact
      main_menu
    when "4"
      delete_contact
      main_menu
    when "5"
      puts "Goodbye"
      exit
    else
      puts "Invalid Input"
      main_menu
  end
end

def view_contacts
  puts "_________________________"
  puts "Current Contacts"
  @contacts.each_with_index do |c, i|
    puts "#{i + 1})\n Name: #{c[:first_name]} #{c[:last_name]}\n Phone: #{c[:phone]}"
  end # This whole do statment pulls the index + 1 then the first name value, the last name value, and then breaks the line with "\n" then putting the phone value underneath both names for each of the hashs in the array
  puts "_________________________"
end

def create_contact
  puts "_________________________"
  puts "Please enter your contact"
  print "Enter first name > "
  new_first_name = gets.strip
  print "Enter last name > "
  new_last_name = gets.strip
  print "Enter phone number > "
  new_phone = gets.strip
  add_contact = {
    first_name: "#{new_first_name}",
    last_name: "#{new_last_name}",
    phone: "#{new_phone}"}
  @contacts.push(add_contact)
  puts "\n---List after creation---\n"
  view_contacts
  main_menu
end

def delete_contact
  puts
  puts "Select a contact to delete"
  view_contacts
  del = gets.to_i
  if del > 0 && del <= @contacts.length
    @contacts.delete_at(del - 1)
    puts "\n---List after deletion---\n"
    view_contacts
  else
    puts
    puts "Invalid Choice"
    view_contacts
  end
end

def edit_contact
  puts "_________________________" 
  puts "Select contact number you wish to change"
  view_contacts
  print "> "
  edit_choice = gets.to_i
  if edit_choice > 0 && edit_choice <= @contacts.length
    puts "_________________________"
    puts "What do you want to change?"
    puts "1) Change First Name"
    puts "2) Change Last Name"
    puts "3) Change Phone Number"
    puts "4) Main Menu"
    puts "_________________________"
    print "> "
    choice = gets.strip
    case choice
    when "1"
      print "New First Name: "
      edit_new_first_name = gets.strip
      @contacts[edit_choice - 1][:first_name] = edit_new_first_name # This access the users choice in the array then accesses the first_name key in the hash of the selected index and then reassigning the value with their new input
      puts "\n---Contact List After Editing---\n"
      view_contacts
    when "2"
      print "New Last Name: "
      edit_new_last_name = gets.strip
      @contacts[edit_choice - 1][:last_name] = edit_new_last_name # This access the users choice in the array then accesses the last_name key in the hash of the selected index and then reassigning the value with their new input
      puts "\n---Contact List After Editing---\n"
      view_contacts
    when "3"
      print "New Phone Number: "
      edit_new_phone = gets.strip
      @contacts[edit_choice - 1][:phone] = edit_new_phone # This access the users choice in the array then accesses the phone key in the hash of the selected index and then reassigning the value with their new input
      puts "\n---Contact List After Editing---\n"
      view_contacts
    when "4"
      main_menu
    else
      puts "Invalid choice"
      edit_contact
    end
  else
    puts "Invalid choice"
    edit_contact
  end
end

main_menu