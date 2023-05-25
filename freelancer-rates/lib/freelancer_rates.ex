defmodule FreelancerRates do
  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  @spec apply_discount(any, any) :: float
  def apply_discount(before_discount, discount) do
    ((100 - discount) / 100) * before_discount
  end

  def monthly_rate(hourly_rate, discount) do
    ceil apply_discount(22 * daily_rate(hourly_rate), discount)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    one_day_rate = apply_discount(daily_rate(hourly_rate), discount)
    days = budget / one_day_rate
    (trunc(days * 10)) / 10
  end
end
