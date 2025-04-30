return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local setup = {
      indent = { char = '╎' },
      scope = { enabled = true, show_start = false, show_end = false },
    }

    require('ibl').setup(setup)
  end,
}
