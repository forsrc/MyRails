class User < ApplicationRecord

  self.table_name = "users"
  self.primary_key = "id"

  validates :username, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { minimum: 5 }

  before_save :fun_create_on
  before_update :fun_update_on

  protected
  def fun_update_on
    # self.update_on = DateTime.parse(Time.now.strftime('%Y-%m-%d %H:%M:%S.%N').to_s
    self.update_on = Time.now.strftime('%Y-%m-%d %H:%M:%S.%N')
    self.version = self.version + 1
  end

  protected
  def fun_create_on

    unless create_on
      #self.create_on = DateTime.parse(Time.now.to_s).strftime('%Y-%m-%d %H:%M:%S.%N').to_s
      self.create_on = Time.now.strftime('%Y-%m-%d %H:%M:%S.%N')
      self.version = 1
    end

  end

end
