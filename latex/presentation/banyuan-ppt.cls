% -*- coding: utf-8 -*-
\def\fileversion{0.1}
\def\filedate{2014/12/30}

% presentation class
\LoadClass[compress]{beamer}
\mode<presentation>

\usetheme{Montpellier}
\hypersetup{pdfpagemode=FullScreen} % makes your presentation go automatically to full screen
\usecolortheme{beaver}
\setbeamertemplate{footline}[text line]{} % makes the footer EMPTY

%\usepackage[UTF8,noindent]{ctex} %中文支持
\usepackage[BoldFont,SlantFont,CJKchecksingle]{xeCJK}
\setmainfont{Times New Roman}
\setmonofont{Courier New}
\setCJKmainfont[BoldFont=STXinwei]{DFKai-SB} %標楷體，华文新魏
%\setCJKmainfont[BoldFont=SimHei]{SimSun}
\setCJKmonofont{SimSun}% 设置缺省中文字体
%\parindent 2em   %段首缩进

\usepackage{multirow} %跨行表格  
\usepackage{subfig} %子图
\usepackage{tikz} %draw picture
\usetikzlibrary{arrows}
\usepackage{booktabs} %table
\usepackage{verbatim} %multiple line comment

\usepackage{listings} %include soure code

%\usepackage{marvosym} %more beautiful symbols
\usepackage{wasysym} %checkbox

%pre-set figure width
\newlength{\fullpicwidth}
\setlength{\fullpicwidth}{0.8\columnwidth}
\newlength{\midpicwidth}
\setlength{\midpicwidth}{0.4\columnwidth}
\newlength{\tinypicwidth}
\setlength{\tinypicwidth}{0.35\columnwidth}
\newlength{\otherpicwidth}

\renewcommand*\thesubfigure{\arabic{subfigure}} 

%hide all subsubsection
\setcounter{tocdepth}{2}
%automatically creat content before every section
\AtBeginSection{
    \begin{frame}{Section}
        \tableofcontents[sections={\thesection}]
    \end{frame}
    \addtocounter{framenumber}{-1}  %目录页不计算页码
}

\newcommand{\createtitle}{
    \begin{frame}[plain]
        \titlepage
    \end{frame}
}

\newcommand{\createoutline}{
    \begin{frame}[plain]{Outline}
        \tableofcontents[hideallsubsections]
    \end{frame} 
}

\newcommand{\createlastpage}{
    \begin{frame}[plain]
        \titlepage
    \end{frame}
}
%todo: if bg exist, then use bg
%{
%\usebackgroundtemplate{%
%    \tikz\node[opacity=0.3] {\includegraphics[height=\paperheight]{./res/halloween.jpg}};}
%\begin{frame}[plain]
%    \titlepage
%\end{frame}
%}
