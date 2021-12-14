class Test < ApplicationRecord

has_many :questions , :dependent => :destroy
has_many :options , :dependent => :destroy
serialize :questions
serialize :options
accepts_nested_attributes_for :questions
accepts_nested_attributes_for :options
end
