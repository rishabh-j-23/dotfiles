return {
  "nvim-java/nvim-java",
  lazy = true,
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          -- Your JDTLS configuration goes here
          -- jdtls = {
          -- settings = {
          --   java = {
          --     configuration = {
          --       runtimes = {
          --         {
          --           name = "JavaSE-23",
          --           path = "/usr/local/sdkman/candidates/java/23-tem",
          --         },
          --       },
          --     },
          --   },
          -- },
          -- },
        },
        setup = {
          jdtls = function()
            -- Your nvim-java configuration goes here
            require("java").setup({
              root_markers = {
                "settings.gradle",
                "pom.xml",
                "build.gradle",
                "mvnw",
                "gradlew",
                "build.gradle",
              },
            })
          end,
        },
      },
    },
  },
}
