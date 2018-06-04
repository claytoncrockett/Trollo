FactoryBot.define do
  factory :task do
    name "Learn Testing"
    priority 1
    description "MyText"
    list
    completed false
  end


  sequence :name do |x|
    name = %w[Task1, Task2, Task3, Task4].sample
  end


end
