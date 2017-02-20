string_1 = "i am learning Ruby language."
string_2 = "why? Coz it's cool and I like it."

puts "Q1. Make string_1 capital case(not uppercase)"
puts string_1.capitalize

puts "Q2. Make string_1 lower case"
puts string_1.downcase

puts "Q3. Change the string_1's eace letter's case to opposite case."
puts string_1.swapcase

puts "Q4. Print string_1s characters count"
puts string_1.length

puts "Q5. Check if string_1 contains word 'ruby'"
if string_1.include? "ruby"
   puts "String includes 'ruby'"
else
puts "String not includes 'ruby'"
end

puts "Q6. Split string_2 by '?'"
puts string_2.split("?")

puts "Q7. Concat string_1 and string_2"
puts "#{string_1}#{string_2}"

puts "Q8 Concatenated string, change from 'I' to 'We' and make capital case"
new_str="#{string_1}#{string_2}"
new_str=new_str.sub('i', "We")
new_str=new_str.sub('am', "are")
new_str=new_str.sub('I', "We")
puts new_str 

puts "Q9. Convert string_1 to symbol"
puts string_1.gsub(/\s+/, "_").downcase.to_sym

puts "Q9. List methods available on strings"
puts "1. match(pattern) → matchdata or nil"
puts "2. length → integer"
puts "3. replace(other_str) → str"
puts "4. reverse → new_str"
puts "5. rstrip → new_str"

puts "Q10. Print strings length difference"
puts string_2.length-string_1.length

puts "Q11. Convert `nil` to array, string, float."
puts nil.to_a
puts nil.to_s
puts nil.to_f

puts "Q12. Print strings length difference"
def even_odd(number)
	if(number%2!=0)
		puts "Number is odd";
	else
		puts "Number is even";	
	end	
end




