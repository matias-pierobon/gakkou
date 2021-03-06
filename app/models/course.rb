# A course for the subject where the students will be able to
# enroll and sign up for tests
# it should only be one per year
class Course < ApplicationRecord
  has_many :enrollments
  has_many :tests

  validates :from, presence: true
  validates :to, presence: true
  validates :from, :to, overlap: true
  validate :valid_lapse

  def valid_lapse
    errors.add(:from, 'must be less than the end') if
      !from.nil? &&
      !to.nil? &&
      from >= to
  end

  delegate :year, to: :from
  delegate :month, to: :from

  def sorted_enrollments
    enrollments.sort_by(&:full_name)
  end

  def sorted_tests
    tests.sort_by(&:date)
  end

  def all_rest_students
    Student
      .all_except(enrollments.map { |enrollment| enrollment.student.id })
      .sort_by(&:full_name)
  end

  def ammount_students
    enrollments.size
  end

  def months
    ((to.to_time - from.to_time) / 1.month.second).ceil
  end

  def period
    case months
    when 12
      'anual'
    when 6
      'semester'
    when 4
      'quarter'
    when 3
      'trimester'
    when 2
      'bimester'
    end
  end

  def offset
    1 + (month / months).to_i
  end

  def human
    case months
    when 1
      I18n.l(from, format: :month)
    else
      I18n.l(from, format: :month).to_s + ' - ' +
        I18n.l(to, format: :month).to_s
    end
  end
end
