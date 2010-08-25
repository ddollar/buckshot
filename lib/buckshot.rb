class Buckshot

  VERSION = "0.1.0"

  def self.start
    case environment
      when "development" then start_shotgun
      else                    start_thin
    end
  end

  def self.start_shotgun
    system "shotgun -s thin -p #{port} -E #{environment}"
  end

  def self.start_thin
    system "thin start -p #{port} -e #{environment}"
  end

private ######################################################################

  def self.environment
    ENV["RACK_ENV"] || "development"
  end

  def self.port
    (ENV["PORT"] || 3000).to_i
  end

end
