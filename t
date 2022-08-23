[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex eeecf6b..ebdb44f 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -11,6 +11,7 @@[m [mgem "simple_form"[m
 gem "pg"[m
 gem "puma", "~> 5.0"[m
 gem 'pry'[m
[32m+[m[32mgem 'devise'[m
 gem "importmap-rails"[m
 gem "turbo-rails"[m
 gem "stimulus-rails"[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 3d7e1eb..204b46e 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -70,6 +70,7 @@[m [mGEM[m
       public_suffix (>= 2.0.2, < 5.0)[m
     autoprefixer-rails (10.4.7.0)[m
       execjs (~> 2)[m
[32m+[m[32m    bcrypt (3.1.18)[m
     bindex (0.8.1)[m
     bootsnap (1.13.0)[m
       msgpack (~> 1.2)[m
[36m@@ -94,6 +95,12 @@[m [mGEM[m
     debug (1.6.2)[m
       irb (>= 1.3.6)[m
       reline (>= 0.3.1)[m
[32m+[m[32m    devise (4.8.1)[m
[32m+[m[32m      bcrypt (~> 3.0)[m
[32m+[m[32m      orm_adapter (~> 0.1)[m
[32m+[m[32m      railties (>= 4.1.0)[m
[32m+[m[32m      responders[m
[32m+[m[32m      warden (~> 1.2.3)[m
     diff-lcs (1.5.0)[m
     digest (3.1.0)[m
     erubi (1.11.0)[m
[36m@@ -165,6 +172,7 @@[m [mGEM[m
     nio4r (2.5.8)[m
     nokogiri (1.13.8-x86_64-linux)[m
       racc (~> 1.4)[m
[32m+[m[32m    orm_adapter (0.5.0)[m
     pg (1.4.3)[m
     popper_js (2.11.5)[m
     pry (0.14.1)[m
[36m@@ -211,6 +219,9 @@[m [mGEM[m
     regexp_parser (2.5.0)[m
     reline (0.3.1)[m
       io-console (~> 0.5)[m
[32m+[m[32m    responders (3.0.1)[m
[32m+[m[32m      actionpack (>= 5.0)[m
[32m+[m[32m      railties (>= 5.0)[m
     rexml (3.2.5)[m
     rspec-core (3.11.0)[m
       rspec-support (~> 3.11.0)[m
[36m@@ -271,6 +282,8 @@[m [mGEM[m
       railties (>= 6.0.0)[m
     tzinfo (2.0.5)[m
       concurrent-ruby (~> 1.0)[m
[32m+[m[32m    warden (1.2.9)[m
[32m+[m[32m      rack (>= 2.0.9)[m
     web-console (4.2.0)[m
       actionview (>= 6.0.0)[m
       activemodel (>= 6.0.0)[m
[36m@@ -296,6 +309,7 @@[m [mDEPENDENCIES[m
   bootstrap (~> 5.2.0)[m
   capybara[m
   debug[m
[32m+[m[32m  devise[m
   factory_bot_rails[m
   haml-rails (~> 2.0)[m
   importmap-rails[m
[1mdiff --git a/app/views/layouts/application.html.haml b/app/views/layouts/application.html.haml[m
[1mindex 1053d07..9baeeaa 100644[m
[1m--- a/app/views/layouts/application.html.haml[m
[1m+++ b/app/views/layouts/application.html.haml[m
[36m@@ -12,4 +12,5 @@[m
   %body[m
     .container[m
       = render 'shared/navs'[m
[32m+[m[32m      = render 'shared/messages'[m
       = yield[m
[1mdiff --git a/config/environments/development.rb b/config/environments/development.rb[m
[1mindex 8500f45..eeb6ab7 100644[m
[1m--- a/config/environments/development.rb[m
[1m+++ b/config/environments/development.rb[m
[36m@@ -40,6 +40,8 @@[m [mRails.application.configure do[m
   config.action_mailer.raise_delivery_errors = false[m
 [m
   config.action_mailer.perform_caching = false[m
[32m+[m[41m  [m
[32m+[m[32m  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }[m
 [m
   # Print deprecation notices to the Rails logger.[m
   config.active_support.deprecation = :log[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex f620d4a..6c08b3c 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,4 +1,5 @@[m
 Rails.application.routes.draw do[m
[32m+[m[32m  devise_for :users[m
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html[m
 [m
   # Defines the root path route ("/")[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex 1fd470f..c97d380 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -10,7 +10,7 @@[m
 #[m
 # It's strongly recommended that you check this file into your version control system.[m
 [m
[31m-ActiveRecord::Schema[7.0].define(version: 2022_08_18_234256) do[m
[32m+[m[32mActiveRecord::Schema[7.0].define(version: 2022_08_23_115048) do[m
   # These are extensions that must be enabled in order to support this database[m
   enable_extension "plpgsql"[m
 [m
[36m@@ -20,6 +20,18 @@[m [mActiveRecord::Schema[7.0].define(version: 2022_08_18_234256) do[m
     t.datetime "updated_at", null: false[m
   end[m
 [m
[32m+[m[32m  create_table "users", force: :cascade do |t|[m
[32m+[m[32m    t.string "email", default: "", null: false[m
[32m+[m[32m    t.string "encrypted_password", default: "", null: false[m
[32m+[m[32m    t.string "reset_password_token"[m
[32m+[m[32m    t.datetime "reset_password_sent_at"[m
[32m+[m[32m    t.datetime "remember_created_at"[m
[32m+[m[32m    t.datetime "created_at", null: false[m
[32m+[m[32m    t.datetime "updated_at", null: false[m
[32m+[m[32m    t.index ["email"], name: "index_users_on_email", unique: true[m
[32m+[m[32m    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true[m
[32m+[m[32m  end[m
[32m+[m
   create_table "words", force: :cascade do |t|[m
     t.string "content"[m
     t.datetime "created_at", null: false[m
