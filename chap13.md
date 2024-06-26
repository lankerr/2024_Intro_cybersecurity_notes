网络应用	应用安全问题本质	应用安全隐患	    防御
Web安全	①应用资源的有限性
②资源共享的不确定性
③相关应用系统的漏洞	①数据窃取
②应用无法访问	①访问控制
②漏洞修复
③监控警报
CDN安全
社交网络安全
云计算安全
物联网安全
移动应用安全

# 什么是WEB

Web（World Wide Web）即全球广域网，也称为万维网，它是一种基于超文本和HTTP的、全球性的、动态交互的、跨平台的分布式图形信息系统
为浏览者在Internet上查找和浏览信息提供了图形化的、易于访问的直观界面
Web应用程序是运行在Web服务器上的应用软件，这些应用程序使用客户机/服务器（Client/Server）建模的结构进行编程

# WEB安全

XSS (Cross-Site Scripting)：跨站脚本攻击
跨站脚本攻击是指通过存在安全漏洞的Web网站注册用户的浏览器内运行非法的HTML标签或JavaScript进行的一种攻击
跨站脚本攻击有可能造成以下影响:
利用虚假输入表单骗取用户个人信息
利用脚本窃取用户的Cookie值，被害者在不知情的情况下，帮助攻击者发送恶意请求
显示伪造的文章或图片
我们有反射性XSS，主要是发送带有而已参数的URL
储存形XSS，将可执行代码永久储存在服务器中

# 两种防御方法
1.转义字符，对于引号尖括号斜杠进行转义
2.通过CSP建立白名单

# SQL注入
源代码希望的作用是使用mysql语言
``` sql
SELECT * FROM users WHERE name = '$name' AND password = '$password'
```
但是攻击者输入
``` sql
SELECT * FROM user WHERE username='admin' --' AND psw='xxxx’ 
```
那么就会成功的注入

我们的防御主要有四种方法
1. 后端代码检查输入的数据是否符合预期，严格限制变量的类型
2. 对进入数据库的特殊字符（'，"，<，>，&，*，;等）进行转义处理，或编码转换
3. 所有的查询语句建议使用数据库提供的参数化查询接口，参数化的语句使用参数而不是将用户输入变量嵌入到 SQL 语句中，即不要直接拼接 SQL 语句
4. 严格限制Web应用的数据库的操作权限，给此用户提供仅仅能够满足其工作的最低权限，从而最大限度的减少注入攻击对数据库的危害

# WEB安全-点击劫持

其实就是把这个设置为透明，然后在上面放一个透明的按钮，用户点击的时候就会触发这个按钮
源代码
``` html
iframe { width: 1440px; height: 900px; position: absolute; 
top: -0px; left: -0px; z-index: 2; -moz-opacity: 0; opacity: 0; 
filter: alpha(opacity=0);} 
button { position: absolute; top: 270px; left: 1150px; 
z-index: 1; width: 90px; height:40px; } 
</style> ...... <button>点击脱衣</button> 
<img src="http://pic1.win4000.com/wallpaper/2018-03-19/5aaf2bf0122d1.jpg"> 
<iframe src="http://i.youku.com/u/UMjA0NTg4Njcy" scrolling="no"></iframe>
```

# Web安全-URL跳转漏洞
借助未验证的URL跳转，将应用程序引导到不安全的第三方区域，从而导致的安全问题
黑客利用URL跳转漏洞来诱导安全意识低的用户点击，导致用户信息泄露或者资金的流失
原理：黑客构建恶意链接(链接需要进行伪装,尽可能迷惑)，发在QQ群或者是浏览量多的贴吧/论坛中，安全意识低的用户点击后，经过服务器或者浏览器解析后，跳到恶意的网站中

将程序引导到不安全的第三方区域，从而导致安全问题

# Web安全-OS命令注入攻击
OS命令注入和SQL注入差不多，只不过SQL注入是针对数据库的，而OS命令注入是针对操作系统的
只要在能调用Shell函数的地方就有存在被攻击的风险
``` Node.js
// 以 Node.js 为例，假如在接口中需要从 github 下载用户指定的 repo 
const exec = require('mz/child_process').exec; 
let params = {/* 用户输入的参数 */}; 
exec(`git clone ${params.repo} /some/path`);

如果 params.repo 传入的是 https://github.com/admin/admin.github.io.git 确实能从指定的 git repo 上下载到想要的代码。
但是如果 params.repo 传入的是 https://github.com/xx/xx.git && rm -rf /* && 恰好你的服务是用 root 权限起的就糟糕了
```

# CDN工作流程
用户点击APP， APP会根据URL地址去DNS寻求IP地址解析
DNS服务器发现对应URL有CDN服务，将会返回CDN服务器对应的IP
用户向CDN服务器发起内容URL访问请求，如果CDN服务器有缓存内容，进行第4步，否则进行第5步
CDN服务器响应用户请求，将用户所需内容传送到用户终端
CDN缓存服务器上并没有用户想要的内容，CDN向网站的源服务器请求内容；源服务器返回内容给缓存服务器，缓存服务器发给用户

