class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id    = attributes[:id]
    @name  = attributes[:name]
    @cured = attributes[:cured] || false
    @room  = attributes[:room] || nil
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
end
