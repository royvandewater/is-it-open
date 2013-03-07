class Gangplank < ActiveRecord::Base
  def open
    open_until && Time.now < open_until
  end
end
