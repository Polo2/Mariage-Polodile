class Registry < ApplicationRecord
  belongs_to :wedding
  belongs_to :user
  belongs_to :accomodation
  has_many :guests, dependent: :destroy

  accepts_nested_attributes_for :guests
  validates :email, presence: true

  before_create :set_user_id

  # def status
  #   if @registry.guests.presence == true
  #     return "Confirmed"
  #   else
  #     return "Pending"
  #   end
  # end
  private

  def set_user_id
    @user = User.find_by_email(email.downcase)

    if @user.present?
      self.user_id = @user.id
    end
  end


end
