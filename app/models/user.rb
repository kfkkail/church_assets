class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :org

  before_validation :setup_org

  protected

  def setup_org
    return unless org.nil?

    org = Org.create(name: 'New Org')
    self.org_id = org.id
  end
end
