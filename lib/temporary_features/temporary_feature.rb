module TemporaryFeatures
  class TemporaryFeature
    def initialize(id)
      settings = settings_for(id)
      settings ||= {}
      @start_time = settings["from"]
      @end_time   = settings["to"] || "2099-12-31 23:59:59 +01:00"
    end

    def enabled?
      now = Time.now
      return false unless @start_time
      (@start_time <= now) and (now <= @end_time)
    end

    private

    def settings_for(id)
      TemporaryFeatures.configuration.settings[id.to_s]
    end
  end
end
