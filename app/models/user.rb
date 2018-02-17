class User < ApplicationRecord
  include HasAttachedAvatar

  belongs_to :family, optional: true
  has_many :albums, through: :family
  has_many :photos, through: :albums

  validates_presence_of :first_name
  validates :family, presence: true, unless: :is_invited

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def my_albums
    Album.where(creator_id: self.id)
  end

  def has_family?
  	self.family.present?
  end

  def is_invited
  	self.invited_to_sign_up?
  end
end
