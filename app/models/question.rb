class Question < ActiveRecord::Base

  def self.mental
    where(category: 'mental')
  end

  def self.technique
    where(category: 'technique')
  end

  def self.physical
    where(category: 'physical')
  end
end
