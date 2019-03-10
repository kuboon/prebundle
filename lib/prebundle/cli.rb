require "thor"


class Linux; end
class Ubuntu < Linux
  def initialize(gems)
    @gems = gems
  end

  def packages
    @gems.map do |gem|
      case gem
      when 'mysql2'; "libmysqlclient-dev"
      end
    end.flatten.uniq
  end

  def command
    "apt install -y #{packages.join(' ')}"
  end
end

class CentOS < Linux; end
class AmazonLinux < CentOS
#yum install mysql-devel
end


module Prebundle
  def self.distribution_class(hint = `lsb_release -sd`)
    case hint
    when /\AUbuntu/; Ubuntu
    else raise "Unknown distribution"
    end
  end

  def self.list_all_gems_in_Gemfile
    ["mysql2"]
  end

  class CLI < Thor
    desc "all", "Reads Gemfile on current dir and outputs required setup commands."
    def all
      gems = ::Prebundle::list_all_gems_in_Gemfile

      puts Prebundle::distribution_class.new(gems).command
      puts "# prebundle all | sudo sh"
      STDERR.puts "# Unless it helped you, please report the issue https://github.com/kuboon/prebundle/issues/new?assignees=kuboon&labels=&template=add-gem-package-info.md&title=[add]" 
    end

    desc "gem [gemname]", "outputs required setup commands for the gem"
    def gem(gemname)
    end
  end
end

