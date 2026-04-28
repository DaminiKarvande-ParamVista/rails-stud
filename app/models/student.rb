class Student < ApplicationRecord
#   include ImageVariantable

  has_one_attached :profile_image
  has_rich_text :description

  paginates_per 10

  has_many :blogs
  has_and_belongs_to_many :courses, join_table: "courses_students"
  has_many :student_projects
  has_many :projects, through: :student_projects

  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email_address, presence: true, uniqueness: true
  validates :permanent_contact, presence: true

  validate :validates_students_age

  before_create :display_greetings
  after_create :display_student_age

  def full_name
    "#{first_name} #{last_name}"
  end

  # THESE METHODS FIX YOUR ERROR

  def profile_thumb
    return unless profile_image.attached?
    variant_thumb(profile_image)
  end

  def profile_medium
    return unless profile_image.attached?
    variant_medium(profile_image)
  end

  def profile_large
    return unless profile_image.attached?
    variant_large(profile_image)
  end

  def self.ransackable_attributes(auth_object = nil)
    [
      "first_name",
      "last_name",
      "email_address",
      "permanent_contact",
      "alternative_contact",
      "date_of_birth",
      "local_address",
      "permanent_address",
      "created_at",
      "updated_at",
      "id"
    ]
  end

  private

  def profile_image_attached?
    profile_image.attached?
  end

  def generate_profile_image_variants
    generate_variants_for(profile_image)
  end

  def display_greetings
    Rails.logger.info "Welcome #{first_name} #{last_name}"
  end

  def display_student_age
    return unless date_of_birth.present?

    age = Date.today.year - date_of_birth.year
    Rails.logger.info "Age: #{age}"
  end

  def validates_students_age
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end