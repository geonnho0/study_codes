class Screening
  def initialize(movie, sequence, when_screened)
    @movie = movie
    @sequence = sequence
    @when_screened = when_screened
  end

  def start_time
    @when_screened
  end

  def sequence?(sequence)
    @sequence == sequence
  end

  def movie_fee
    @movie.fee
  end

  def reserve(customer, audience_count)
    Reservation.new(
      customer,
      self,
      calculate_fee(audience_count),
      audience_count
    )
  end

  private

  def calculate_fee(audience_count)
    @movie.calculate_fee(self).times(audience_count)
  end
end
