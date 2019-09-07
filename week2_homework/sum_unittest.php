<?php
require_once("index.php");
use PHPUnit\Framework\TestCase;

class SumTestCase extends TestCase
{
    public function test_tc1_expected_90()
    {
        echo "Test Case 1: Add Number to 90";
        $this->assertEquals(sum(90, 0, "test_result"), 90);
        $this->assertEquals(sum(45, 45, "test_result"), 90);
        $this->assertEquals(sum(40, 50, "test_result"), 90);
        $this->assertEquals(sum(80, 10, "test_result"), 90);
        $this->assertEquals(sum(15, 75, "test_result"), 90);
    }

    public function test_tc2_expected_bool()
    {
        echo "Test Case 2: Return True if summary is 90";
        $this->assertTrue(sum(90, 0, "test_bool"));
        $this->assertTrue(sum(45, 45, "test_bool"));
        $this->assertFalse(sum(89, 2, "test_bool"));
        $this->assertFalse(sum(66, 32, "test_bool"));
        $this->assertFalse(sum(39, 367, "test_bool"));
    }
}

?>