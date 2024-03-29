local M = {}

function M:new(value)
    local o = {
        value = value,
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function M:length(len)
    assert(
        self.value:len() == len,
        string.format(
            'expected the lenght to be %s but actual length is %s',
            len,
            self.value:len()
        )
    )

    return self
end

function M:length_less_than(len)
    assert(self.value:len() < len)
    return self
end

function M:length_greater_than(len)
    assert(self.value:len() > len)
    return self
end

return M
