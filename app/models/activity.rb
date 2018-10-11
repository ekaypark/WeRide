class Activity < ApplicationRecord
  belongs_to :member

  enum status: [ :draft, :pending, :approved, :signature ]

  CATEGORY = ["Art and Design", "Fashion", "Entertainment",  "Sports", "Wellness", "Nature", "Food and drink", "Lifestyle", "History", "Music", "Business", "Nightlife"]

  HOST_ARRANGEMENT_CATEGORY = %w(Meals Drinks Accommodations Tickets Transportation Equipment Snacks)

  MINIMUM_AGE_ARRAY = (2..21).to_a
  GROUPSIZE_ARRAY = (1..10).to_a
  TOTALTIME_ARRAY = [ "0:30", "1:00", "1:30","2:00","2:30","3:00","3:30","4:00","4:30","5:00","5:30","6:00","6:30","7:00","7:30","8:00","8:30","9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30" ]
end
