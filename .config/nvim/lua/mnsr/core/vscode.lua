local vsCall = function(key, vsAction, mode)
  return vim.keymap.set(mode or 'n', key, function()
    vim.fn.VSCodeCall(vsAction)
  end)
end

cmdheight = 1
vsCall('<TAB>', 'workbench.action.nextEditorInGroup')
vsCall('<S-TAB>', 'workbench.action.previousEditorInGroup')
vsCall('<C-h>', 'workbench.action.navigateLeft')
vsCall('<C-l>', 'workbench.action.navigateRight')
vsCall('u', 'undo')
vsCall('<C-r>', 'redo')
vsCall('<leader>nf', 'explorer.newFile') -- jump to matching bracket
vsCall('<leader>]', 'editor.action.jumpToBracket') -- jump to matching bracket
vsCall('<leader>rn', 'editor.action.changeAll') -- rename
vsCall('<leader>snip', 'workbench.action.openSnippets')
vsCall('<leader>th', 'workbench.action.selectTheme') -- theme selection
vsCall('<leader>wv', 'workbench.action.splitEditor') -- split editor

-- Sidebar
vsCall('<leader>ff', 'workbench.action.focusSideBar')
vsCall('<leader>ft', 'workbench.action.toggleSidebarVisibility')

-- vim
vim.keymap.set('n', '<leader>nh', '<CMD>nohl<CR>')
