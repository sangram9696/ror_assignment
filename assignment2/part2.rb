puts "Q.1 write a method: 'compose' which takes two procs and returns a new proc which, when called, calls the first proc and passes its result into the second proc. both of the proc arguments takes a number argument"
def compose(n,square = Proc.new { |n| n * n } ,double = Proc.new { |n| n * 2 } )
 k=double.call(k)
 square.call(k)
end
puts compose(5)
puts

puts "Q.2 Write a lambda which takes first_name and last_name and returns full_name."
lambex = lambda { |first_name,second_name | "#{first_name} #{second_name}" }
puts lambex.call("Sangram","Desai")
puts