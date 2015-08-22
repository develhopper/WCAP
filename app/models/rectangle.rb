class Rectangle < ActiveRecord::Base
  belongs_to :gonogo

  enum state: [:blue_vertical, :green_vertical, :blue_horizontal, :green_horizontal]
end
