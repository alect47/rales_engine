class RevenueSerializer
  def initialize(revenue)
    @revenue = revenue
  end

  #this makes custome serializer, can do for other things, assign whatever id we want
  def json
    {
      data: {
        id: 0,
        attributes: {
          total_revenue: (@revenue.to_f/100).to_s
        }
      }
    }
  end
end
