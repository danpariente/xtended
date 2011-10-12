class User < ActiveRecord::Base
  ROLES = %w[admin jobseeker employer]	
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  #has_many :messages
  #has_many :sent_messages, :class_name => 'Message', :foreign_key => 'user_id'
  #has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
  
  validates :username, :presence => true, :uniqueness => true
  validates_format_of :username, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :username, :maximum => 32
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   acts_as_messageable :table_name => "messages",
                       :required   => [:topic, :body],           
                       :class_name => "ActsAsMessageable::Message"           

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :role, :email, :password, :password_confirmation, :remember_me, :message_id
  
  def role_symbols
    [role.to_sym]
  end
  
  def role?(current_role)
    role == current_role.to_s	
  end
  
  def recv
  	# super
    Message.where(:r_hidden=>false).order("created_at DESC")
  end

  def sent
    Message.where(:s_hidden=>false).order("created_at DESC")
  end
end
