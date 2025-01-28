require "prebundle/version"
require "prebundle/os"

module Prebundle
  class Error < StandardError; end
  
  def self.distribution_class(hint = `lsb_release -sd`)
    case hint
    when /\AUbuntu/; OS::Ubuntu
    when /\ADebian/; OS::Debian
    else raise "Unknown distribution"
    end
  end

  def self.list_all_gems_in_Gemfile
    %w[mysql2 curses]
  end
end
