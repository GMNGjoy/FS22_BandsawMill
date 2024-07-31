PDLCFilename = {};
PDLCFilename.currentModDirectory = g_currentModDirectory;

--- Return a filename if it exists, replacing $pdlcdir with the correct directory
---@param filename string
---@param superFunc function
---@param baseDir string
---@return string|nil
function PDLCFilename.getFilename(filename, superFunc, baseDir)

    if filename:sub(1, 8) == "$pdlcdir" then
        for i = 1, #g_dlcsDirectories do
            local dlcsDir = g_dlcsDirectories[i].path
            testFilename = dlcsDir..filename:sub(9)
            if fileExists(testFilename) then
                return testFilename
            end
        end
    end;

	return superFunc(filename, baseDir)
end

Utils.getFilename = Utils.overwrittenFunction(Utils.getFilename, PDLCFilename.getFilename);