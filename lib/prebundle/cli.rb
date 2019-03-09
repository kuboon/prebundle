require "thor"
class Ubuntu
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

module Prebundle
  class CLI < Thor
    desc "show", "Reads Gemfile on current dir and outputs required setup commands."
    def show
      # load Gemfile
      # get list of gems
      gems = ['mysql2']

      # get os/distribution
      klass = Ubuntu
      # get list of required packages
      # get install command
      # show result
      puts klass.new(gems).command # yum install mysql-devel
      puts "# prebundle show | sudo sh"
    end
  end
end

