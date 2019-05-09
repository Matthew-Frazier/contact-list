@contacts = ["Matt", "Amanda", "Johnny", "Bill"]

def main_menu
  puts 
  puts "--- Ruby Contact List ---"
  puts "1) Creat Contact"
  puts "2) Delete Contact"
  puts "3) Edit Contact"
  puts "4) View Contacts"
  puts "5) Exit"
  puts
  input = gets.strip
  case input
    when "1"
      create_contact
      main_menu
    when "2"
      delete_contact
      main_menu
    when "3"
      edit_contact
      main_menu
    when "4"
      view_contacts
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
  puts
  @contacts.each_with_index do |c, i|
    puts "#{i + 1}) #{c}"
  end
end

def create_contact
  puts
  puts "Add Contact Now"
  add_contact = gets.strip
  @contacts.push(add_contact)
end

def delete_contact
  puts
  puts "Select a contact to delete"
  view_contacts
  del = gets.to_i
  if del > 0 && del <= @contacts.length
    @contacts.delete_at(del - 1)
    puts "List after deletion"
    view_contacts
  else
    puts
    puts "Invalid Choice"
    view_contacts
  end
end

def edit_contact
  puts  
  puts "Select which contact number you wish to change"
  view_contacts
  edit_del = gets.to_i
  puts "You choose #{@contacts.fetch(edit_del - 1)}" 
  print "Make change >"
  edit_add = gets.strip
  if edit_del > 0 && edit_del <= @contacts.length
    @contacts[edit_del - 1] = edit_add
    view_contacts
  else
    puts
    puts "Invalid Choice"
    edit_contact
  end
end

main_menu