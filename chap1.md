# 第一台数字式电子计算机
1943年，二次世界大战关键时期，莫尔学院和弹道研究实验室所属的陆军军械部签订了6.17万美元的研制合同
ENIAC于1945年底竣工，在1946年2月14日晚正式亮相，并于日次交付，最终造价是48.7万美元
计算弹道导弹分析，研制氢弹（核聚变，计算量复杂）
程序是用外接电路板输入

受到图灵等人工作的影响，1946年，冯·诺依曼及其同事在共同讨论的基础上起草了一个全新的“存储程序通用电子计算机方案“
这一方案对后来计算机的设计有决定性的影响，特别是确定计算机的结构，采用存储程序以及二进制编码等，至今仍为电子计算机设计者所遵循
1949年完成EDVAC（电子离散变量计算机）建造工作，1951年投入运行，用于核武器的理论计算
为了充分发挥电子元件的高速性能而采用了二进制
存储程序：指令和数据都存储起来
自动地执行程序

# 冯·诺依曼体系结构与计算机系统结构
主要特点：
1. 采用存储程序
2. 二进制编码
3. 采用固定指令长度
4. 采用存储器存放程序和数据
5. 采用按地址访问存储器
   
# ARPA及实验室冷战

1967年，着手筹建“分布式网络”
1968年，提交研究报告《资源共享的计算机网络》，阐明如何让ARPA的电脑达到互相连接，从而使大家分享彼此的研究成果
1969年9月2日，在加州大学洛杉矶分校实验室，约20名研究人员完成了UCLA与SRI两台计算机之间的连接，即ARPANET
1969年10月，ARPANET第一次通信

# Web的开始
1989年3月12日，Tim Berners-Lee 向CERN（欧洲粒子物理研究所）提交了一篇《关于信息化管理的建议》，提出一个针对 Internet 的新协议和一个使用该协议的文档系统，新系统命名为Word Wide Web
1990年，Tim Berners-Lee利用NeXTcube工作站架设首个网络服务器(info.cern.ch)，世界上首个万维网浏览器也是在上面写成
1990年底，Tim Berners-Lee 领导的小组已经构建了工作网络所需的所有工具，第二年 Word Wide Web 系统被移植到了其他计算机平台并投入使用，Web技术的五大要素就此发明问世：
URL(Uniform Resource Locator)：解决了文档的命名和寻址识别问题
HTTP(HyperText Transfer Protocol)：解决了浏览器与服务器应用层之间的交流问题
HTML(HyperText Markup Language)：定义了超文本文档的表示格式
Web浏览器：用于向服务器发起请求，并且解析收到的文档
Web服务器：用于保存文档，并且响应来自浏览器的请求

# 第一只蠕虫
1988年，康奈尔大学研究生罗伯特·莫里斯利用Unix系统的漏洞创造了一只蠕虫病毒，在麻省理工学院施放到了互联网
首个具有主动攻击的网络蠕虫

# 第2节 网络空间及网络空间安全
Cyberspace 是信息环境中的一个整体域,它由独立且互相依存的信息基础设施和网络组成. 包括互联网、电信网、计算机系统、嵌入式处理器和控制器系统.

# 网络的实质
“事物”＋“联系”
节点（vertex, point）
边（连接, 链接, 关系, 联系；edge, link, tie）
路径长度：在网络中任意选择两个节点，联通这两个节点的最短路径就是这两个节点之间的路径长度
平均路径长度：网络中所有任意两个节点之间路径长度的平均值就是网络的平均路径长度，它反映了网络的全局特征
节点的聚合/聚类系数：某节点的所有相邻节点之间连边的数目占可能的最大连边数目的比例。假设与与节点v相邻的节点有ki个，则节点v的聚合系数定义为这ki个节点之间存在边数Ei与总的可能边数ki(ki-1)/2之比
网络的聚合系数：网络中所有节点聚合系数的平均值，网络聚合系数为0表示所有节点都是孤立点，为1表示网络中任意节点间都有边相连
 Erdős 和 Renyi，分别在20世纪50年代末和60年代建立了随机图理论，被公认为开创了复杂网络理论的系统性研究
D. J. Watts, & S. H. Strogatz, Collective dynamics of ‘small-world’ networks. Nature 393, 440-442 (1998)（被引用43393次）
A. L. Barabási, R. Albert, Emergence of Scaling in Random Networks，Science 286, 509-512 (1999)（被引用36253次）
这两篇文章分别揭示了复杂网络的小世界特性和无标度特性
哈佛大学心理学家斯坦利·米拉格Stanley Milgram在1967年进行了一项著名的社会科学实验-小世界实验，获得了一个惊人的结论：社交网络中，最多通过六个人你就能够认识任何一个陌生人，他将其称之为“六度分隔”
# 小世界的基本特征
同质性：人们与志趣相投的人建立关系，体现某种“亲近”（拓扑上表现为“邻边”）
弱连接：能让人们与网络中较远的人建立关系

# “富者越富”演化模型
增长性
网络节点数不可能一成不变，它有一个增长的过程
偏好连接
新加入节点与其它已经存在的节点连接概率跟该已存在节点的度成正比


