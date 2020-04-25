### [step1](https://katacoda.com/scenario-examples/scenarios/create-scenario-101)

***

Clone our example repository that contains the set of documentation with the following command:

```
git clone https://github.com/katacoda/scenario-examples.git katacoda-scenario-examples
```

Within the repository, you will see a set of examples of implementing various Katacoda functionality.

The scenario you are currently reading is in the directory `ls -lha katacoda-scenario-examples/create-scenario-101`. The directory name is what defines the URL.

An example of the current step is `katacoda-scenario-examples/create-scenario-101/step1.md`

All the steps are collected via a JSON file, for example, `katacoda-scenario-examples/create-scenario-101/index.json`.

The JSON file defines the scenario title, the description, steps order, the UI layout and environment. You can find more about the layouts within our scenarios at [katacoda.com/docs/scenarios/layouts](https://katacoda.com/docs/scenarios/layouts) and environments at [katacoda.com/docs/scenarios/environments](https://katacoda.com/docs/scenarios/environments).

### step 2.  通过markdown 向 katacoda发送指令

***

#### Scenario Syntax

Within each step, a series of Markdown extensions have been created that can provide various details for the users' experience.

For example, commands such as `echo "Run in Terminal"` can be executed by clicking the command.

This is done by adding `execute` to the markdown code block, for example:

```markdown
`echo "Run in Terminal"`{{execute}}
```

More can be found at the scenario [on Markdown extensions](https://katacoda.com/scenario-examples/scenarios/markdown-extensions).

* 执行单条命令

```markdown
# 执行命令
`echo "Run in Terminal"`{{execute}}

# 执行Ctrl+C
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

```

* 在不同HOST执行

```markdown
# 在HOST1 执行
`echo "Run in Terminal Host 1"`{{execute HOST1}}

# 在HOST2 执行
`echo "Run in Terminal Host 2"`{{execute HOST2}}
```

* 在不同的 terminal执行

```markdown
# 在terminal 1执行
`echo "Run in Terminal 1"`{{execute T1}}

# 在terminal 2执行，要是没打开的话，会打开
`echo "Open and Execute in Terminal 2"`{{execute T2}}
```

### step 3

***

## Create scenario

For example, to create a new scenario you would run the command `katacoda scenarios:create`. The CLI will prompt you a few questions in order to create your scenario:

- **Friendly URL:** here you will type `test-scenario`. This attribute will determine the name of the folder of your scenario, and the URL to access it, so, should not contain spaces, should be lower case, etc. For example, if your username is *test-username* and your scenario was called *test-scenario* as suggested, the URL to point the scenario in the platform will be https://katacoda.com/test-username/scenarios/test-scenario/
- **Title:** title the scenario
- **Description:** description of the scenario, displayed on the intro screen
- **Difficulty level:** provide users with a sense of the depth of content, displayed on the intro screen
- **Estimated time:** provide users with an estimated time to complete, displayed on the intro screen
- **Number of steps:** the numbers of the steps that the scenario will have. The CLI will create all the template files for all the steps that you specified
- **Image:** it will determine which base software will be available for your scenario. For example, if you need docker, java, go, etc as a pre-requisite. For more information read [katacoda.com/docs/scenarios/environments](https://katacoda.com/docs/scenarios/environments)
- **Layout:** it will determine the disposition of the elements of your scenario. For example, if you want to present only a terminal, or editor + terminal, etc. For more information read [katacoda.com/docs/scenarios/layouts](https://katacoda.com/docs/scenarios/layouts)

With this information, the CLI will create a folder with the name of the ***friendly URL\*** introduced and will create inside of that folder the required files for your scenario.

You can check your scenario created with this command: `ls test-scenario*`

---

浏览器翻译如下：

- **友好的网址：**您将在此处输入`test-scenario`。此属性将确定您的方案的文件夹的名称，以及用于访问它的URL，因此，不应包含空格，应为小写字母等。例如，如果您的用户名是*test-username*并且您的方案称为*test -scenario（*如建议的那样），用于在平台中指向该方案的URL将为https://katacoda.com/test-username/scenarios/test-scenario/
- **标题：**为场景添加标题
- **描述：**场景的描述，显示在简介屏幕上
- **难度等级：**向用户介绍内容的深度，并显示在简介屏幕上
- **估计时间：**向用户提供估计的完成时间，显示在简介屏幕上
- **步骤数：**场景将具有的步骤数。CLI将为您指定的所有步骤创建所有模板文件
- **图片：**它将确定适用于您的方案的基本软件。例如，如果您需要docker，java，go等作为前提条件。有关更多信息，请阅读[katacoda.com/docs/scenarios/environments](https://katacoda.com/docs/scenarios/environments)
- **布局：**它将确定方案元素的配置。例如，如果您只想显示终端，或编辑器+终端等，有关更多信息，请阅读[katacoda.com/docs/scenarios/layouts](https://katacoda.com/docs/scenarios/layouts)

有了这些信息，CLI将创建一个文件夹，其中引入了***友好URL\***的名称，并将在该文件夹内创建方案所需的文件

### step4 

***

#### VS Code Extension

For those who prefer an IDE based extension, Katacoda has extended Visual Studio Code for scenario management.

This can be installed from the [Katacoda page on the Visual Studio Marketplace](https://marketplace.visualstudio.com/items/Katacoda.vscode/).

After installation, you can create new scenarios, add steps and have quick access to the Katacoda markdown features via snippets.

```shell
# vscode 安装这个插件
Katacoda VSCode Scenario Creator
```

### step 5

***

#### WebHooks

As changes are being made to the content, when they are pushed into the master branch of a Git repository, the content on Katacoda can automatically be updated via a webhook.

To configure the Webhook, follow the guide at [katacoda.com/docs/configure-git](https://katacoda.com/docs/configure-git).

Once the webhook is installed, everytime you make a push to update to your content, Katacoda will be automatically updated.