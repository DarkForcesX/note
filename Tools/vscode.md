### 一、[教程链接](https://geek-docs.com/vscode/vscode-tutorials/what-is-vscode.html)

***



### 二、vscode golang [插件说明](https://www.cnblogs.com/xihuyouyu/p/11133198.html)

***

## 1. 语言功能 (Language Features)

### 1.1 智能感知 (IntelliSense)

- 编码时符号自动补全（使用 `gocode` ）
- 编码时函数签名帮助提示（使用 `gogetdoc` 或 `godef+go code` ）
- 鼠标悬停符号时快速显示信息（使用 `gogetdoc` 或 `godef+go code` ）

### 1.2 代码导航 (Code Navigation)

- 快速浏览符号定义（使用 `gogetdoc` 或 `godef+go code` ）
- 查找符号的引用和接口的实现（使用 `guru` ）
- 查找文件中的某符号或者查看文件结构大纲（使用 `go-outline` ）
- 查找工作区某符号（使用 `go-symbols` ）
- 在 Go 程序和相应测试文件之间切换

### 1.3 代码编辑 (Code Editing)

- 代码片段快速编程
- 文件保存时手动格式化代码（使用 `goreturns` 或 `go imports` ，同样可以移除未使用导入，或使用 `go fmt`
- 符号重命名（使用 `gorename` 。注意：Windows 工作环境下消除重命名需要在路径中有 `diff` 工具
- 在当前文件添加导入（使用 `gopkgs` ）
- 添加 / 移除结构域中的标签（使用 `gomodifytags` ）
- 为接口生成方法存根（使用 `impl` ）
- 为结构字面量填充默认值（使用 `fillstruct` ）

### 1.4 代码诊断 (Diagnostics)

- Build-on-save 编译代码和显示构建错误（使用 `go build` 和 `go test` ）
- Vet-on-save 运行 `go vet` 和以警告显示错误
- Lint-on-save 以警告显示检查错误（使用 `golint, gometalinter, staticcheck, golangci-lint` 或 `revive` ）
- 编辑时报告语义 / 语法错误

### 1.5 测试 (Testing)

- 在当前文件，当前包，整个工作区运行测试，在光标下使用命令行或 codelens
- 运行基准程序，在光标下使用命令行或 codelens
- 显示代码覆盖率，基于需求或在当前包运行测试之后
- 生成单元测试框架（使用 `gotests` ）

### 1.6 调试 (Debugging)

- 调试你的代码，二进制文件或测试文件（使用 `delve` ）

### 1.7 其他 (Others)

- 安装 / 更新所有依赖的 Go 工具
- 上传至 Go Playground（使用 `goplay` ）

## 2. 如何使用此插件？(How to use this extension?)

