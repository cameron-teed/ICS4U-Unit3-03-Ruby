##
# Uses binary search to find where users number is indexed between 250 numbers
# between 0-999
#
# @author  Cameron Teed
# @version 1.0
# @since   2021-05-07
# frozen_string_literal: true

def search_function(user_array, user_number, low_index, high_index)# rubocop:disable Metrics/MethodLength
  # Checks if the number is in the index
  if low_index > high_index
    # Returns -1
    -1
  else
    # Finds the middle of the index
    mid_index = (low_index + high_index) / 2
    # Checks if the user number is greater than the midle index number
    if user_array[mid_index].to_i < user_number
      # Useses reccursion and adds one to the lowest index number
      search_function(user_array, user_number, low_index + 1, high_index)
      # Checks if the user number is less than the middle index number
    elsif user_array[mid_index].to_i > user_number
      # Uses reccursion and takes takes away one from the highest index number
      search_function(user_array, user_number, low_index, high_index - 1)
    else
      # Returns the index number of the inputted number
      mid_index
    end
  end
end

begin
  # Defines the max size
  max_number = 999
  # Defines the min size
  min_number = 0
  # Creates array
  user_array = Array.new(250)
  # Sets counter to 0
  first_counter = 0

  # Prints the program name
  puts 'Binary search program'

  # Adds a random number to the array
  while first_counter < user_array.size
    user_array[first_counter] = rand(min_number..max_number)
    # Adds one to counter
    first_counter += 1
  end
  # Sorts the array into numerical order
  final_array = user_array.sort!

  # Prints the list of numbers
  puts "\nSorted list of numbers: \n"
  puts final_array.join(', ')
  # Asks for user input
  puts "\nWhat number are you searching for in the array (integer between 0 and 999):"
  # Gets user input
  user_number = gets.chomp.to_i

  # Calls function and stores the index results
  search_results = search_function(user_array, user_number, min_number, user_array.size)

  # Checks if user inputted correct numbers
  if user_number >= 0 && user_number <= 999
    # Checks if user number is in the index
    if search_results > -1
      # Prints index number
      puts "\nYour number is in index: #{search_results}\n"
    else
      # Asks user to input other number
      puts "\nPlease enter a number in the index.\n"
    end
    # Tells user program is done
    puts "\nDone"
  else
    # Asks user to input other number
    puts "\nPlease enter a number between 0-999. "
  end
rescue StandardError
  # If the input cannot be converted into a int, tell the user that they need to input the correct numbers
  puts 'Please enter a valid input'
end
