require 'pry'
class Owner
  # code goes here
  @@owners = []
  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @@owners << self
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.size
  end

  def sell_pets
    pets.each_value do |pet_array| 
      pet_array.each {|pet| pet.mood = "nervous"}
    end
    self.pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)." 
  end

end
