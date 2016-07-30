class User < ApplicationRecord

  validates_uniqueness_of :username
  validates_presence_of :username
  validates_length_of :username, :minimum => 5, :maximum => 50
  validates_length_of :password, :in => 6..20
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Incorrect email format"
  validates_presence_of :status
  validates_inclusion_of :status, :in => 0..1, # %w{ 0 1 }
                         :message => "should be '0' -> (NG) or '1' -> (OK)"

  self.table_name = "users"
  self.primary_key = "id"

  validates :username, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { minimum: 5 }
  validates :version, presence: true,if: :fun_update_version_is_same?

  before_save :fun_create_on
  before_update :fun_update_on

  protected
  def fun_update_version_is_same?

    if version != self.version
      errors.add(:version, "version " + version.to_s + " not " + self.version.to_s)
      return
    end

  end

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
      self.status = 1
    end

  end

end
