class Contact < ActiveRecord::Base
  validates :email, :message, :name, :subject, presence: true
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, message: "Digite um email válido." }
end
