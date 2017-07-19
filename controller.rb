require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/students')
require_relative('./models/houses')


#index
get '/hogwarts' do 
  @students = Student.all()
  erb(:index)  
end

#new
get '/hogwarts/new' do
  @houses = House.all()
  erb(:new)
end

#index houses
get '/hogwarts/houses' do
  @houses = House.all
  erb(:index_houses)
end

#show item
get '/hogwarts/:id' do
  @students = Student.find(params[:id])
  @student = Student.new(@students)
    erb(:show)
end

#create
post '/hogwarts' do
  @students = Student.new(params)
  @students.save()
  redirect to '/hogwarts'
end



# delete item
post '/hogwarts/:id/delete' do
  student = Student.new(Student.find(params[:id]))
  student.delete()
redirect '/hogwarts'
end

# edit item
get '/hogwarts/:id/edit' do
  @student = Student.new(Student.find(params[:id]))
  @houses = House.all()
  erb(:edit)
end

#update item
post '/hogwarts/:id' do
   student = Student.new(Student.find(params[:id]))
   student.update()
   redirect to '/hogwarts'
end

# new houses
get '/hogwarts/houses/new' do
  erb(:new_houses)
end

#create houses
post '/hogwarts/houses' do
  @houses = House.new(params)
  @houses.save()
  redirect to '/hogwarts/houses'
end