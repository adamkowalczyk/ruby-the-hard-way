## Animal is-a object look at the extra credit
class Animal
end

## Dog is an animal
class Dog < Animal

  def initialize(name)
    ## Dog has an init that takes name parameter
    @name = name
  end
end

## Cat is an animal
class Cat < Animal

  def initialize(name)
    ## as above
    @name = name
  end
end

## person is a class???
class Person

  def initialize(name)
    ## as above
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

## Employee is a person
class Employee < Person

  def initialize(name, salary)
    ## super calls the parent class with no arguments
    # then passes then appended parameters. saves re-writing whole init block
    # auto passes variables, unless written super() 
    super(name)
    ## ??
    @salary = salary
  end

end

## fish is a class
class Fish
end

## salmon is a fish
class Salmon < Fish
end

## halibut is a fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")

## satan is a cat
satan = Cat.new("Satan")

## mary is a person
mary = Person.new("Mary")

## mary has a pet which is a cat 
mary.pet = satan

## frank is an employee (which is a person) who has a name and salary
frank = Employee.new("Frank", 120000)

## frank has a pet called rover, who is a dog
frank.pet = rover

## flipper is a fish
flipper = Fish.new()

## crouse is a salmon, which is a fish
crouse = Salmon.new()

## harry is a halibut, which is a fish
harry = Halibut.new()