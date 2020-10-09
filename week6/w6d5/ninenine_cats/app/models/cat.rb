# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'

class Cat < ApplicationRecord
    COLOR = %w(black brown orange white)

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: {in: COLOR}
    validates :sex, inclusion: {in: %w(M F)}

    def age
       ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
    end

    has_many :cat_rental_request, dependent: :destroy
end
