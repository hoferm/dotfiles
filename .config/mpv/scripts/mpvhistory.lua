local HISTFILE = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME").."/.config").."/mpv/mpvhistory.log";


function get_path(str, sep)
    sep = sep or '/'
    return str:match("(.*"..sep..")")
end

mp.register_event("file-loaded", function()
    local title, logfile;

    local path = mp.get_property("path");
    if (get_path(path) == os.getenv("HOME").."/.local/d/videos/screensaver/") then
        return
    end

    title = mp.get_property("media-title");
    title = (title == mp.get_property("filename") and "" or ("(%s)"):format(title));

    logfile = io.open(HISTFILE, "a+");
    logfile:write(("[%s] %s %s\n"):format(os.date("%Y-%m-%d %X"), path, title));
    logfile:close();
end)
