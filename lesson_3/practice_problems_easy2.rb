=begin

1)
ages.include?("Spot")
or
ages.has_key?("Spot")
or
ages.member?("Spot")

2)
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

3)
ages.merge!(additional_ages)

4)
advice.include?("Dino")

5)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

6)
flintstones.push("Dino")
or
flintstones << "Dino"
or 
flintstones.concat(["Dino"])

7)
flintstones.concat(["Dino", "Hoppy"])

8)
advice.slice!(0, advice.index('house'))
without the "!", this would return the same value but keep
the original "advice" variable unchanged

9)
statement.count('t')

10)
title.center(40)

=end