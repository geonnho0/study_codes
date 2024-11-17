class Audience
  def initialize(bag)
    @bag = bag
  end

  def buy(ticket)
    @bag.hold(ticket)
  end
end
