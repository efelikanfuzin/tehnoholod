require "administrate/fields/base"

class CarrierwaveField < Administrate::Field::Base
  def to_s
    data
  end
end
