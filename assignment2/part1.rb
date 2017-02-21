array_1 = [2, 4, 6, 8, 10]
array_2 = [1, 5, 6, 8, 11, 12]

hash_1 = {a: 'a', b: 'b', c: 'c', d: 'd', e: 'e'}
hash_2 = {x: '10', y: '20', z: '30'}

puts "Q.1. Print 'Hello World' 10 times"
for k in 1..10 do
puts "Hellow World"
end


puts "Q.2. Print number from 30 to 40"
for k in 30..40 do
puts k
end

puts "Q.3. Comabine array_1 & array_2 and make elements it uniq"
puts array_1 | array_2

combined_array=array_1+array_2

puts "Q.4.  Combine array_1 & array_2 and keep only even element"
puts (combined_array).delete_if &:odd?

puts "Q.5.  Combine array_1 & array_2 and delete elements if greater than 8"
puts (combined_array).delete_if {|n| n>8}

puts "Q.6.  array_1 make cubes of all elements and add them "
add_count=0
array_1.each { |n| add_count=add_count+(n**3) }
puts add_count

puts "Q.7.  Combine array_1 & array_2 and find index of '8'"
combined_array.each_with_index {|val, index| puts "#{val} => #{index}" if val==8 }

puts "Q.8. array_1: add 5 to each element"
puts array_1.map {|item| item + 5}

puts "Q.9. combine hash_1 & hash_2"
puts hash_1.merge(hash_2)

puts "Q.10. replace values of hash_1 with elements from array_1"
i=0
hash_new=hash_1.dup
puts hash_new.each { |k, v| hash_new[k] = array_1[i];i += 1}

puts "Q.11. Make sum of integer values of hash_2"
value=0
hash_2.each { |k, v| value=value+v.to_i}
puts value

puts "Q.12. Make upcase of all values of hash_1"
hash_upp=hash_1.dup
puts hash_upp.each { |k, v| hash_upp[k] = v.upcase}












