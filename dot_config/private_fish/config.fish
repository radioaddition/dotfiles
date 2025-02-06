if status is-interactive
    # Commands to run in interactive sessions can go here
      # VI mode
      fish_vi_key_bindings
      set -Ux fish_cursor_default block
      set -Ux fish_cursor_insert line
      set -Ux fish_cursor_replace underscore
      set -Ux fish_cursor_replace_one underscore

      # shell inits
      function starship_transient_prompt_func
        starship module character
      end
      starship init fish | source
      enable_transience
      atuin init fish | source
      direnv hook fish | source
      chezmoi completion fish | source
      just --completions fish | source
      nh completions --shell fish | source
      thefuck --alias | source

      # Misc variables
      set -Ux HOSTNAME $(hostname)
      set -Ux MANPAGER 'nvim +Man!'
end
