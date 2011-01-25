class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :oauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :facebook_token, :facebook_id, :first_name, :last_name

  validates_presence_of :facebook_token


  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = ActiveSupport::JSON.decode(access_token.get('https://graph.facebook.com/me?'))
    facebook_user = Mogli::User.find("me", Mogli::Client.new(access_token.token))
    user_attributes = {:facebook_token => access_token.token, :facebook_id => facebook_user.id, :first_name => facebook_user.first_name, :last_name => facebook_user.last_name}
    if user = User.find_by_email(data["email"])
      user.update_attributes(user_attributes)
      user
    else # Create an user with a stub password.
      User.create!({:email => data["email"], :password => Devise.friendly_token[0,20]}.merge(user_attributes))
    end
  end

  def name
    "#{first_name} #{last_name[0]}."
  end

  def facebook_client
    @client ||= Mogli::Client.new(facebook_token)
  end

  def me
    @me ||= Mogli::User.find("me", facebook_client)
  end

end
