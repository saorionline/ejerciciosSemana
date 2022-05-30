#Write a Ruby program to get ruby version with patch number

puts "Ruby Version: " +RUBY_VERSION
puts "Ruby Patch Level: "+RUBY_PATCHLEVEL.to_s

#Write a Ruby program to display the current date and time

require 'date'
hora_actual = DateTime.now
hoyEnDia = hora_actual.strftime "%d/%m/%Y/%H:%M"
puts "Hoy es: "+hoyEnDia

#Write a Ruby program to create a new string which is n copies of a given string where n is a non-negative integer

def repetidor(str, n)
    return str*n
end

print repetidor('a', 1),"\n"
print repetidor('b', 2),"\n"
print repetidor('c', 3),"\n"

#Write a Ruby program which accept the radius of the circle: The perimeter is 31.41592 The area is 78.53981

radio = 5.0
perimetro = 0.0
area = 0.0
print "Digital el radio del circulo: "
radio = gets.to_f
perimetro = 2 * 3.141592653 * radio
area = 3.141592653 * radio * radio
puts "El perimetro de tu circulo es #{perimetro}"
puts "El area de tu circulo es #{area}"


