module TemporaryFeatures
  module Helpers
    def temporary_feature(feature_id, &block)
      block.call if TemporaryFeature.new(feature_id).enabled?
    end
  end
end
