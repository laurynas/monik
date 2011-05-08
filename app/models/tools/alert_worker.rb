# Tool to generate and send alerts
# rails runner "Tools::AlertWorker.run"
class Tools::AlertWorker

  # Executes alert worker - generates & sends alerts
  def self.run
    logger.info "Running alert worker"

    Listener.in_alert_mode.find_each do |listener|
      self.send_alert(listener)
    end
  end

  protected

  def self.send_alert(listener)
    logger.info "Sending alert for listener: #{listener}"

    Notifier.deliver_alert(listener)
  end

  def self.logger
    Rails.logger
  end
end

