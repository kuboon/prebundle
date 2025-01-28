module OS
  class Base
    def initialize(gems)
      @gems = gems
    end
    def packages
      []
    end
    def command
      list = packages
      return if list.empty?
      build_command(list)
    end
    def build_command(packages)
      raise "not impl"
    end
  end

  class Linux < Base; end

  class Debian < Linux
    def packages
      @gems.map do |gem|
        case gem
        when 'curses'; "libncursesw5-dev"
        when 'mysql2'; "libmysqlclient-dev"
        when 'pg'; 'libpq-dev'
        when 'sqlite3'; %w[libsqlite3-dev pkg-config]
        end
      end.flatten.compact.uniq
    end
    def build_command(packages)
      "apt install -y #{packages.join(' ')}"
    end
  end

  class Ubuntu < Debian; end

  class CentOS < Linux
    def packages
      @gems.map do |gem|
        case gem
        when 'mysql2'; "mysql-devel"
        end
      end.flatten.uniq
    end
    def build_command(packages)
      "yum install #{packages.join(' ')}"
    end
  end
  
  class AmazonLinux < CentOS
  end

  class Fedora < Linux
    def build_command(packages)
      "dnf install #{packages.join(' ')}"
    end
  end

  class FreeBSD < Base
    def build_command(packages)
      "pkg install #{packages.join(' ')}"
    end
  end
end
