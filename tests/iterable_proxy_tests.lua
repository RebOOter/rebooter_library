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

    -- Test creating same-value proxy with nil array
    local nil_same_proxy = rl.createSameFromIterableIterableProxy(nil, "value")
    assert_nil(nil_same_proxy, "Creating same-value proxy with nil array should return nil")

    -- Test creating an empty iterable proxy
    local empty_proxy = rl.createEmptyIterableProxy()
    assert_equal(#empty_proxy.key_array, 0, "Empty proxy should have empty key_array")
    assert_equal(#empty_proxy.iterable_array, 0, "Empty proxy should have empty iterable_array")
    assert_equal(empty_proxy.current_index, -1, "Empty proxy should have current_index of -1")

    -- Test creating same-value proxy with empty array
    local empty_array = {}
    local empty_same_proxy = rl.createSameFromIterableIterableProxy(empty_array, "value")
    assert_equal(#empty_same_proxy.iterable_array, 0, "Same-value proxy with empty array should have empty iterable_array")
    assert_equal(empty_same_proxy.current_index, -1, "Same-value proxy with empty array should have current_index of -1")

    -- Test next() method which now returns key, value pairs
    local keys = {}
    local values = {}

    local key, val = proxy:next()
    table.insert(keys, key)
    table.insert(values, val)

    key, val = proxy:next()
    table.insert(keys, key)
    table.insert(values, val)

    key, val = proxy:next()
    table.insert(keys, key)
    table.insert(values, val)

    -- Sort both keys and values for consistent testing (since iteration order is not guaranteed)
    table.sort(keys)
    table.sort(values)

    -- Check that we got the expected keys
    assert_equal(keys[1], "a", "First key should be 'a'")
    assert_equal(keys[2], "b", "Second key should be 'b'")
    assert_equal(keys[3], "c", "Third key should be 'c'")

    -- Check that we got the expected values
    assert_equal(values[1], 1, "First value should be 1")
    assert_equal(values[2], 2, "Second value should be 2")
    assert_equal(values[3], 3, "Third value should be 3")

    -- Test next() returns nil, nil when at the end
    local key, val = proxy:next()
    assert_nil(key, "next() should return nil key when at the end")
    assert_nil(val, "next() should return nil value when at the end")

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

    -- Test that next() returns correct key-value pairs after replacement
    local keyValuePairs = {}
    while true do
        local k, v = proxy:next()
        if not k then break end
        keyValuePairs[k] = v
    end

    assert_equal(keyValuePairs.x, 10, "Should get correct value for key 'x'")
    assert_equal(keyValuePairs.y, 20, "Should get correct value for key 'y'")
    assert_equal(keyValuePairs.z, 30, "Should get correct value for key 'z'")

    -- Test createSameFromIterableIterableProxy function
    local source_array = { 20, 30, 40}
    local fixed_value = "fruit"
    local same_value_proxy = rl.createSameFromIterableIterableProxy(source_array, fixed_value)

    -- Verify the structure of the created proxy
    assert_equal(#same_value_proxy.iterable_array, 3, "iterable_array should have 3 elements")
    assert_equal(same_value_proxy.current_index, 1, "current_index should be initialized to 1")

    -- Check that all keys have the same value
    local key1, val1 = same_value_proxy:next()
    assert_equal(val1, fixed_value, "First value should be the fixed value")

    local key2, val2 = same_value_proxy:next()
    assert_equal(val2, fixed_value, "Second value should be the fixed value")

    local key3, val3 = same_value_proxy:next()
    assert_equal(val3, fixed_value, "Third value should be the fixed value")

    -- Check that the keys match the source array
    same_value_proxy:reset()
    local collected_keys = {}
    while true do
        local k, v = same_value_proxy:next()
        if not k then break end
        table.insert(collected_keys, k)
    end

    table.sort(collected_keys)
    assert_equal(collected_keys[1], 20, "First key should be '20'")
    assert_equal(collected_keys[2], 30, "Second key should be '30'")
    assert_equal(collected_keys[3], 40, "Third key should be '40'")

    -- Test removing the last element
    local single_proxy = rl.createIterableProxy({single = "value"})
    single_proxy:removeByKey("single")
    assert_equal(#single_proxy.iterable_array, 0, "Removing last element should result in empty array")
    assert_equal(single_proxy.current_index, -1, "Removing last element should set current_index to -1")

    print("\n=== All iterable_proxy tests passed! ===\n")
end

-- Run the tests
test_iterable_proxy()
