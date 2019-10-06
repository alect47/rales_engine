class BestDaySerializer
  # include FastJsonapi::ObjectSerializer
  def initialize(date)
    @date = date
  end

  #this makes custome serializer, can do for other things, assign whatever id we want
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
  # attribute :revenue do |object|
  #   object.to_s
  # end
end
