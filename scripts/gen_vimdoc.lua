local docgen = require('babelfish')

local docs = {}

docs.generate = function()
  local metadata = {
    input_file = "README.md",
    output_file = "./doc/lualine.txt",
    project_name = "lualine",
    header_aliases = {
    }
  }
  docgen.generate_readme(metadata)
end

docs.generate()

return docs
