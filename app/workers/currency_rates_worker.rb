class CurrencyRatesWorker
  include Sidekiq::Worker

  def perform(frequency, reschedule = true)
    RateService.call

    frequency = DateTime.parse frequency
    frequency = (frequency + 1.day).change(hour: 7, min: 30)

    self.class.perform_at(frequency, frequency) if reschedule
  end
end
