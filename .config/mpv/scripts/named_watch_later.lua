local utils = require 'mp.utils'

-- Check if file exists
local function exists(path)
    local f = io.open(path, "r")
    if f == nil then
        return false
    else
        io.close(f)
        return true
    end
end

local function append_name(event)
    local path = mp.get_property("path")
    local title = mp.get_property("media-title")
    local cwd = utils.getcwd()
    if path == nil or cwd == nil then
        do return end
    end

    local abs_path = path
    -- If the path is not an url join path with the current working directory.
    if not string.match(path, "^https:.+") then
        abs_path = utils.join_path(cwd, path)
    end
    -- Create temporary file and write path into it.
    -- This is done to read the path into 'md5sum'.
    local tmpname = os.tmpname()
    local tmp = io.open(tmpname, "w")
    tmp:write(abs_path)
    local hash = io.popen("md5sum "..tmpname):read():match("^%w+"):upper()
    os.remove(tmpname)

    local watch_later = mp.find_config_file("watch_later")
    if hash == nil or watch_later == nil then
        do return end
    end

    local hashfile = utils.join_path(watch_later, hash)
    function add_metadata(hashfile, path, title)
        return function(event)
            mp.unregister_event(add_metadata(hashfile, path, title))
            if exists(hashfile) then
                local metadata = title.."\n"..path
                local file = io.open(hashfile..".meta", "w")
                file:write(metadata)
                io.close(file)
            else if exists(hashfile..".meta") then
                os.remove(hashfile..".meta")
            end
            end
        end
    end
    mp.register_event("end-file", add_metadata(hashfile, abs_path, title))
end

mp.register_event("file-loaded", append_name)
