module OS
  class Base
    def initialize(gems)
      @gems = gems
    end
    def command
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
        end
      end.flatten.uniq
    end
    def command
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
    def command
      "yum install mysql-devel"
    end
  end
  
  class AmazonLinux < CentOS
  end

  class Fedora < Linux
    def command
      "dnf"
    end
  end

  class FreeBSD < Base
    def command
      "pkg"
    end
  end
end
