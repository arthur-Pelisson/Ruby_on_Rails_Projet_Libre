class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true, :length => { :maximum => 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  Roles = [:admin, :client]

  def is?(requested_role)
    self.role == requested_role.to_s
  end

  enum role: [:guest, :client, :admin]

  after_initialize do
    if self.new_record? && self.role == nil
      self.role ||= :client
    end
  end
end
