class Visit < ActiveRecord::Base
	
	belongs_to :location
	belongs_to :user

	validates :from_date, presence:true
	validates :user_name, presence:true, format: {with: /[A-Za-z\d]([-\w]{,498}[A-Za-z\d])?/i}
	validate :expiration_date_cannot_be_in_the_past
	validate :from_date_before_to_date

	def self.month_visits(month, year, value)
		location = Location.find(value)
		location.visits.where('extract(month from from_date) = ?', month).where('extract(year from from_date) = ?', year)
	end

	def expiration_date_cannot_be_in_the_past
	    if from_date.present? && from_date < Date.today
	      errors.add(:from_date,"can't be in the past")
	    end
  	end

  	def from_date_before_to_date
	    if from_date.present? && to_date.present? && to_date < from_date
	      errors.add(:from_date,"from_date can't be before to_date")
	    end
  	end

  	
end
