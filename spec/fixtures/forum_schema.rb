ActiveRecord::Schema.define do

 
  create_table "phpbb_sessions", :force => true do |t|
    t.string "session_id",             :limit => 255
    t.integer "session_user_id",       :limit => 3,   :default => 0,     :null => false
    t.integer "session_forum_id",      :limit => 3,   :default => 0,     :null => false
    t.integer "session_last_visit",                   :default => 0,     :null => false
    t.integer "session_start",                        :default => 0,     :null => false
    t.integer "session_time",                         :default => 0,     :null => false
    t.string  "session_ip",            :limit => 40,  :default => "",    :null => false
    t.string  "session_browser",       :limit => 150, :default => "",    :null => false
    t.string  "session_forwarded_for",                :default => "",    :null => false
    t.string  "session_page",                         :default => "",    :null => false
    t.boolean "session_viewonline",                   :default => true,  :null => false
    t.boolean "session_autologin",                    :default => false, :null => false
    t.boolean "session_admin",                        :default => false, :null => false
  end


  create_table "phpbb_users", :force => true do |t|
    t.integer "user_id",              :limit => 11
    t.integer "user_type",                :limit => 1,                                      :default => 0,           :null => false
    t.integer "group_id",                 :limit => 3,                                      :default => 3,           :null => false
    t.text    "user_permissions",         :limit => 16777215,                                                        :null => false
    t.integer "user_perm_from",           :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_ip",                  :limit => 40,                                     :default => "",          :null => false
    t.integer "user_regdate",                                                               :default => 0,           :null => false
    t.string  "username",                                                                   :default => "",          :null => false
    t.string  "username_clean",                                                             :default => "",          :null => false
    t.string  "user_password",            :limit => 40,                                     :default => "",          :null => false
    t.integer "user_passchg",                                                               :default => 0,           :null => false
    t.boolean "user_pass_convert",                                                          :default => false,       :null => false
    t.string  "user_email",               :limit => 100,                                    :default => "",          :null => false
    t.integer "user_email_hash",          :limit => 8,                                      :default => 0,           :null => false
    t.string  "user_birthday",            :limit => 10,                                     :default => "",          :null => false
    t.integer "user_lastvisit",                                                             :default => 0,           :null => false
    t.integer "user_lastmark",                                                              :default => 0,           :null => false
    t.integer "user_lastpost_time",                                                         :default => 0,           :null => false
    t.string  "user_lastpage",            :limit => 200,                                    :default => "",          :null => false
    t.string  "user_last_confirm_key",    :limit => 10,                                     :default => "",          :null => false
    t.integer "user_last_search",                                                           :default => 0,           :null => false
    t.integer "user_warnings",            :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_last_warning",                                                          :default => 0,           :null => false
    t.integer "user_login_attempts",      :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_inactive_reason",     :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_inactive_time",                                                         :default => 0,           :null => false
    t.integer "user_posts",               :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_lang",                :limit => 30,                                     :default => "",          :null => false
    t.decimal "user_timezone",                                :precision => 5, :scale => 2, :default => 0.0,         :null => false
    t.boolean "user_dst",                                                                   :default => false,       :null => false
    t.string  "user_dateformat",          :limit => 30,                                     :default => "d M Y H:i", :null => false
    t.integer "user_style",               :limit => 2,                                      :default => 0,           :null => false
    t.integer "user_rank",                :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_colour",              :limit => 6,                                      :default => "",          :null => false
    t.integer "user_new_privmsg",                                                           :default => 0,           :null => false
    t.integer "user_unread_privmsg",                                                        :default => 0,           :null => false
    t.integer "user_last_privmsg",                                                          :default => 0,           :null => false
    t.boolean "user_message_rules",                                                         :default => false,       :null => false
    t.integer "user_full_folder",                                                           :default => -3,          :null => false
    t.integer "user_emailtime",                                                             :default => 0,           :null => false
    t.integer "user_topic_show_days",     :limit => 2,                                      :default => 0,           :null => false
    t.string  "user_topic_sortby_type",   :limit => 1,                                      :default => "t",         :null => false
    t.string  "user_topic_sortby_dir",    :limit => 1,                                      :default => "d",         :null => false
    t.integer "user_post_show_days",      :limit => 2,                                      :default => 0,           :null => false
    t.string  "user_post_sortby_type",    :limit => 1,                                      :default => "t",         :null => false
    t.string  "user_post_sortby_dir",     :limit => 1,                                      :default => "a",         :null => false
    t.boolean "user_notify",                                                                :default => false,       :null => false
    t.boolean "user_notify_pm",                                                             :default => true,        :null => false
    t.integer "user_notify_type",         :limit => 1,                                      :default => 0,           :null => false
    t.boolean "user_allow_pm",                                                              :default => true,        :null => false
    t.boolean "user_allow_viewonline",                                                      :default => true,        :null => false
    t.boolean "user_allow_viewemail",                                                       :default => true,        :null => false
    t.boolean "user_allow_massemail",                                                       :default => true,        :null => false
    t.integer "user_options",                                                               :default => 895,         :null => false
    t.string  "user_avatar",                                                                :default => "",          :null => false
    t.integer "user_avatar_type",         :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_avatar_width",        :limit => 2,                                      :default => 0,           :null => false
    t.integer "user_avatar_height",       :limit => 2,                                      :default => 0,           :null => false
    t.text    "user_sig",                 :limit => 16777215,                                                        :null => false
    t.string  "user_sig_bbcode_uid",      :limit => 8,                                      :default => "",          :null => false
    t.string  "user_sig_bbcode_bitfield",                                                   :default => "",          :null => false
    t.string  "user_from",                :limit => 100,                                    :default => "",          :null => false
    t.string  "user_icq",                 :limit => 15,                                     :default => "",          :null => false
    t.string  "user_aim",                                                                   :default => "",          :null => false
    t.string  "user_yim",                                                                   :default => "",          :null => false
    t.string  "user_msnm",                                                                  :default => "",          :null => false
    t.string  "user_jabber",                                                                :default => "",          :null => false
    t.string  "user_website",             :limit => 200,                                    :default => "",          :null => false
    t.text    "user_occ",                                                                                            :null => false
    t.text    "user_interests",                                                                                      :null => false
    t.string  "user_actkey",              :limit => 32,                                     :default => "",          :null => false
    t.string  "user_newpasswd",           :limit => 40,                                     :default => "",          :null => false
    t.string  "user_form_salt",           :limit => 32,                                     :default => "",          :null => false
    t.string  "user_openid",                                                                :default => "",          :null => false
  end


end
