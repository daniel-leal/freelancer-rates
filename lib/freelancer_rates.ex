defmodule FreelancerRates do
  @work_hours 8.0
  @billabe_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @work_hours
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @billabe_days)
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget /
       (hourly_rate
        |> daily_rate()
        |> apply_discount(discount)))
    |> Float.floor(1)
  end
end
