%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% <UTF-8>
%% 河海大学研究生毕业论文模板　- Latex 03-19-2021
%% 论文样式参考《河海大学研究生学位论文编写格式规定、模板与示例》
%%             http://gs.hhu.edu.cn/2020/0929/c3576a213269/page.htm
%% 基于ctexbook
%% 参考北航研究生毕业论文模板　https://github.com/CheckBoxStudio/BUAAThesis.git
%% 
%% 初始版本作者:
%%      Wei Zhilong (weizhilong@hhu.edu.cn)
%% 
%% Versions:
%%      v1.0 Wei Zhilong (03-19-2021)
%%
%% !!!!! Warning:
%%      此模板并非官方发布，不能保证可以用于论文最终提交及归档！！！！
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%---------------------模板标识------------------------------%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HHU-thesis}[03-05-2021 v1.0 HHU thesis class]
\typeout{This is LaTeX template HHU-thesis. Version 1.0 (based on CTeX) 03-05-2021}

%%---------------------模板选项------------------------------%%
%% 论文类型
\DeclareOption{master}{\gdef\@thesis{master}}             % 学术硕士论文
\DeclareOption{doctor}{\gdef\@thesis{doctor}}             % 博士论文
\DeclareOption{thesis}{\ClassWarning{HHU-thesis}{%
    You have not specified the THESIS option. The word thesis should be replaced by one of the following thesis type: master(default), professional, doctor.
}}


%% 打印设置
\DeclareOption{oneside}{\gdef\@printtype{oneside}} % 单面打印
\DeclareOption{twoside}{\gdef\@printtype{twoside}} % 双面打印
\DeclareOption{printtype}{\ClassWarning{HHU-thesis}{%
    You have not specified the PRINTTYPE option. The word printtype should be replaced by one of the following thesis type: oneside, twoside.
}}

%% 适应首字母大写
\DeclareOption{Master}{\gdef\@thesis{master}}
\DeclareOption{Doctor}{\gdef\@thesis{doctor}}

%% 选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

%% 默认选项配置
\ExecuteOptions{master,oneside,a4paper}
\ProcessOptions\relax

%% 引用ctexbook: 小4,1.25倍行距
\LoadClass[UTF8,zihao=-4,linespread=1.4]{ctexbook}

