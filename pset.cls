\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pset}
\LoadClass[]{article}

% Packages for document formatting
\usepackage[utf8]{inputenc}
\usepackage[margin=1in]{geometry}
\usepackage[T1]{fontenc}
\usepackage{amsmath,amssymb,amsthm,amsfonts}
\usepackage[american]{babel}
\usepackage{microtype}
\usepackage{graphicx}
\usepackage{titling}
\usepackage{xparse}
\usepackage[titles]{tocloft}
\usepackage{multicol}
\usepackage[most]{tcolorbox}
\PassOptionsToPackage{hidelinks}{hyperref}
\PassOptionsToPackage{capitalise}{cleveref}

% remove table of contents title
\makeatletter
\renewcommand\tableofcontents{%
    \@starttoc{toc}%
}
\renewcommand{\cftdot}{}
\setlength{\columnsep}{2cm}

\newcommand{\prof}[1]{\gdef\@prof{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}

\renewcommand{\maketitle}{%
    \setlength{\parskip}{2pt}
    \begin{multicols}{2}
        \raggedcolumns{}
        \begin{flushleft}
            \Large \@title\par
            \vspace{0.5em}
            \large \@author\par
            \vspace{0.5em}
            \normalsize\@prof\par\@course\par
            \vspace{0.5em}
            \@date
        \end{flushleft}
        \columnbreak{}
        \tableofcontents
    \end{multicols}
    \setlength{\parskip}{1em}
}


\setlength{\parskip}{1em}
\setlength{\parindent}{0pt}

\newif\iffancyproblem
\fancyproblemtrue % default to true, can be changed based on user's selection

\DeclareOption{fancy}{\fancyproblemtrue}
\DeclareOption{plain}{\fancyproblemfalse}
\ProcessOptions\relax

\newenvironment{proof*}{\begin{proof}[\unskip\nopunct]}{\end{proof}}
\newenvironment{solution}{\begin{proof}[Solution]}{\end{proof}}

\iffancyproblem
    \newtcolorbox[auto counter,number within=section]{problem}[2][section]{
        colback=white, colframe=black!75!white,
        title=Problem #2,
        code={
                \phantomsection
                \addcontentsline{toc}{#1}{Problem #2}
            },
        breakable,
        phantomlabel={problem:\thetcbcounter.#2}
    }
\else
    \newtheorem{innerproblem}{Problem}

    % Redefining the problem environment
    \NewDocumentEnvironment{problem}{O{section} o}{%
    \IfValueTF{#2}{%
        \begin{innerproblem}[#2]
    }{%
        \begin{innerproblem}
            }
            }{%
            \addcontentsline{toc}{#1}{Problem \theinnerproblem}
        \end{innerproblem}
    }
\fi

