module Mogli
  class Client
    class << self
      def get_with_caching(*args)
        key = Digest.hexencode(args.collect{|a| a.to_s }.join(''))
        result = Rails.cache.fetch("fb_query_#{key}", :expire_in => 5.minutes) do
           get_without_caching(*args)
        end
      end   
      alias_method_chain :get, :caching
    end
  end
end