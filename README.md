# Essential-Noir
A truly minimalistic theme inspired by Noir Theme on Zed

<img width="1674" height="1008" alt="Screenshot 2026-07-16 at 8 26 09 PM" src="https://github.com/user-attachments/assets/f8b99180-c45e-49f5-9224-d26742acb70c" />

<img width="1674" height="1009" alt="Screenshot 2026-07-16 at 8 25 13 PM" src="https://github.com/user-attachments/assets/6706f5bb-1b2f-491d-a6e7-8e212f1234d8" />


Huge Inspiration from [Noir By Chase Weaver](https://www.github.com/chaseweaver/noir-and-blanc)

This is based on Paramount Theme by [owickstrom](https://www.github.com/owickstrom/vim-colors-paramount)


Highly encourage you to look at these 2 guys theme, as these are the same inspirations


### INSTALL USING LAZY

```lua
return {
  {
    "izzyswe/Essential-Noir",
    lazy = false,
    priority = 1000,
    config = function()
      -- 1. CHOOSE YOUR MODE HERE: "dark" or "light"
      vim.o.background = "dark" 

      -- 2. Run the setup function to apply the colorscheme
      require("essential-noir").setup()
    end,
  }
}
```
