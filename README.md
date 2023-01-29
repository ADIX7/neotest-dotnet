<p align="center">
<img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/Issafalcon/neotest-dotnet/main.yml?label=main&style=for-the-badge">
<img alt="GitHub release (latest SemVer)" src="https://img.shields.io/github/v/release/Issafalcon/neotest-dotnet?style=for-the-badge">
</p>
# Neotest .NET

Neotest adapter for dotnet tests

**NOTE - This is a WIP project and will be under development over the coming months with additional features**

- _Please feel free to open an issue_

# Pre-requisites

neotest-dotnet requires makes a number of assumptions about your environment:

1. The `dotnet sdk` that is compatible with the current project is installed and the `dotnet` executable is on the users runtime path (future updates may allow customisation of the dotnet exe location)
2. The user is running tests using one of the supported test runners / frameworks (see support grid)
3. (For Debugging) `netcoredbg` is installed and `nvim-dap` plugin has been configured for `netcoredbg` (see debug config for more details)
4. Requires [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and the parser for C#.

# Installation

## [Packer](https://github.com/wbthomason/packer.nvim)

```
  use({
    "nvim-neotest/neotest",
    requires = {
      {
        "Issafalcon/neotest-dotnet",
      },
    }
  })
```

## [vim-plug](https://github.com/junegunn/vim-plug)

```vim
    Plug 'https://github.com/nvim-neotest/neotest'
    Plug 'https://github.com/Issafalcon/neotest-dotnet'
```

# Usage

```lua
require("neotest").setup({
  adapters = {
    require("neotest-dotnet")
  }
})
```

Additional configuration settings can be provided:

```lua
require("neotest").setup({
  adapters = {
    require("neotest-dotnet")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      -- Let the test-discovery know about your custom attributes (otherwise tests with not be picked up)
      -- Note: Only custom attributes for non-parameterized tests should be added here. See the support note about parameterized tests
      custom_attributes = {
        xunit = { "MyCustomFactAttribute" },
        nunit = { "MyCustomTestAttribute" },
        mstest = { "MyCustomTestMethodAttribute" }
      },
      -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
      -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
      --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
      discovery_root = "project" -- Default
    })
  }
})
```

# Debugging

[Debugging Using neotest dap strategy](https://user-images.githubusercontent.com/19861614/197394062-fe86cf8f-1a76-4868-8bc4-cf6f93ed3c90.webm)

- Install `netcoredbg` to a location of your choosing and configure `nvim-dap` to point to the correct path
- The example below uses the `mason.nvim` default install path:

```l
local install_dir = path.concat{ vim.fn.stdpath "data", "mason" }

dap.adapters.netcoredbg = {
  type = 'executable',
  command = install_dir .. '/packages/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}
```

**NOTE: When debugging, the result output is currently not correctly relayed back to neotest (it instead reads the output from the debugger process, and registers all tests run using the 'dap' strategy as failed). The correct test feedback is displayed in a terminal window as a workaround for this limitation. This will also affect the output in the neotest-summary window. Hopefully this will be fixed in time.**

# Support

## Key

:heavy_check_mark: = Fully supported

:part_alternation_mark: = Partially Supported (functionality might behave unusually)

:interrobang: = As yet untested

:x: = Unsupported (tested)

| Runner / Framework | Unit Tests         | *Parameterized Unit Tests (e.g. Using `TestCase` attribute) | Specflow                                                | Debugging          |
| ------------------ | ------------------ | ---------------------------------------------------------- | ------------------------------------------------------- | ------------------ |
| C# - NUnit         | :heavy_check_mark: | :heavy_check_mark:                                         | :heavy_check_mark:                                      | :heavy_check_mark: |
| C# - XUnit         | :heavy_check_mark: | :heavy_check_mark:                                         | :part_alternation_mark: (issues with test name linking) | :heavy_check_mark: |
| C# - MSTest        | :heavy_check_mark: | :heavy_check_mark:                                         | :heavy_check_mark:                                      | :heavy_check_mark: |
| F# - NUnit         | :interrobang:      | :interrobang:                                              | :interrobang:                                           | :interrobang:      |
| F# - XUnit         | :interrobang:      | :interrobang:                                              | :interrobang:                                           | :interrobang:      |
| F# - MSTest        | :interrobang:      | :interrobang:                                              | :interrobang:                                           | :interrobang:      |

* Parameterized tests are only itemized by the adapter when the attribute arguments are inline values. For any parameterized test attributes (including custom ones) that take non-inlined values
the adapter will lump all these tests together in one.

# Limitations

1. A tradeoff was made between being able to run parameterized tests and the specificity of the `dotnet --filter` command options. A more lenient 'contains' type filter is used
   in order for the adapter to be able to work with parameterized tests. Unfortunately, no amount of formatting would support specific `FullyQualifiedName` filters for the dotnet test command for parameterized tests.
2. See the support guidance for feature and language support

- F# is currently unsupported due to the fact there is no complete tree-sitter parser for F# available as yet (<https://github.com/baronfel/tree-sitter-fsharp>)

3. As mentioned in the **Debugging** section, there are some discrepancies in test output at the moment.
