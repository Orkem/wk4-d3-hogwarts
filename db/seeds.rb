require_relative ('../models/students.rb')
require_relative ('../models/houses.rb')
Student.delete_all
House.delete_all

house1 = House.new({'name'=>'Gryffindor', 'logo'=>'http://vignette1.wikia.nocookie.net/harrypotter/images/8/8e/0.31_Gryffindor_Crest_Transparent.png/revision/latest?cb=20161124074004'})
house2 = House.new({'name'=>'Slytherin', 'logo'=>'https://vignette1.wikia.nocookie.net/pottermore/images/4/45/Slytherin_Crest.png/revision/latest?cb=20111112232353'})
house1.save()
house2.save()

student1 = Student.new({'first_name' => 'Stephen', 'last_name'=>'Beattie', 'house' => house1.id, 'age' => 28})
student2 = Student.new({'first_name' => 'Roman', 'last_name'=>'Murzakov', 'house' => house2.id, 'age' => 27})

student1.save()  
student2.save()


# p student1.find_house

  student1.delete
  # binding.pry
  # nil
  # p Student.all
# p House.all
# puts "==========================="
# p house1.find