安装和打开 [Visual Studio Code](https://link.juejin.im/?target=https%3A%2F%2Fcode.visualstudio.com%2F)。按住 `Ctrl+Shift+X` 或 `Cmd+Shift+X` 打开插件面板。找到并安装 Go 插件。同样可以通过 [Marketplace](https://link.juejin.im/?target=https%3A%2F%2Fmarketplace.visualstudio.com%2Fitems%3FitemName%3Dms-vscode.Go) 安装此插件。在 VS Code 中打开任何以 `.go` 为后缀的文件。此插件便启动了。

此插件用了一系列 Go 工具以此提供丰富的功能。这些工具默认安装在你的 GOPATH 路径下。如果你希望让这些工具安装在独立的地方，在设置中的 `go.toolsGopath` 中提供你期望的地方。通过此文档了解更多—— [Go tools that the Go extension depends on](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FGo-tools-that-the-Go-extension-depends-on) 。

你将在右侧底部看到 `Analysis Tools Missing` (分析工具缺失)，点击消息将安装所有依赖的 Go 工具。你同样可以运行 [command](https://link.juejin.im/?target=https%3A%2F%2Fcode.visualstudio.com%2Fdocs%2Fgetstarted%2Fuserinterface%23_command-palette) `Go: Install/Update tools` 安装 / 更新工具。

注意 1：阅读 [GOPATH in the VS Code Go extension](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FGOPATH-in-the-VS-Code-Go-extension) 了解不同的方式得到此插件通过设置 GOPATH。

注意 2：`Format on save` 特性的超时时间为 750 毫秒，之后格式化将中止。 您可以使用设置 `editor.formatOnSaveTimeout` 更改此超时。 在 Visual Studio 代码中启用 `Auto Save` 后，此功能将被关闭。

注意三：此插件使用 `gocode` 在您编码时提供补全列表。 如果您已禁用 `go.buildOnSave` 设置，那么您可能无法从尚未构建的依赖项中获得新的结果。 因此，请确保在这种情况下手动构建了依赖项。

### 2.1 自定义 Go 插件功能 (Customizing the Go extension features)

Go 插件在安装 go 后便可准备使用。 如果要自定义功能，可以在 “用户” 或“工作区”设置中设置。 阅读 [All Settings & Commands in Visual Studio Code Go extension](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FAll-Settings-%26-Commands-in-Visual-Studio-Code-Go-extension) ，以获取完整的选项列表及其说明。

### 2.2 Go 语言服务器 (Go language Server)

Go 插件使用一系列 [Go tools](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FGo-tools-that-the-Go-extension-depends-on) 来提供丰富的语言功能。 另一种方法是使用一个提供相同功能的语言服务器。

此前，我们使用 [language server from Sourcegraph](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fsourcegraph%2Fgo-langserver) 添加支持。由于它不再更新，并且它不支持 Go 模块，我们现在转而使用 [language server from Google](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fgolang%2Fgo%2Fwiki%2Fgopls) 。

- 如果你正在使用 Sourcegraph 的语言服务器，你可以继续使用只要你不使用 Go 模块。
- 由于 Google 的语言服务器为 Go 模块提供了更好的支持，当插件检测到您开发的项目中使用了 Go 模块时，系统会提示您使用 Google 语言服务器。
- 如果您之前从未使用过语言服务器，现在选择使用它，系统将提示您安装并使用 Google 提供的语言服务器。

#### 2.2.1 控制 Go 语言服务器使用的设置 (Settings to control the use of the Go language server)

以下是可用于控制语言服务器使用的设置。 您需要重新加载 VS Code 窗口才能使这些更改的设置生效。

- 将 `go.useLanguageServer` 设置为 `true` 启用语言服务器

- 使用 `go.languageServerExperimentalFeatures` 设置来控制您希望语言服务器启用哪些功能。诊断 (Diagnostics) 是默认情况下唯一未启用的功能。 如果要从语言服务器启动此功能，请在设置中做如下添加

  ```
  "go.languageServerExperimentalFeatures": {
  "diagnostics": true
  }
  复制代码
  ```

- 添加如下设置可在一个日志文件中收集日志

  ```
  "go.languageServerFlags": ["-logfile", "path to a text file that exists"]
  复制代码
  ```

- 设置 `“go.languageServerFlags”：[“- rrp.trace”]` 以在输出面板中查看完整的 rpc 跟踪 `(View -> Output -> gopls)`

#### 2.2.2 更改当前使用服务器的设置 (setting to change the language server being used)

如果你想尝试其他语言服务器，比如，[bingo](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fsaibing%2Fbingo) , 然后安装并添加如下设置

```
"go.alternateTools": {
  "gopls": "bingo"
}
复制代码
```

这将告诉 Go 插件在 gopls 中使用 bingo。

#### 2.2.3 提供关于 gopls 的反馈 (provide feedback on gopls)

如果你在使用 `gopls` 语言服务器时发现任何问题， 请先在 [list of existing issues for gopls](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fgolang%2Fgo%2Fissues%3Fq%3Dis%3Aissue%2Bis%3Aopen%2Blabel%3Agopls) 中查看并在注册新案例之前用您的案例更新相关问题，网址为 [github.com/golang/go/i…](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fgolang%2Fgo%2Fissues)>

### 2.3 林特 (Linter)

linter 是一个反馈代码风格和给出建议的工具。此插件默认使用官方的 [golint](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fgolang%2Flint) 作为一个 linter。

您可以通过在设置中将 `go.lintTool` 设置为 “gometalinter” 来更改默认的 linter 而使用更高级的 [Go Meta Linter](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Falecthomas%2Fgometalinter) 。

Go Meta Linter 使用多种 linter 的集合，此插件将会为你安装。

一些十分实用的 linter 工具：

- [errcheck](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fkisielk%2Ferrcheck) 检查你代码中未检测的错误。
- [varcheck](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fopennota%2Fcheck) 找出未使用的屈居变量和常量。
- [deadcode](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Ftsenart%2Fdeadcode) 找出未使用代码。

如果只想运行特定的 linters（某些 linters 很慢），可以修改配置以指定它们：

```
  "go.lintFlags": ["--disable=all", "--enable=errcheck"],
复制代码
```

或者，您可以使用 [staticcheck](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fdominikh%2Fgo-tools%2Ftree%2Fmaster%2Fcmd%2Fstaticcheck)，它可能具有明显优于 `gometalinter` 的性能，因为仅支持这些工具的部分。

另一种选择是 [golangci-lint](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fgolangci%2Fgolangci-lint)，它具有 megacheck 相同的性能特点，但支持更广泛的工具。 您可以使用 `go.lintFlags` 配置 golangci-lint，例如，仅在新代码中显示问题并启用所有 linters：

```
"go.lintFlags": ["--enable-all", "--new"],
复制代码
```

golint 的另一种选择是 [revive](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fmgechev%2Frevive)。 它是可扩展的，可设置的，提供了比 golint 更多的规则，并且具有明显更好的性能。

配置 revive，使用：

```
"go.lintFlags": ["-exclude=vendor/...", "-config=${workspaceFolder}/config.toml"]
复制代码
```

最后，这些 linter 的结果将显示在代码中（带有建议的位置将加下划线，以及输出窗口中。

### 2.4 命令 (Commands)

除了集成的编辑功能外，该插件还在 Command Palette 中提供了几个用于处理 Go 文件的命令：

- `Go: Add Import` 在你的 Go 上下文中，从包列表中添加一个导入
- `Go: Current GOPATH` 查看当前配置的 GOPATH
- `Go: Test at cursor` 在活动文件的当前光标位置运行测试
- `Go: Test Package` 在包含活动文档的包中运行所有测试
- `Go: Test File` 在当前活动文档中运行所有测试
- `Go: Test Previous` 运行以前运行的测试命令
- `Go: Test All Packages in Workspace` 在当前工作空间中运行所有测试
- `Go: Generate Unit Tests For Package` 为当前包生成单元测试
- `Go: Generate Unit Tests For File` 为当前文件生成单元测试
- `Go: Generate Unit Tests For Function` 为当前文件中的所选函数生成单元测试
- `Go: Install Tools` 安装 / 更新插件所依赖的所有 Go 工具
- `Go: Add Tags` 将已配置的标记添加到选定的结构字段。
- `Go: Remove Tags` 从选定的结构域中删除已配置的标记。
- `Go: Generate Interface Stubs` 为给定接口生成方法存根
- `Go: Fill Struct` 使用默认值填充结构字面量
- `Go: Run on Go Playground` 将当前选择或文件上传到 Go Playground

您可以从命令面板中访问所有上述命令 (`Cmd+Shift+P` or `Ctrl+Shift+P`)。

其中一些命令作为实验性功能在编辑器上下文菜单中是可选择的。要控制在编辑器上下文菜单中显示哪些命令，请更新 `go.editorContextMenuCommands` 设置。

### 2.5 可选：调试 (*Opthinal*: Debugging)

要使用调试器，你当前必须手动安装 `delve`。 阅读 [Installation Instructions](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fderekparker%2Fdelve%2Ftree%2Fmaster%2FDocumentation%2Finstallation) 获取详细细节。在 MacOS 上，它需要创建一个自签名证书来签署 `dlv` 二进制文件。

更多请阅读 [Debugging Go Code Using VS Code](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FDebugging-Go-code-using-VS-Code)。

#### 2.5.1 远程调试 (Remote Debugging)

要使用 VS Code 进行远程调试，请阅读 [Remote Debugging](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FDebugging-Go-code-using-VS-Code%23remote-debugging)。

## 3. 安装或更新所以依赖项 (Install or update all dependencies)

要快速安装（或更新）所有依赖项，请参阅 [Go Tools wiki page](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FGo-tools-that-the-Go-extension-depends-on)。

## 4. 构建和调试插件 (Building and Debugging the Extension)

您可以在插件开发期间设置一个用于调试插件的开发环境。 阅读 [Building, Debugging and Sideloading the extension in Visual Studio Code](https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fvscode-go%2Fwiki%2FBuilding%2C-Debugging-and-Sideloading-the-extension-in-Visual-Studio-Code)