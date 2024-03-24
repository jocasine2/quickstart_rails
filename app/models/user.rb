# app/models/user.rb

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_one :natural_person
  
  # Adiciona a associação com NaturalPerson
  belongs_to :natural_person, optional: false

  # Permite atributos aninhados para NaturalPerson
  accepts_nested_attributes_for :natural_person
  
  def name
    natural_person.name if natural_person
  end

  def name
    natural_person.last_name if natural_person
  end

end