# CDN安全-RangeAmp攻击
通过一些漏洞，可以通过CDN进行DoS攻击，从而破坏原有系统的可用性
RangeAmp攻击：一台电脑便可让世界上最流行的网站瘫痪，一种利用CDN和HTTP协议设计缺陷对任意部署Web服务的站点实施DDoS的攻击
CDN和HTTP范围请求（range requests）机制都致力于提升网络性能，但是CDN对HTTP范围请求机制的实现存在安全缺陷，攻击者能够滥用CDN的漏洞对源网站服务器或其他CDN节点实施DDoS攻击

# 社交网络安全-网络钓鱼
# 社交网络安全-女巫攻击
Sybil攻击（女巫攻击）
伪装成为多种身份参与到正常网络中
一方面利用虚假身份盗取合法用户的各种数据
另一方面影响数据转发路径，从而可伪造出多条不同的路由，破坏网络的可用性
# 社交网络安全-微信女巫账号检测
社交网络虚假账号检测: Ianus
特征提取：为每对注册账号提取同步及异常特征
联通图构建：构建权重联通图， Sybils将密集连接，而正常账号相对分散
Sybils检测：分析连通图结构，发现Sybils类簇
# 云计算
云计算的定义：
通过网络按需提供可动态伸缩的廉价计算服务
是与信息技术、软件、互联网相关的一种服务
云计算的五大特点：
1. 大规模
2. 虚拟化
3. 高可用性和扩展性
4. 按需服务
5. 网络安全

基础设施即服务IaaS (Infrastructure as a Service)
向云计算提供商的个人或组织提供虚拟化计算资源
如虚拟机、存储、网络和操作系统等
平台即服务PaaS (Platform as a Service)
为开发人员提供通过互联网构建应用程序和服务的平台
开发、测试和管理软件应用程序提供按需开发环境
软件即服务SaaS (Software as a Service)
通过互联网提供按需软件付费应用程序
云计算提供商托管和管理软件应用程序
允许其用户连接到应用程序并通过互联网访问应用程序

# 云计算-Docker 
容器（Container）
虚拟机是操作系统级别的资源隔离，而容器本质上是进程级的资源隔离
Docker是创建容器的工具，是应用容器引擎
启动时间很快，达到秒级，且对资源的利用率高（一台主机可以同时运行几千个Docker容器）
占用空间很小，虚拟机一般需几GB到几十GB，而容器仅需要MB级甚至KB级
# 云计算-Kubernetes
K8S是Kubernetes的简称，中文意思是舵手或导航员
K8S是一个容器集群管理系统，主要职责是容器编排——启动容器，自动化部署、扩展和管理容器应用，还有回收容器
Docker和K8S，关注的不再是基础设施和物理资源，而是应用层，所以就属于PaaS
# 云计算安全-虚拟机逃逸
虚拟机逃逸指程序脱离正在运行并与主机操作系统交互的虚拟机的过程
虚拟化技术虽然可以在逻辑上提供软硬件的隔离，从而将各个用户分隔开，然而通过一些漏洞，虚拟机中的应用可以逃逸出逻辑的隔离，直接控制主操作系统，从而造成破坏
# 云计算安全-提权攻击 
提权攻击是指用户通过系统漏洞，提升自己操作系统的使用权限的攻击
最简单的方法就是直接猜测管理员的弱口令等
比较可靠的提权方法就是攻击机器的内核，让机器以更高的权限执行代码，进而绕过设置的所有安全限制

# 应用安全网络攻击的共性特征
攻击者可以消耗大量应用资源导致其他用户无法访问 
攻击者可以合法、或者不合法的获取应用数据、推理构造出目标数据 
攻击者利用各种软硬件漏洞进行攻击
## 共性特征-资源有限
DDoS攻击（Distributed Denial of Service）：通过大量合法的请求占用大量网络资源，以达到使网络瘫痪的目的
分类：
通过使网络过载来干扰甚至阻断正常的网络通讯
通过向服务器提交大量请求，使服务器超负荷
阻断某一用户访问服务器
阻断某服务与特定系统或个人的通讯
占用网络资源类型
网络带宽、磁盘读写、CPU计算等
Web、CDN、物联网、云计算都面临对应的安全风险
## 共性特征-资源共享
攻击者可以合法、或者非法地获取应用数据，进而推理构造出目标数据
合法的越权访问：
一些网络应用的数据是相互共享的，所有用户都可以合法的使用
这些数据往往由于隐私保护存在缺陷（差分隐私，互补隐私等）
这类攻击形式在Web应用和社交网络中最为常见
非法的访问资源：
逻辑上相互独立的用户数据存放在相同的一片物理区域
攻击者利用一些漏洞，非法访问其他用户的数据，造成一定程度的数据泄露
这种攻击形式主要存在于云计算中
## 共性特征-系统漏洞
现有计算机体系结构复杂、应用丰富
不能确保多变、异构的应用硬件和软件的实现万无一失
完全没有任何漏洞是不可能的
漏洞的及时修复也存在问题

# Web安全的机密性

