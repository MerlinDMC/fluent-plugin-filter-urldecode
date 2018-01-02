require_relative '../test_helper'

class URLDecodeFilterTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
    @time = Fluent::Engine.now
  end

  CONFIG = %[
    fields field1,field2,field4
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::FilterTestDriver.new(Fluent::URLDecodeFilter).configure(conf, true)
  end

  def emit(config, record)
    d = create_driver(config)
    d.run {
      d.emit(record, @time)
    }.filtered
  end

  test 'configure' do
    d = create_driver(CONFIG)
    assert_equal ['field1', 'field2', 'field4'], d.instance.fields
  end

  test 'decode' do
    es = emit(CONFIG, {
                'field1' => "1%202%203",
                'field3' => "1%202%203",
                'field4' => nil
              })

    es.each { |time, record|
      # keys should exist
      assert_equal record['field1'], '1 2 3'
      assert_equal record['field3'], '1%202%203'
      assert_equal record['field4'], nil

      # keys should not exist
      assert_equal record.has_key?('field2'), false
    }
  end

end