%% 预声明
\RequirePackage{ifthen}       % ifthenelse/equal/isundefined等判断比较命令
\RequirePackage{etoolbox}     % \AtBeginDocument等宏命令
\RequirePackage{titletoc}     % 目录
\RequirePackage{remreset}     % 计数器设置
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fancyhdr}     % 设置页眉页脚
\RequirePackage{setspace}     % 设置行间距
\RequirePackage{float}        % 图片
\RequirePackage{graphicx}     % 图片
\RequirePackage{subcaption}   % 图片
\RequirePackage{epstopdf}     % 图片
\RequirePackage{array}        % 列举
\RequirePackage{enumitem}     % 列举
\RequirePackage{booktabs}     % 表格上下粗线
\RequirePackage{longtable}    % 长表格
\RequirePackage{multirow}     % 多行表格
\RequirePackage{caption}      % 标题设置
\RequirePackage{listings}     % 代码环境
\RequirePackage{algorithm2e}  % 算法环境
\RequirePackage{amsmath}      % 数学
\RequirePackage{amsthm}       % 定理
\RequirePackage{hyperref}     % 超链接
\RequirePackage[sort&compress]{natbib}              % BibTex
\RequirePackage{ulem}         % 下划线
\RequirePackage{soul}         % 下划线
\setul{}{0.4pt}
\RequirePackage{lastpage}     % 统计页数
\RequirePackage[list=off]{bicaption}                % 图片表格中英双行题注
\RequirePackage{bm}           % 公式加粗
\RequirePackage{tikz}         % 绘图
\RequirePackage{tabularx}     % 固定长度表格
\RequirePackage{newtxtext}        % 正文New times Roman字体
\let\lvert\relax
\let\lVert\relax
\let\rVert\relax
\let\rvert\relax
\RequirePackage{newtxmath}        % 公式New times Roman字体
\RequirePackage{pgffor}           % 循环
\RequirePackage{calc}             % 字符长度
\RequirePackage{xstring,xifthen}  % 字符替换
\RequirePackage{siunitx}		  % 国际单位
\DeclareGraphicsExtensions{.eps,.ps,.png,.jpg,.bmp,.pdf} % 声明使用图像格式
\newcommand{\highlight}[1]{\colorbox{yellow}{#1}}   % 高亮注释

%%---------------------输入信息------------------------------%%
\def\@refcolor{} % 给注释及引用使用颜色 on/off
\newcommand{\refcolor}[1]{\gdef\@refcolor{#1}}
\def\@emptypagewords{} % 空白页留字
\newcommand{\emptypagewords}[1]{\gdef\@emptypagewords{#1}}
\def\@beginright{} % 摘要、目录、第一章右侧页起 on/off
\newcommand{\beginright}[1]{\gdef\@beginright{#1}}

\newcommand{\Author}[2]{\gdef\@authorcn{#1} \gdef\@authoren{#2}}
\newcommand{\StudentID}[1]{\gdef\@studentid{#1}}
\newcommand{\Degree}[2]{\gdef\@degreecn{#1} \gdef\@degreeen{#2}}
\newcommand{\Branch}[2]{\gdef\@branchcn{#1} \gdef\@branchen{#2}}
\newcommand{\Major}[1]{\gdef\@major{#1}}
\newcommand{\Field}[1]{\gdef\@field{#1}}
\newcommand{\Department}[2]{\gdef\@departmentcn{#1} \gdef\@departmenten{#2}}

\newcommand{\Tutor}[2]{\gdef\@tutorcn{#1} \gdef\@tutoren{#2}}
\newcommand{\TutorDegree}[2]{\gdef\@tutordegreecn{#1} \gdef\@tutordegreeen{#2}}
\newcommand{\TutorLevel}[1]{\gdef\@tutorlevel{#1}}

\newcommand{\Title}[2]{\gdef\@titlecn{#1} \gdef\@titleen{#2}}
\def\@subtitlecn{}
\def\@subtitleen{}
\newcommand{\Subtitle}[2]{\gdef\@subtitlecn{#1} \gdef\@subtitleen{#2}}
\def\@thesislang{汉}
\newcommand{\ThesisLanguage}[1]{\gdef\@thesislang{#1}}
\def\@abstractlang{汉、英}
\newcommand{\AbstractLanguage}[1]{\gdef\@abstractlang{#1}}
\newcommand{\WordCount}[1]{\gdef\@wordcount{#1}}

\newcommand{\DateCover}[2]{%
    \gdef\@datecoverm{#1}
    \gdef\@datecovery{#2}}
\newcommand{\DateGrant}[3]{%
    \gdef\@dategrantm{#1}
    \gdef\@dategrantd{#2}
    \gdef\@dategranty{#3}}
\newcommand{\DateSubmit}[3]{%
    \gdef\@datesubmitm{#1}
    \gdef\@datesubmitd{#2}
    \gdef\@datesubmity{#3}}
\newcommand{\DateDefence}[3]{%
    \gdef\@datedefencem{#1}
    \gdef\@datedefenced{#2}
    \gdef\@datedefencey{#3}}

\newcommand{\Committeechair}[1]{\gdef\@committeechair{#1}}
\newcommand{\Committeemember}[1]{\gdef\@committeemember{#1}}

\newcommand{\CLC}[1]{\gdef\@clc{#1}}
\newcommand{\UDC}[1]{\gdef\@udc{#1}}
\newcommand{\Permission}[1]{\gdef\@permission{#1}}

\def\@preface{}
\newcommand{\Preface}[1]{\gdef\@preface{#1}}
\newcommand{\Abstract}[2]{\gdef\@abstrctcn{#1} \gdef\@abstrcten{#2}}
\newcommand{\Keyword}[2]{\gdef\@keywordcn{#1} \gdef\@keyworden{#2}}
\newcommand{\Listfigtab}[1]{\gdef\@listfigtab{#1}} 			% on/off
\newcommand{\Abbreviations}[1]{\gdef\@abbreviations{#1}}

%%---------------------标题设置------------------------------%%
%% 半角/缩进/行伸缩设置
\ctexset{%
	punct=quanjiao, % 全角
	autoindent=2,  % 缩进
	linestretch=2, % 行伸缩
}
%% 部分标题修改
\ctexset{%
	contentsname={目录},
	listfigurename={图目录},
	listtablename={表目录},
}
% 文档章节层数
\setcounter{secnumdepth}{4}

%- 设置目录引导符号间隔
\renewcommand\@dotsep{0.25}

%% 标题样式
\ctexset{%
    chapter={%章标题 : 小二黑体居中 单倍行距 段前/段后7.5磅 另起新页
		format=\zihao{-2} \heiti \centering \thispagestyle{fancy},
		fixskip=true,
		aftername=\space,
		beforeskip=15pt,
		afterskip=15pt,
		break=\clearautopage,
	},
	section={%节标题 : 三号黑体居左 单倍行距 段前/段后7.5磅
		format=\zihao{3} \heiti \raggedright,
		aftername=\space,
		beforeskip=7.5pt,
		afterskip=7.5pt,
	},
	subsection={%条标题 : 小三号黑体居左 单倍行距 段前6磅/段后3磅
		format=\zihao{-3} \heiti \raggedright,
		aftername=\space,
		beforeskip=6pt,
		afterskip=3pt,
	},
	subsubsection={% 附加4级标题 : 四号仿宋居左 段前3磅/段后0磅
		format=\zihao{4} \fangsong \raggedright,
		aftername=\space,
		beforeskip=3pt,
		afterskip=0pt,
	},
}

%% 设置图表标题样式
\captionsetup[figure]{
	position=bottom, margin=0mm,
	aboveskip=6pt, belowskip=-15pt, justification=centerlast,format=plain,font={small,bf},labelsep=space}
\captionsetup[table]{
	position=top, margin=0mm,
    aboveskip=0pt, belowskip=0pt, justification=centerlast,format=plain,font={small,bf},labelsep=space}
\DeclareCaptionOption{bi-first}[]{}% 1st language
\DeclareCaptionOption{bi-second}[english]{% 2nd language
    \def\tablename{Table}%
    \def\figurename{Fig.}%
}
\captionsetup[bi-first]{bi-first}%
\captionsetup[bi-second]{bi-second,labelsep=space}%

%% 更改公式、图标编号
\counterwithin{figure}{section}
\counterwithin{table}{section}
\numberwithin{equation}{section}


%%---------------------页面设置------------------------------%%
\geometry{a4paper,left=2.7cm,right=2.7cm,top=1.5cm,bottom=1.75cm,includehead,includefoot}
%\geometry{a4paper,left=2.7cm,right=2.7cm,top=2.54cm,bottom=2.54cm,showframe}

%% 清空页眉页脚格式
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

%%---------------------目录设置------------------------------%%
%% 目录层数
\setcounter{tocdepth}{1}
%% 目录格式
\titlecontents{chapter}[0pt]{\vspace{6pt}\settowidth{\hangindent}{\thecontentslabel}\bfseries\songti\zihao{-4}}
{\thecontentslabel}{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage\vspace{6pt}}

\titlecontents{section}[0.42cm]{\settowidth{\hangindent}{\thecontentslabel\ \ }\songti\zihao{-4}}
{\thecontentslabel\ \ }{}
{\hspace{.25em}\titlerule*[4pt]{$\cdot$}\contentspage}

%% 删去章间空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%% 删去缩进
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}% Default: 1.5em/2.3em
\let\l@table\l@figure

%%---------------------参考文献------------------------------%%
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\citeall}[1]{\citeauthor{#1}\upcite{#1} (\citeyear{#1})}

%%---------------------工具函数------------------------------%%
\newcommand{\checkinput}{%检测输入元素
	\ifthenelse{\isundefined{\@authorcn}}{\errmessage{%
		Please set title by 'Author'.}}{}
	\ifthenelse{\isundefined{\@studentid}}{\errmessage{%
		Please set title by 'StudentID'.}}{}
	\ifthenelse{\isundefined{\@degreecn}}{\errmessage{%
		Please set title by 'Degree'.}}{}
	\ifthenelse{\isundefined{\@branchcn}}{\errmessage{%
		Please set title by 'Branch'.}}{}
	\ifthenelse{\isundefined{\@major}}{\errmessage{%
		Please set title by 'Major'.}}{}
	\ifthenelse{\isundefined{\@field}}{\errmessage{%
		Please set title by 'Field'.}}{}
	\ifthenelse{\isundefined{\@departmentcn}}{\errmessage{%
        Please set department by 'Department'.}}{}
	\ifthenelse{\isundefined{\@tutorcn}}{\errmessage{%
        Please set department by 'Tutor'.}}{}
	\ifthenelse{\isundefined{\@tutordegreecn}}{\errmessage{%
        Please set department by 'TutorDegree'.}}{}
	\ifthenelse{\isundefined{\@tutorlevel}}{\errmessage{%
        Please set department by 'TutorLevel'.}}{}
	\ifthenelse{\isundefined{\@titlecn}}{\errmessage{%
        Please set title by 'Title'.}}{}
	\ifthenelse{\isundefined{\@wordcount}}{\errmessage{%
        Please set title by 'WordCount'.}}{}
	\ifthenelse{\isundefined{\@datecoverm}}{\errmessage{%
        Please set title by 'DateCover'.}}{}
	\ifthenelse{\isundefined{\@dategranty}}{\errmessage{%
        Please set graduate date by 'DateGraduate'.}}{}
    \ifthenelse{\isundefined{\@datesubmity}}{\errmessage{%
        Please set submite date by 'DateSubmit'.}}{}
    \ifthenelse{\isundefined{\@datedefencey}}{\errmessage{%
        Please set defence date by 'DateDefence'.}}{}
	\ifthenelse{\isundefined{\@committeechair}}{\errmessage{%
        Please set defence date by 'CommitteeChair'.}}{}
	\ifthenelse{\isundefined{\@committeemember}}{\errmessage{%
        Please set defence date by 'CommitteeMembers'.}}{}
	\ifthenelse{\isundefined{\@clc}}{\errmessage{%
        Please set CLC by 'CLC'.}}{}
    \ifthenelse{\isundefined{\@udc}}{\errmessage{%
        Please set UDC by 'UDC'.}}{}
    \ifthenelse{\isundefined{\@permission}}{\errmessage{%
        Please set Permission by 'Permission'.}}{}
	\ifthenelse{\equal{\@refcolor}{\empty}}{}{%
        \ifthenelse{\equal{\@refcolor}{on} \OR \equal{\@refcolor}{off}}{}{
    		\errmessage{Please use 'on' of 'off' for refcolor.}}
    }
  	\ifthenelse{\equal{\@beginright}{\empty}}{}{%
        \ifthenelse{\equal{\@beginright}{on} \OR \equal{\@beginright}{off}}{}{
            \errmessage{Please use 'on' of 'off' for beginright.}}
    }
  	\ifthenelse{\isundefined{\@listfigtab}}{}{%
        \ifthenelse{\equal{\@listfigtab}{on} \OR \equal{\@listfigtab}{off}}{}{
        	\errmessage{Please use 'on' of 'off' for listfigtab.}}
    }
}

% 公式
\newcommand\eu{\mathrm{e}}
\newcommand\iu{\mathrm{i}}
\newcommand*{\diff}{\mathop{}\!\mathrm{d}}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

\newcommand{\clearautopage}{%右侧起新页
    \clearpage
    \ifthenelse{\equal{\@printtype}{twoside}}{% 双面
        \ifodd\c@page
        \else
            \hbox{}
            \vspace*{\fill}
            \begin{center}
                {\textcolor[rgb]{0.75,0.75,0.75}{\@emptypagewords}}
            \end{center}
            \vspace{\fill}
            \thispagestyle{empty}
            \newpage
            \if@twocolumn \hbox{} \newpage \fi
        \fi
    }{}
}

\newcommand\userline{\bgroup\markoverwith{\rule[-0.35ex]{2pt}{0.4pt}}\ULon}

\newcommand{\ulinetextc}[2][]{
	\ifthenelse{\equal{#1}{}}{\userline{\hfill #2 \hfill}}{\userline{\makebox[#1]{#2}}}
}

\useunder{\userline}{\ulined}{}

\newcommand{\sethyper}{%设置链接引用颜色
    \ifthenelse{\equal{\@refcolor}{on}}{%
        \hypersetup{
			colorlinks=true,
            linkcolor={red!50!black},
            citecolor={blue!50!black},
            urlcolor={blue!80!black},
        }
    }{%
        \hypersetup{
			hidelinks,
            allcolors=black,
        }
    }
}

\newcommand{\laycommitteemembers}[1]{%答辩委员会成员
	\foreach \member [count=\ni] in #1 {%
		\ifnum\ni=1%
		\ulinetextc[1.5cm]{\member}%
		\else%
		、\hspace{-5pt}\ulinetextc[1.5cm]{\member}%
		\fi%
	}
}

\newcommand{\nomenclatureitem}[3][ ]{%符号说明
    \noindent\makebox[0.16\textwidth][l]{#2}{{#3}\hfill{#1}}\par
}

%%---------------------翻译------------------------------%%
\newcommand{\TranMonth}[1]{%月份翻译
	\ifthenelse{\equal{\@datecoverm}{1}}{January}{
	\ifthenelse{\equal{\@datecoverm}{2}}{February}{
	\ifthenelse{\equal{\@datecoverm}{3}}{March}{
	\ifthenelse{\equal{\@datecoverm}{4}}{April}{
	\ifthenelse{\equal{\@datecoverm}{5}}{May}{
	\ifthenelse{\equal{\@datecoverm}{6}}{June}{
	\ifthenelse{\equal{\@datecoverm}{7}}{July}{
	\ifthenelse{\equal{\@datecoverm}{8}}{August}{
	\ifthenelse{\equal{\@datecoverm}{9}}{September}{
	\ifthenelse{\equal{\@datecoverm}{10}}{October}{
	\ifthenelse{\equal{\@datecoverm}{11}}{November}{
	\ifthenelse{\equal{\@datecoverm}{12}}{December}{
	}}}}}}}}}}}}
}

%%---------------------文档结构------------------------------%%
%% AfterPreamble = AtBeginDocument
%% AtEndPreamble -> AtBeginDocument -> AfterEndPreamble -> AtEndDocument -> AfterEndDocument
\AtEndPreamble{%
	\sethyper
}

\AtBeginDocument{%
    \checkinput
}

\AfterEndPreamble{%
	\makecovercn
	\makecoverinner
	\makecoveren
	\makestatement

	\renewcommand{\headrulewidth}{0.4pt}
	\fancyfoot[C]{\zihao{-5} \uppercase\expandafter{\romannumeral \thepage}}
	\setcounter{page}{1}
    \ifthenelse{\equal{\@thesis}{master}}{%
        \fancyhead[CE]{\zihao{-5} 河海大学硕士学位论文}}{}
    \ifthenelse{\equal{\@thesis}{doctor}}{%
        \fancyhead[CE]{\zihao{-5} 河海大学博士学位论文}}{}
	\ifthenelse{\equal{\@thesis}{doctor}}{
		\makepreface}{}
    \fancyhead[CO]{\zihao{-5} 摘要}
    \abstructkeywordcn
    \fancyhead[CO]{\zihao{-5} ABSTRACT}
    \abstructkeyworden
    \makecontextlist
    \fancyhead[CO]{\zihao{-5} 符号说明}
	\denotation

	\fancyfoot[C]{\zihao{-5} \thepage}
	\ifthenelse{\equal{\@thesis}{master}}{%
        \fancyhead[CO]{\zihao{-5} 河海大学硕士学位论文}}{}
    \ifthenelse{\equal{\@thesis}{doctor}}{%
        \fancyhead[CO]{\zihao{-5} 河海大学博士学位论文}}{}
	\fancyhead[CE]{\zihao{-5} \leftmark}
	\setcounter{page}{1}
}

%% 制作封面及声明
\newcommand{\makecovercn}{% 中文封面
	{\pdfbookmark[0]{中文封面}{makecovercn}
		\ \vspace{-20pt}
		\begin{spacing}{2.0}
			{\zihao{4}\indent 分类号：\ulinetextc[4.6cm]{\@clc} \hfill 学号：\ulinetextc[3.2cm]{\@studentid}}\\
			{\zihao{4}\indent \makebox[3em][s]{U D C}：\ulinetextc[4.6cm]{\@udc} \hfill 密级：\ulinetextc[3.2cm]{\@permission}}\\
		\end{spacing}
		\vspace{-10pt}
		
		\begin{figure}[h]
			\centering
			\includegraphics[width=8.3cm]{./figures/logo/hohai_logo}
		\end{figure}
        \vspace{-10pt}

        \begin{center}
            {\zihao{2} 
            \ifthenelse{\equal{\@thesis}{master}}{%
                硕士学位论文}{}
            \ifthenelse{\equal{\@thesis}{doctor}}{%
                博士学位论文}{}
            }
            \vspace{15pt}

            \zihao{1} \heiti \@titlecn\\
            \hfill \ifthenelse{\equal{\@subtitlecn}{}}{}{\zihao{2}——\@subtitlecn}
            \vspace{36pt}

            \zihao{4}\songti \@authorcn
        \end{center}
        
        \begin{spacing}{2.0}
			\raggedright\zihao{4}\songti
			\makebox[7em][l]{指导教师姓名：}\ulinetextc{\@tutorcn~~~~\@tutordegreecn~~~~\@tutorlevel}\\
			\makebox[7em][l]{}\ulinetextc{\@departmentcn}\\
			申请学位级别：\ulinetextc[4.2cm]{\@branchcn\@degreecn}
            \hfill 专业名称：\ulinetextc[5.0cm]{\@major}\\
			论文提交日期：\ulinetextc[4.2cm]{\@datesubmity\ 年\@datesubmitm\ 月\@datesubmitd\ 日
			}\hfill 论文答辩日期：\ulinetextc[4.2cm]{\@datedefencey\ 年\@datedefencem\ 月\@datedefenced\ 日
			}\\
			学位授予单位和日期：\ulinetextc{河~海~大~学~~~~~~\@dategranty\ 年\@dategrantm\ 月\@dategrantd\ 日
			}\\
			答辩委员会主席：\hspace{-7pt}\ulinetextc[1.8cm]{\@committeechair}\hspace{-5pt}
			答辩委员会成员：\hspace{-7pt}\laycommitteemembers{\@committeemember}
		\end{spacing}
		
		\vspace*{\fill}
		
		\begin{center}
			\zihao{4} \@datecovery 年\@datecoverm 月~~~~中~~国~~~~$\cdot$~~~~南~~京
		\end{center}

	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\makecoveren}{% 英文封面
	{\pdfbookmark[0]{英文封面}{makecoveren}
		\ \vspace{-15pt}
		\begin{center}
			\begin{spacing}{2.0}
				{\zihao{2} \bfseries \@titleen \ifthenelse{\equal{\@subtitleen}{}}{}{---\@subtitleen}}
			\end{spacing}
			
			\vspace*{\fill}
			
			\begin{spacing}{1.6}
				\zihao{-3} 
				Dissertation Submitted to\\ 
				{\bfseries HoHai University}\\
				In Fulfillment of the Requirement\\
				For the Degree of\\
				{\bfseries {\@degreeen} of \@branchen}
			\end{spacing}
			\vspace{70pt}
			
			\begin{spacing}{1.7}
				\zihao{4} 
				By\\
				{\bfseries \@authoren}\\
				{\bfseries (\@departmenten)}\\
				\vspace{60pt}
				Dissertation Supervisor: \@tutordegreeen~~\@tutoren\\
				\vspace{60pt}
				Nanjing, P. R. China\\{\TranMonth{\@datecoverm}}, \@datecovery
			\end{spacing}
		\end{center}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\makecoverinner}{% 封面内页
	{\pdfbookmark[0]{题目页}{makecoverinner}
		{\tiny \phantom{first line shift}}
		\vspace{-30pt}
		\begin{spacing}{2.5}
			\raggedright\zihao{4}\songti
			分类号(中图法)\ulinetextc[2.4cm]{\@clc}\hfill UDC(DDC)\ulinetextc[1.7cm]{\@udc}\hfill 密级\ulinetextc[3.2cm]{\@permission}\\
			论文作者姓名\ulinetextc[2.7cm]{\@authorcn}\hfill 学号\ulinetextc[3.7cm]{\@studentid}\hfill 单位\ulinetextc[2.7cm]{河海大学}\\
            \newlength{\titlecnlen}
            \settowidth{\titlecnlen}{论文中文题名\@titlecn}
            论文中文题名\ifthenelse{\titlecnlen >\textwidth}{\userline{\@titlecn}}{\ulinetextc{\@titlecn}}\\
			论文中文副题名\ulinetextc{\ifthenelse{\equal{\@subtitlecn}{}}{无}{\@subtitlecn}}\\
            \newlength{\titleenlen}
            \settowidth{\titleenlen}{论文英文题名\@titleen}
			论文英文题名\ifthenelse{\titleenlen > \textwidth}{\ul\@titleen}{\ulinetextc{\@titleen}}\\
            论文英文副题名\ulinetextc{\ifthenelse{\equal{\@subtitleen}{}}{无}{\@subtitleen}}\\
			论文语种\ulinetextc[1.2cm]{\@thesislang}
            论文摘要语种\ulinetextc[1.6cm]{\@abstractlang}
            论文页数\ulinetextc[0.9cm]{\pageref{LastPage}}
            论文字数\ulinetextc[0.9cm]{\@wordcount}(万)\\
            \newlength{\keywordcnlen}
            \settowidth{\keywordcnlen}{论文主题词\StrSubstitute{\@keywordcn}{；}{、}}
            论文主题词\ifthenelse{\keywordcnlen >\textwidth}{\userline{\StrSubstitute{\@keywordcn}{；}{、}}}{\ulinetextc{\StrSubstitute{\@keywordcn}{；}{、}}}\\
			申请学位级别\ulinetextc[3cm]{\@branchcn\@degreecn}\hfill 专业名称\ulinetextc[7cm]{\@major}\\
			研究方向\ulinetextc{\@field}\\
			指导教师姓名\ulinetextc[3.2cm]{\@tutorcn~~\@tutordegreecn}\hfill 导师单位\ulinetextc[7cm]{\@departmentcn}\\
            论文答辩日期\ulinetextc{\@datedefencey\ 年\@datedefencem\ 月\@datedefenced\ 日
            }\\
		\end{spacing}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\makestatement}{% 论文声明
	{\pdfbookmark[0]{论文声明}{makestatement}
		
		\begin{spacing}{1.75}
			\zihao{4}\bfseries
			学位论文独创性声明：
			\par~
			
			本人所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果。与我一同工作的同事对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。如不实，本人负全部责任。
			\bigskip\bigskip\bigskip\bigskip\bigskip
			
			论文作者(签名)：\rule[-2pt]{4.5cm}{1pt} \hfill \makebox[7em][s]{年 月 日}
			\bigskip\bigskip\bigskip\bigskip\bigskip
			
			学位论文使用授权说明：
			
			河海大学、中国科学技术信息研究所、国家图书馆、中国学术期刊(光盘版)电子杂志社有权保留本人所送交学位论文的复印件或电子文档，可以采用影印、缩印或其他复制手段保存论文。本人电子文档的内容和纸质论文的内容相一致。除在保密期内的保密论文外，允许论文被查阅和借阅。论文全部或部分内容的公布(包括刊登)授权河海大学研究生院办理。
			\bigskip\bigskip\bigskip\bigskip\bigskip
			
			论文作者(签名)：\rule[-2pt]{4.5cm}{1pt} \hfill \makebox[7em][s]{年 月 日}\\
		\end{spacing}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\makepreface}{% 博士论文前言
	{\pdfbookmark[0]{前言}{makepreface}
		\begin{spacing}{1.41}%
			\chapter*{前言}
			
			{\zihao{-4} \songti \@preface}	
		\end{spacing}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\abstructkeywordcn}{% 中文摘要
	{\pdfbookmark[0]{中文摘要}{abstructkeywordcn}
		
		\begin{spacing}{1.41}%
			\chapter*{摘要}
			
			{\zihao{-4} \songti
				\@abstrctcn \par~
				
				{\noindent\heiti 关键词：} \@keywordcn
			}			
		\end{spacing}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\abstructkeyworden}{% 英文摘要
	{\pdfbookmark[0]{英文摘要}{abstructkeyworden}
		
		\begin{spacing}{1.41}%1.25
			\chapter*{Abstract}
			
			{\zihao{-4}
				\@abstrcten \par~
				
				{\noindent\bfseries Keywords:} \@keyworden
			}
		\end{spacing}
		
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\makecontextlist}{%目录
    {\pdfbookmark[0]{目录}{makecontextlist}
        \fancyhead[CO]{\zihao{-5} 目录}
		\tableofcontents
		\renewcommand\addvspace[1]{}
  	\ifthenelse{\isundefined{\@listfigtab}}{}{%
    	\ifthenelse{\equal{\@listfigtab}{on}}{%
      		\renewcommand{\addvspace}[1]{}
      		\clearpage
            \pdfbookmark[0]{图目录}{listoffigures}
            \fancyhead[CO]{\zihao{-5} 图目录}
      		\listoffigures
      		\clearpage
            \pdfbookmark[0]{表目录}{listoftables}
            \fancyhead[CO]{\zihao{-5} 表目录}
      		\listoftables
    	}{}
  	}
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\denotation}{% 缩写定义
	{\ifthenelse{\isundefined{\@abbreviations}}{}{%
    	\pdfbookmark[0]{符号说明}{denotation}
    	\chapter*{符号说明}
    	\@abbreviations
	}
	\ifthenelse{\equal{\@beginright}{off}}{\clearpage}{\clearautopage}
}}

\newcommand{\acknowledgments}{%致谢
	\ctexset{chapter/numbering=false}
	\chapter{致谢}
}


\newcommand{\appendixuser}{%附录
	\ctexset{chapter/numbering=false}
	\chapter{附录}
}