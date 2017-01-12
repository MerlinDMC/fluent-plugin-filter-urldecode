require_relative '../test_helper'

class URLDecodeFilterTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
    @time = Fluent::Engine.now
  end

  CONFIG = %[
    fields field1,field2
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
    assert_equal ['field1', 'field2'], d.instance.fields
  end

  test 'decode' do
    es = emit(CONFIG, {
                'field1' => "1%202%203",
                'field3' => "1%202%203"
              })

    es.each { |time, record|
      assert_equal '1 2 3', record['field1']
      assert_equal '1%202%203', record['field3']
      assert_equal false, record.has_key?('field2')
    }
  end

end
