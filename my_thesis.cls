\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{my_thesis}[213/09/13 Custom Package]
\LoadClass[letterpaper,11pt]{book}

% ============================================================================
% Various stuff
\usepackage{amsfonts,amsmath,amsthm,amssymb}
\usepackage[outer=1in,inner=1.3in,top=1.1in,bottom=1.1in]{geometry}
\usepackage[USenglish]{babel}

% ============================================================================
% Colors
\usepackage[dvipsnames,table]{xcolor} 
\definecolor{aoi}{HTML}{69D2E7}
\definecolor{pond}{HTML}{A7DBD8}
\definecolor{beach}{HTML}{E0E4CC}
\definecolor{goldfish}{HTML}{F38630}
\definecolor{pills}{HTML}{FA6900}
\definecolor{darkaoi}{HTML}{004541}

% ============================================================================
% Fonts 
\usepackage{newpxtext}
\usepackage{newpxmath}
\linespread{1.1}              % Palatino needs a little more leading

%Make math to be boldface in boldface environments, like titles
\makeatletter
\g@addto@macro\bfseries{\boldmath}
\makeatother

%Boldface font for caption name for figures/tables
\usepackage[labelfont=bf,labelsep=period]{caption}

% ============================================================================
% Headers
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RE]{{\nouppercase{\thepage\hfill\itshape\leftmark}}}
\fancyhead[LO]{{\nouppercase{\itshape\rightmark}\hfill\thepage}}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0pt}

% ============================================================================
% For hyperlinks

\usepackage{hyperref} 
\def\mylinkcolor{pills!60!black}
\hypersetup{colorlinks=true,urlcolor=\mylinkcolor,citecolor=\mylinkcolor,linkcolor=\mylinkcolor} 

% Use cleveref - for some reason it needs to be declared after hyperref
\usepackage[nameinlink,sort]{cleveref}
\crefname{enumi}{statement}{statements}


% ============================================================================
% Theorems
\usepackage[most]{tcolorbox}

\tcbset{
    theostyle/.style={ % Theorems
        theorem style=plain,
        fonttitle=\bfseries\upshape,
        fontupper=\slshape,
        breakable,
        enhanced,
        arc=0.2mm, 
        boxrule=0.3mm, 
        colback=\shade,
        colframe=\theocolor,
        coltitle=black,
        description delimiters parenthesis,
        separator sign= {},
        terminator sign={.},
        borderline west={2mm}{0mm}{\theocolor}
        },
    plaintheostyle/.style={ % Plain, for less important: lemmas, propositions,..
        theorem style=plain,
        fonttitle=\bfseries\upshape,
        fontupper=\slshape,
        breakable,
        enhanced,
        arc=0.2mm, 
        boxrule=0.3mm, 
        colback=\shade,
        colframe=\generaltheocolor,
        coltitle=black,
        description delimiters parenthesis,
        separator sign= {},
        terminator sign={.},
        borderline west={2mm}{0mm}{\generaltheocolor}
    },
    defstyle/.style={ % Definitions
        theorem style=plain,
        fonttitle=\bfseries\upshape,
        fontupper=\upshape,
        breakable,
        enhanced,
        arc=0.2mm, 
        boxrule=0.3mm, 
        colback=\shade,
        colframe=\defcolor,
        coltitle=black,
        description delimiters parenthesis,
        separator sign= {},
        terminator sign={.},
        borderline west={2mm}{0mm}{\defcolor}
        }
} %%%%% end of tcbset %%%%%

\newtcbtheorem[number within=chapter,crefname={theorem}{theorems}]%
{theorem}   % \begin..
{Theorem}   % Title
{theostyle}
{theorem}   % label prefix; cite as ``theo:yourlabel''

\newtcbtheorem[use counter from=theorem,crefname={definition}{definitions}]%
{definition} % \begin..
{Definition} % Title
{defstyle}   % Style
{definition} % label prefix

\newtcbtheorem[use counter from=theorem,crefname={lemma}{lemmas}]%
{lemma}             % \begin..
{Lemma}             % Title
{plaintheostyle}    % Style
{lemma}             % label prefix

\newtcbtheorem[use counter from=theorem,crefname={proposition}{propositions}]%
{proposition}       % \begin..
{Proposition}       % Title
{plaintheostyle}    % Style
{proposition}       % label prefix

\newtcbtheorem[use counter from=theorem,crefname={corollary}{corollaries}]%
{corollary}         % \begin..
{Corollary}         % Title
{plaintheostyle}    % Style
{corollary}         % label prefix

% I want remarks without a box
\newtcbtheorem[use counter from=theorem,crefname={remark}{remarks}]%
{remark} % \begin..
{Remark} % Title
{   
    theorem style=plain,
    label type=remark,
    fonttitle=\slshape,
    fontupper=\upshape,
    breakable,
    arc=0.2mm, 
    boxrule=0mm, 
    top=0mm,
    bottom=0mm,
    left=0mm,
    right=0mm,
    colback=white,
    coltitle=black,
    colframe=white,
    boxsep=0pt, % Otherwise there is slight right shift of the text
    terminator sign={.}
} % Style
{remark} % label prefix

% I want examples a little different
\newtcbtheorem[use counter from=theorem,crefname={example}{examples}]%
{example} % \begin..
{Example} % Title
{  theorem style=plain,
   colback=white,
   breakable,
   enhanced,
   fonttitle=\Large\slshape,
   description font=\normalsize\upshape,
   coltitle=\excolor!1!black,
   parbox=false, % To fix indentation
   boxrule=0.3mm, 
   arc=0.2mm, 
   colframe=\excolor,
   borderline west={2mm}{0mm}{\excolor},
   terminator sign={.}
} % Style
{example} % label prefix

% Proof environment
\tcolorboxenvironment{proof}{% ’proof’ from ’amsthm’
blanker,
breakable,
parbox=false % To fix indentation
}

\def\myqedsymbol{
    \tikz\filldraw [ fill=beach, draw=black!2!beach,
    line width=0.1mm ] (0,0) rectangle +(0.23,0.23);
}
\renewcommand{\qedsymbol}{\myqedsymbol}
