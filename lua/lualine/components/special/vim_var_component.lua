local VarComponent = require('lualine.component'):new()
VarComponent.update_status = function(self)
  local component = self.options[1]
  -- vim veriable component
  -- accepts g:, v:, t:, w:, b:, o, go:, vo:, to:, wo:, bo:
  -- filters g portion from g:var
  local scope = component:match '[gvtwb]?o?'
  -- filters var portion from g:var
  local var_name = component:sub(#scope + 2, #component)
  -- Displays nothing when veriable aren't present
  if not (scope and var_name) then
    return ''
  end
  -- Support accessing keys within dictionary
  -- https://github.com/shadmansaleh/lualine.nvim/issues/25#issuecomment-907374548
  local name_chunks = vim.split(var_name, '%.')
  local return_val = vim[scope][name_chunks[1]]
  for i = 2, #name_chunks do
    if return_val == nil then
      break
    end
    return_val = return_val[name_chunks[i]]
  end
  if return_val == nil then
    return ''
  end
  local ok
  ok, return_val = pcall(tostring, return_val)
  return ok and return_val or ''
end

return VarComponent
