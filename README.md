<h1>快乐的Coding： 用vim打造最适合自己习惯的IDE</h1>
huangguozhen@outlook.com

##【前言】
----

刚开始学习vim不久，记录一点日志为了整理一下自己的知识脉络。

## 【正文】
<h2>基础配置</h2>
vim的配置文件是.vimrc。位置存放有以下两个地方(对于Uninx系统),通常都是放在 $HOME/.vimrc
```
"$HOME/.vimrc"	    
"$HOME/.vim/vimrc"	
```

vim窗口外观，显示字体，操作方式，快捷键，插件属性等都是在.vimrc文件中配置。基础配置详细参考.vimrc中的配置

<h2>插件管理</h2>
vim 自身的插件管理是在 .vim/ 目录中预定义子目录管理所有插件比如，子目录 doc/ 存放插件帮助文档、plugin/ 存放通用插件脚本），
vim 的各插件打包文档中通常也包含上述两个（甚至更多）子目录，用户将插件打包文档中的对应子目录拷贝至 .vim/ 目录即可完成插件的安装。
这种插件管理管理起来比较麻烦。首先在同个目录空间下容易引起命名冲突，其次对于插件的升级，卸载比较麻烦(需要到 doc/ 和 plugin/ 目录
下去逐一删除插件相关文件，容易造成误删，漏删的情况)。
[vim-plug](https://github.com/junegunn/vim-plug.git)很好的解决了这个问题，本文中对插件的管理也正是使用vim-plug来管理。

<h3>安装vim-plug</h3>
[下载 plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) 并拷贝至 ~/.vim/autoload 中

### 配置
```
sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### 使用
在你的.vimrc中增加vim-plug配置
1. 以 `plug#begin()` 开头
2. 使用 `Plug` 命令列出需要安装的插件
3. `plug#end()` 结束。以此表明增加插件到 `&runtimepath`

#### 例子
```vim

call plug#begin('~/.vim/plugged')

" plugin seoul256
Plug 'junegunn/seoul256.vim'

call plug#end()
```
保存.vimrc，重启vim,在命令模式下输入PlugInstall安装插件, 详细使用参考[vim-plup](https://github.com/junegunn/vim-plug.git)。

<h2>利用插件配置相关功能</h2>

<h3>vim 外观配置</h3>
使用seoul256.vim插件，现在最流行的还有molokai,solarized等。 在 ~/.vimrc 中增加

### 配置
```vim
" vim-plug中管理起来 
Plug 'junegunn/seoul256.vim'
 
" 配置主题色调
let g:seoul256_background = 236
colo seoul256
```

### 使用
无

<h3>vim 工程管理</h3> 
使用nerdtree, tagbar, minibufexpl分别做文件树浏览，标签导航，窗口分割Tab。

### 配置
```vim
" 插件引入
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'fholgado/minibufexpl.vim'

" 浏览工程文件
nmap <Leader>nt :NERDTreeToggle<CR>                                            
let NERDTreeWinSize=24
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" 标签索引 
let tagbar_left=0  
nnoremap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32 
let g:tagbar_compact=1 
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" 文件Tab页配置
map <Leader>bl :MBEToggle<CR>
map <Leader>bn :MBEbn<CR>
map <Leader>bp :MBEbp<CR>
```
