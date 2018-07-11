# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, :inclusion => {:in => ['PENDING', 'APPROVED', 'DENIED'] }
  validates :start_date, :end_date, presence: true

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def overlapping_requests
    CatRentalRequest.
      where('start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?', self.start_date, self.end_date, self.start_date, self.end_date).
      where('cat_id = ?', self.cat_id).
      where('id != ?', self.id).
      select('*')
  end
end
