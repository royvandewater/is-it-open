module GangplankHelper
  def formatted_time(time)
    time.to_s :pretty_time
  end

  def gangplank_status(gangplank)
    if gangplank.open?
      'Open'
    else
      'Closed'
    end
  end
end
