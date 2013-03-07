class window.Helpers
  @time: (time) =>
    moment(time).format 'h:mma'

  @status: (open) =>
    if open then 'Open' else 'Closed'
