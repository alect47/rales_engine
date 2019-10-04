class RevenueSerializer
  # include FastJsonapi::ObjectSerializer
  def initialize(revenue)
    @revenue = revenue
  end

  #this makes custome serializer, can do for other things, assign whatever id we want
  def json
    {
      data: {
        id: 0,
        attributes: {
          revenue: @revenue.to_s
        }
      }
    }
  end
  # attribute :revenue do |object|
  #   object.to_s
  # end
end
