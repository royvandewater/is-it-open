module GangplankHelper
  def gangplank_status(gangplank)
    if gangplank.open?
      'Open'
    else
      'Closed'
    end
  end
end
