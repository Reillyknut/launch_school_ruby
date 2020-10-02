=begin
str = "The grass is green"
to return "grass", use:
str[4,5]

arr = ["a", "b", "c", "d", "e", "f", "g"]
arr[2, 3] = ["c", "d", "e"]
arr[2, 3][0] = "c"

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] = nil
arr[-6] = nil

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

can use arr.join(' ') to get the spaces between the words again.


str = "joe's favorite color is blue"
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'

arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
