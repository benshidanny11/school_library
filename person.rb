require './decorate'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    true if @age >= 18
  end

  private :of_age?

  def can_use_services?
    true if of_age? or @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end


class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def can_use_services?
    @age > 18 || @parent_permission == true
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age > 18
  end
end
