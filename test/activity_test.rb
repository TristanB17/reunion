require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("ice_climbing", {Dave: 4})
    assert_instance_of Activity, activity
  end

  def test_activity_has_a_name
    activity = Activity.new("ice_climbing", {Dave: 4})

    assert_equal "ice_climbing", activity.name
  end

  def test_activity_has_participants
    activity = Activity.new("ice_climbing", {Dave: 4})

    assert_equal({Dave: 4 }, activity.participants)
  end

  def test_add_participants
    activity = Activity.new("ice_climbing", {Dave: 4})

    activity.add_participants(:Gerry, 5)
    assert_equal({Dave: 4, Gerry: 5}, activity.participants)
  end

  def test_get_cost
    activity = Activity.new("ice_climbing", {Dave: 15})

    activity.add_participants(:Gerry, 5)
    activity.get_cost
    assert_equal 20, activity.get_cost
  end

  def test_split_cost
    activity = Activity.new("ice_climbing", {Dave: 15})

    activity.add_participants(:Gerry, 5)
    activity.split_cost
    assert_equal 10, activity.split_cost
  end

  def test_get_owed
    activity = Activity.new("ice_climbing", {Dave: 15})

    activity.add_participants(:Gerry, 5)
    assert_equal [5, -5], activity.get_owed
  end
end
