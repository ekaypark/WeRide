class Activity < ApplicationRecord
  belongs_to :member
  has_many_attached :images
  has_many :schedules

  scope :available, -> {joins(:schedules).where.not(schedules: {id: nil}).uniq}

  validates :member_id, :location, :category, :intro, :overview, :address01, :address02, :zipcode, :legal_requirement, :host_arrangement, :participant_preparation, :notes, :price, :title, :minimum_age, :how_active, :additional_requirement, :group_size, :total_time, presence: true
  validate :image_type
  validates_length_of :intro, minimum: 600
  validates_length_of :overview, minimum: 1200

  enum status: [ :draft, :pending, :approved, :signature ]

  CATEGORY = ["Art and Design", "Fashion", "Entertainment",  "Sports", "Wellness", "Nature", "Food and drink", "Lifestyle", "History", "Music", "Business", "Nightlife"]

  HOST_ARRANGEMENT_CATEGORY = %w(Meals Drinks Accommodations Tickets Transportation Equipment Snacks)

  MINIMUM_AGE_ARRAY = (2..21).to_a
  GROUPSIZE_ARRAY = (1..10).to_a
  TOTALTIME_ARRAY = [ "0:30", "1:00", "1:30","2:00","2:30","3:00","3:30","4:00","4:30","5:00","5:30","6:00","6:30","7:00","7:30","8:00","8:30","9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30" ]

  # def self.available
  #   joins(:schedules).where.not(schedules: {id: nil}).uniq
  # end

  def thumbnail input
    return self.images[input].variant(resize: '300x200').processed
  end

  def vertical input
    return self.images[input].variant(combine_options: { resize: "300<x400", extent: "300x400", background: "grey", gravity: "center"}).processed
  end

  private
  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end

    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'needs to be JPEG or PNG')
      end
    end
  end
end
