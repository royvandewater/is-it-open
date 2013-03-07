class window.Helpers
  @military_time: (time) =>
    moment(time)?.format 'HH:mm'

  @time: (time) =>
    moment(time).format 'h:mma'

  @status: (open) =>
    if open then 'Open' else 'Closed'
