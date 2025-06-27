---@diagnostic disable: need-check-nil
--@ module = true

---@class lib
---@field RL RebooterLibrary
lib = reqscript('rebooter_library')
rl = lib.RL

local function assert_equal(actual, expected, message)
    if actual ~= expected then
        error(string.format("(X) %s: expected %s, got %s", message, tostring(expected), tostring(actual)))
    else
        print("[OK] " .. message)
    end
end

local function assert_nil(value, message)
    if value ~= nil then
        error(string.format("(X) %s: expected nil, got %s", message, tostring(value)))
    else
        print("[OK] " .. message)
    end
end

local function assert_true(value, message)
    if value ~= true then
        error(string.format("(X) %s: expected true, got %s", message, tostring(value)))
    else
        print("[OK] " .. message)
    end
end

local function assert_false(value, message)
    if value ~= false then
        error(string.format("(X) %s: expected false, got %s", message, tostring(value)))
    else
        print("[OK] " .. message)
    end
end

-- Test suite for iterable_proxy
local function test_iterable_proxy()
    print("\n=== Testing iterable_proxy ===\n")

    -- Test creating a new iterable proxy with a table
    local test_table = {a = 1, b = 2, c = 3}
    local proxy = rl.createIterableProxy(test_table)
    assert_equal(#proxy.iterable_array, 3, "iterable_array should have 3 elements")
    assert_equal(proxy.current_index, 1, "current_index should be initialized to 1")

    -- Test creating a new iterable proxy with nil
    local nil_proxy = rl.createIterableProxy(nil)
    assert_nil(nil_proxy, "Creating proxy with nil should return nil")

    -- Test creating an empty iterable proxy
    local empty_proxy = rl.createEmptyIterableProxy()
    assert_equal(#empty_proxy.key_array, 0, "Empty proxy should have empty key_array")
    assert_equal(#empty_proxy.iterable_array, 0, "Empty proxy should have empty iterable_array")
    assert_equal(empty_proxy.current_index, -1, "Empty proxy should have current_index of -1")

    -- Test next() method
    local values = {}
    local val = proxy:next()
    table.insert(values, val)
    val = proxy:next()
    table.insert(values, val)
    val = proxy:next()
    table.insert(values, val)

    -- Sort values since iteration order is not guaranteed
    table.sort(values)
    assert_equal(values[1], 1, "First value should be 1")
    assert_equal(values[2], 2, "Second value should be 2")
    assert_equal(values[3], 3, "Third value should be 3")

    -- Test next() returns nil when at the end
    assert_nil(proxy:next(), "next() should return nil when at the end")

    -- Test reset() method
    proxy:reset()
    assert_equal(proxy.current_index, 1, "reset() should set current_index to 1")

    -- Test add() method
    proxy:add("d", 4)
    assert_equal(#proxy.iterable_array, 4, "add() should increase iterable_array size")
    assert_equal(proxy.key_array["d"], 4, "add() should set the value in key_array")

    -- Test isClear() method
    assert_false(proxy:isClear(), "isClear() should return false for non-empty proxy")
    assert_true(empty_proxy:isClear(), "isClear() should return true for empty proxy")

    -- Test removeByKey() method
    proxy:removeByKey("a")
    assert_equal(#proxy.iterable_array, 3, "removeByKey() should decrease iterable_array size")
    assert_nil(proxy.key_array["a"], "removeByKey() should remove the key from key_array")

    -- Test removing a key before current_index
    proxy:reset()
    proxy:next() -- current_index = 2
    local prev_index = proxy.current_index
    proxy:removeByKey(proxy.iterable_array[1])
    assert_equal(proxy.current_index, prev_index - 1, "removeByKey() should decrease current_index when removing before it")

    -- Test clear() method
    proxy:clear()
    assert_equal(#proxy.iterable_array, 0, "clear() should empty iterable_array")
    assert_equal(proxy.current_index, -1, "clear() should set current_index to -1")
    assert_true(proxy:isClear(), "proxy should be clear after clear()")

    -- Test replaceKeyArray() method
    local replacement = {x = 10, y = 20, z = 30}
    proxy:replaceKeyArray(replacement)
    assert_equal(#proxy.iterable_array, 3, "replaceKeyArray() should update iterable_array size")
    assert_equal(proxy.current_index, 1, "replaceKeyArray() should reset current_index to 1")

    -- Test removing the last element
    local single_proxy = rl.createIterableProxy({single = "value"})
    single_proxy:removeByKey("single")
    assert_equal(#single_proxy.iterable_array, 0, "Removing last element should result in empty array")
    assert_equal(single_proxy.current_index, -1, "Removing last element should set current_index to -1")

    print("\n=== All iterable_proxy tests passed! ===\n")
end

-- Run the tests
test_iterable_proxy()
