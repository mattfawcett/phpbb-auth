require "#{RAILS_ROOT}/config/phpbb_auth_settings"

module PhpbbAuth  
  def current_user
    unless cookies["#{PHPBB_AUTH_COOKIE_NAME}_sid"].nil?
      @phpbb_session = PhpbbSession.find_by_session_id(cookies["#{PHPBB_AUTH_COOKIE_NAME}_sid"])
      unless @phpbb_session.nil? || !@phpbb_session.logged_in?
        local_user = eval(PHPBB_AUTH_LOCAL_USER_MODEL_NAME).find(:first, :conditions => {PHPBB_AUTH_REMOTE_LOCAL_IDENTIFIER => @phpbb_session.phpbb_user.send(PHPBB_AUTH_REMOTE_REMOTE_IDENTIFIER)})       
        if !local_user
          # We don't have the user registered in the local database, lets create them
          local_user = eval(PHPBB_AUTH_LOCAL_USER_MODEL_NAME).new(PHPBB_AUTH_REMOTE_LOCAL_IDENTIFIER => @phpbb_session.phpbb_user.send(PHPBB_AUTH_REMOTE_REMOTE_IDENTIFIER))
          unless PHPBB_AUTH_COLUMNS_TO_DUPLICATE.nil?
            PHPBB_AUTH_COLUMNS_TO_DUPLICATE.each do |remote_name, local_name|
              local_user.send("#{local_name}=", @phpbb_session.phpbb_user.send(remote_name))
            end
          end
          local_user.save!
        end
        return local_user
      end
    end
  end
end
