require "thor"

module Prebundle
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc "all", "Reads Gemfile on current dir and outputs required setup commands."
    def all
      gems = ::Prebundle::list_all_gems_in_Gemfile

      STDERR.puts "# Unless this helped you, please report the issue https://github.com/kuboon/prebundle/issues/new?assignees=kuboon&labels=&template=add-gem-package-info.md&title=[add]" 
      puts Prebundle::distribution_class.new(gems).command
      puts "# prebundle all | sudo sh"
    end

    desc "gem [gemname]", "outputs required setup commands for the gem"
    def gem(gemname)
      STDERR.puts "# Unless this helped you, please report the issue https://github.com/kuboon/prebundle/issues/new?assignees=kuboon&labels=&template=add-gem-package-info.md&title=[add]" 
      puts Prebundle::distribution_class.new([gemname]).command
      puts "# prebundle gem #{gemname} | sudo sh"
    end

    desc "version", "outputs version"
    def version
      puts ::Prebundle::VERSION
    end

  end
end

