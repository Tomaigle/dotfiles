if not vim.env.ROS_DISTRO then
  return {}
end

local function ws_root()
  local pkg = vim.fs.root(0, { "package.xml" })
  if pkg then
    local parent = vim.fs.dirname(pkg)
    return vim.fs.root(parent, { "src", "build", "install", "log" }) or vim.fn.getcwd()
  end
  return vim.fn.getcwd()
end

local function current_pkg()
  local pkg_dir = vim.fs.root(0, { "package.xml" })
  return pkg_dir and vim.fs.basename(pkg_dir) or nil
end

local function run_colcon(name, cmd)
  local overseer = require("overseer")
  local task = overseer.new_task({
    name = name,
    cmd = cmd,
    cwd = ws_root(),
    components = { "default" },
  })
  task:start()
  overseer.open({ enter = false, direction = "bottom" })
end

return {
  {
    "ErickKramer/nvim-ros2",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      picker = "snacks",
      autocmds = true,
      treesitter = true,
    },
    keys = {
      {
        "<leader>Rn",
        function()
          require("nvim-ros2").pickers.nodes()
        end,
        desc = "ROS2: Nodes",
      },
      {
        "<leader>Ro",
        function()
          require("nvim-ros2").pickers.topics_info()
        end,
        desc = "ROS2: Topics (Info)",
      },
      {
        "<leader>Re",
        function()
          require("nvim-ros2").pickers.topics_echo()
        end,
        desc = "ROS2: Topics (Echo)",
      },
      {
        "<leader>Rs",
        function()
          require("nvim-ros2").pickers.services()
        end,
        desc = "ROS2: Services",
      },
      {
        "<leader>Ra",
        function()
          require("nvim-ros2").pickers.actions()
        end,
        desc = "ROS2: Actions",
      },
      {
        "<leader>Ri",
        function()
          require("nvim-ros2").pickers.interfaces()
        end,
        desc = "ROS2: Interfaces",
      },
      {
        "<leader>Rr",
        "<cmd>RosRpc send<cr>",
        desc = "ROS2: Send RPC/Action",
      },
      {
        "<leader>Rx",
        "<cmd>RosRpc stop<cr>",
        desc = "ROS2: Stop RPC/Action",
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    keys = {
      {
        "<leader>Rb",
        function()
          run_colcon(
            "Colcon Build (All)",
            "colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
          )
        end,
        desc = "ROS2: Colcon Build All",
      },
      {
        "<leader>Rp",
        function()
          local pkg = current_pkg() or vim.fn.input("Package: ")
          if pkg == "" then
            return
          end
          run_colcon(
            "Colcon Build: " .. pkg,
            "colcon build --symlink-install --packages-up-to "
              .. vim.fn.shellescape(pkg)
              .. " --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
          )
        end,
        desc = "ROS2: Colcon Build Package",
      },
      {
        "<leader>Rt",
        function()
          local pkg = current_pkg() or vim.fn.input("Package: ")
          if pkg == "" then
            return
          end
          run_colcon(
            "Colcon Test: " .. pkg,
            "colcon test --packages-select " .. vim.fn.shellescape(pkg) .. " && colcon test-result --verbose"
          )
        end,
        desc = "ROS2: Colcon Test Package",
      },
    },
  },
}
