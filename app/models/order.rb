# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  validates :first_name, :last_name, :country, :prefecture, :address_1, :address_2, :credit_expiration, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'の形式が正しくありません。' }
  validates :postal_code, presence: true, format: { with: /\A\d{3}-?\d{4}\z/, message: 'の形式が正しくありません。' }
  validates :credit_name, presence: true, format: { with: /\A[A-Z\s-]+\z/, message: 'の形式が正しくありません。' }
  validates :credit_number, presence: true, format: { with: /\A(\d{4}-?){3}\d{4}\z/, message: 'の形式が正しくありません。' }
  validate :credit_expiration_must_be_valid
  validates :credit_cvv, presence: true, format: { with: /\A\d{3,4}\z/, message: 'の形式が正しくありません。3桁または4桁の数字を入力してください。' }

  def credit_expiration_must_be_valid
    return if credit_expiration.blank?

    unless credit_expiration.match(%r{\A(0[1-9]|1[0-2])/([0-9]{2})\z})
      errors.add(:credit_expiration, 'の形式が正しくありません。MM/YYの形式で入力してください。。')
      return
    end

    month, year = credit_expiration.split('/').map(&:to_i)
    expiration_date = Date.new(year + 2000, month, -1)

    return unless expiration_date < Time.zone.today.beginning_of_month

    errors.add(:credit_expiration, 'が切れています。')
  end
end
