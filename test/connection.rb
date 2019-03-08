require_relative 'helper'

test "model inherits Ohm.redis connection by default" do
  class C < Ohm::Model
  end

  assert_equal C.redis.connection[:id], Ohm.redis.connection[:id]
end

test "model can define its own connection" do
  class B < Ohm::Model
    self.redis = Redis.new(url: "redis://localhost:6379/1")
  end

  assert B.redis.connection[:id] != Ohm.redis.connection[:id]
end

