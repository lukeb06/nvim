function vimux_run_command(cmd)
	vim.cmd(':VimuxRunCommand "' .. cmd .. '"')
end
