require 'byebug'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

# puts deal_card
def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

# answer = get_user_input
# puts answer

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  sum = 0                 #initial round is always starting at 0
  2.times do              #going to call the deal_card method twice and add the totals to sum
    sum += deal_card
  end
  display_card_total(sum) #then I am going to call display_card_total method to display to user
  sum                     #return the sum value to be used somewhere else
end

# puts initial_round

def invalid_command
  puts "Please enter a valid command"
  prompt_user
end

def hit?(total)               #takes in the total of the users cards currently
  #debugger
  prompt_user                 #asks user to hit or stay
  answer = get_user_input     #stores user input as 'answer' variable
  #debugger
  if answer == 'h'
    new_card = deal_card
    total = new_card + total
    return total
  elsif answer == 's'
    new_card = 0
    return total
  else
    invalid_command
    hit?(total)
  end

  #return display_card_total(add_number + total)
end

#hit?(15)


#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
  until total > 21
    total = hit?(total)
    display_card_total(total)
  end
  end_game(total)
end
