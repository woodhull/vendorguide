class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :oauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :facebook_token

  validates_presence_of :facebook_token


  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = ActiveSupport::JSON.decode(access_token.get('https://graph.facebook.com/me?'))
    if user = User.find_by_email(data["email"])
      user.update_attributes(:facebook_token => access_token.token)
      user
    else # Create an user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :facebook_token => access_token.token)
    end
  end

  def facebook_client
    @client ||= Mogli::Client.new(facebook_token)
  end

  def me
    @me ||= Mogli::User.find("me", facebook_client)
  end

end
