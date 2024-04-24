class CacheService
    def initialize(redis_client = Redis.new)
      @redis = redis_client
    end
  
    def get_cache(zip_code)
      @redis.get(zip_code)
    end
  
    def set_cache(zip_code, data, expiry_time = 30 * 60) # 30 minutes
      @redis.set(zip_code, data, ex: expiry_time)
    end
  end
  