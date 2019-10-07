class BestDaySerializer
  def initialize(date)
    @date = date
  end

  def json
    {
      data: {
        id: 0,
        attributes: {
          best_day: @date.strftime('%Y-%m-%d')
        }
      }
    }
  end
end
