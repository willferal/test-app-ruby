# Be sure to restart your server when you modify this file.

Rails.application.config.session_store ActionDispatch::Session::CacheStore, key: '_metrodata_session', expire_after: 40.minutes
