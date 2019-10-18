\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tdtp}[2015/11/23 Version 0.1]

\RequirePackage{color}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{ifthen}
\RequirePackage{tcolorbox}
\RequirePackage{verbatim}

%% En fonction du programme utilisé pour compiler le document (XeTex ou pdflatex)
%% on utilise des packages différents.
\RequirePackage{ifxetex}
\ifxetex
  \RequirePackage{polyglossia}
  \RequirePackage{fontspec}
\else
  \RequirePackage[utf8]{inputenc}
\fi

%% Booléens et options pour la formation.
\newboolean{sis}
\newboolean{mscs}
\newboolean{an1}
\newboolean{an2}


\setboolean{sis}{false}
\setboolean{mscs}{false}
\setboolean{an1}{false}
\setboolean{an2}{false}


\DeclareOption{SIS}{\setboolean{sis}{true}}
\DeclareOption{CS}{\setboolean{mscs}{true}}
\DeclareOption{2A}{\setboolean{an2}{true}}
\DeclareOption{1A}{\setboolean{an1}{true}}


%% Booléens et options pour le type de sujet
\newboolean{tp}
\newboolean{td}
\newboolean{be}
\newboolean{corrige}

\setboolean{tp}{false}
\setboolean{td}{false}
\setboolean{be}{false}
\setboolean{corrige}{false}

\DeclareOption{TP}{\setboolean{tp}{true}}
\DeclareOption{TD}{\setboolean{td}{true}}
\DeclareOption{BE}{\setboolean{be}{true}}
\DeclareOption{corrige}{\setboolean{corrige}{true}}

%% Titre du TD/TP/BE
\def\titrecomplet{\color{red} Pensez au titre !}
\newcommand{\titre}[1]{\def\titrecomplet{#1}}


%% Les options inconnues sont passées à la classe article.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Processing des options
\ProcessOptions*


%% Définition de la formation
\def\form{\color{red} Formation !}
\ifthenelse{\boolean{sis}}{\def\form{Majeure de 3A:SIS}}{}
\ifthenelse{\boolean{mscs}}{\def\form{Mastère spécialisé en CyberSécurité}}{}
\ifthenelse{\boolean{an1}}{\def\form{1A cursus CentraleSupélec}}{}
\ifthenelse{\boolean{an2}}{\def\form{2A cursus CentraleSupélec}}{}

\newcommand{\formation}[1]{\def\form{#1}}

%% Définition du type de sujet

\def\type{\color{red} BE/TP/TD ??}
\ifthenelse{\boolean{td}}{\def\type{TD}}{}
\ifthenelse{\boolean{tp}}{\def\type{TP}}{}
\ifthenelse{\boolean{be}}{\def\type{BE}}{}


\LoadClass[a4paper,11pt]{article}

%% On charge le paquet hyperref seulement après avoir chargé la classe article.
\RequirePackage{hyperref}
\RequirePackage[a4paper, left=25mm, right=20mm, top=41mm, bottom=28mm, headsep=10mm, headheight=5mm, footskip=15mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\newtcolorbox{mybox}[1]{breakable,colback=red!5!white,colframe=red!75!black,fonttitle=\bfseries,title=#1}
\newcommand{\reponse}[1]{\ifthenelse{\boolean{corrige}}{\begin{mybox}{Corrigé}#1\end{mybox}}{}}
\newenvironment{reponse2}{%
\ifthenelse{\not\boolean{corrige}}%
{\expandafter\comment}%
{\begin{mybox}{Corrigé}}%
}%
{%
\ifthenelse{\not\boolean{corrige}}%
{\expandafter\endcomment}%
{\end{mybox}}%
}

\renewcommand{\maketitle}{%
\begin{center}%
\LARGE \textbf{\@title}
\end{center}
\rule{\linewidth}{0.1mm}
}%
\renewcommand{\title}[2][]{%
    \def\@title{#2}%
    \def\shortitle{\ifthenelse{\NOT \equal{#1}{}}{#1}{#2}}%
}%


\pagestyle{fancy}
\lhead{
\setlength{\unitlength}{1mm}
\begin{picture}(0,0)
\put(-20,-18){\includegraphics[width=45mm]{CentraleSupelec_Logo.pdf}}
\end{picture}}


\chead{\shortitle}
\rhead{\type / \form }

\lfoot{\@author}
\cfoot{\@date}
\rfoot{%
\thepage\ / \pageref{LastPage}%
}%

%% Langue du document
\ifxetex
  \setdefaultlanguage{french}
  \setotherlanguage{english}
\else
  \RequirePackage[english, french]{babel}
\fi


\endinput
