# frozen_string_literal: true

$LOAD_PATH.prepend(File.expand_path(File.join(File.dirname(__FILE__), "lib")))

require "bundler/setup"
Bundler.require(:default)

require "member_sso"
