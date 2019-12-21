# vimrc_config

vim 配置文件，支持python，js, markdown
Vimscript的语法和使用可以学习[笨发放学习Vimscript](https://www.kancloud.cn/kancloud/learn-vimscript-the-hard-way/49321)

### 使用注意：

- 通过[Vundle](https://github.com/VundleVim/Vundle.vim)安装相关插件。

- 需安装[powerline-font](https://github.com/powerline/fonts)解决状态栏乱码

- 需安装 [molokai](https://github.com/tomasr/molokai) 主题

- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) 需要安装相应服务并启动

- [vim-instan-markdown](https://github.com/suan/vim-instant-markdown) 需执行命令 `npm -g install instant-markdown-d` 安装依赖

```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

### 其他

- zsh 打开vim 模式，向上箭头不能根据已经输入的字符过滤历史记录
解决方案参考[我的GitHub Page](https://boyaziqi.github.io/zshda-kai-vimo-shi-upxiang-shang-jian-tou-bu-neng-an-zi-mo-shi-sou-suo-jie-jue-fang-fa.html)
