require "test/unit"
require_relative "../lib/decipher/decipher"

class TestDecipher < Test::Unit::TestCase
  
  def test_decode
    input = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5"
    expected = "*CDC is the trademark of the Control Data Corporation."
    assert_equal(expected, Decipher.decode(input))
    
    input = "1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5"
    expected = "*IBM is a trademark of the International Business Machine Corporation."
    assert_equal(expected, Decipher.decode(input))
    
    input = "1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"
    expected = "*DEC is the trademark of the Digital Equipment Corporation."
    assert_equal(expected, Decipher.decode(input))
  end
  
end 
