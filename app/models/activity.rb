class Activity < ApplicationRecord

  belongs_to :member

  CATEGORY = ["Art and Design", "Fashion", "Entertainment",  "Sports", "Wellness", "Nature", "Food and drink", "Lifestyle", "History", "Music", "Business", "Nightlife"]

  HOST_ARRANGEMENT_CATEGORY = %w(Meals Drinks Accommodations Tickets Transportation Equipment Snacks)
end
