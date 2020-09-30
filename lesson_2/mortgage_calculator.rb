def prompt(words)
  puts "***** #{words}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def valid_number?(num)
  float?(num) || integer?(num)
end

prompt("Welcome to my mortgage/car loan calculator!")

loop do # start of main loop
  prompt("Enter the total dollar amount of the loan:")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.to_f > 0 && valid_number?(loan_amount)
      break
    else
      prompt("Invalid number. Try again.")
    end
  end

  prompt("Enter the annual interest rate (in decimal form, eg: 0.05 for 5%):")
  apr = ''
  loop do
    apr = gets.chomp
    if apr.to_f <= 1 && valid_number?(apr)
      break
    else
      prompt("Invalid number. Try again.")
    end
  end

  prompt("Enter the duration of the loan in years:")
  loan_duration_years = ''
  loop do
    loan_duration_years = gets.chomp
    if loan_duration_years.to_f >= 0 && valid_number?(loan_duration_years)
      break
    else
      prompt("Invalid number. Try again.")
    end
  end

  duration_months = loan_duration_years.to_i * 12
  prompt("Your loan duration in months is #{duration_months}")

  month_interest = apr.to_f / 12
  prompt("Your monthly interest rate is #{month_interest.round(4) * 100}%")

  month_pay = loan_amount.to_f * 
              (month_interest / 
              (1 - (1 + month_interest)**(-duration_months)))
              
  prompt("Your monthly payment for this loan is $#{month_pay.round(2)}")

  prompt("Want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using my calculator! Goodbye!")
