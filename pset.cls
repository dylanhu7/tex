\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pset}
\LoadClass[]{article}

% Packages for document formatting
\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=1in]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}
\RequirePackage[american]{babel}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{titling}
\RequirePackage[titles]{tocloft}
\RequirePackage{multicol}
\RequirePackage[most]{tcolorbox}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[capitalize]{cleveref}

% Left-align title
\pretitle{\begin{flushleft}\LARGE}
        \posttitle{\par\end{flushleft}}
\preauthor{\begin{flushleft} \large}
        \postauthor{\end{flushleft}
    \begin{flushleft}
        \@prof\par\@course\par
    \end{flushleft}}
\predate{\begin{flushleft}\large}
        \postdate{\par\end{flushleft}}
\setlength{\droptitle}{-46pt}

% remove table of contents title
\makeatletter
\renewcommand\tableofcontents{%
    \@starttoc{toc}%
}
\renewcommand{\cftdot}{}
\setlength{\columnsep}{2cm}

\newcommand{\prof}[1]{\gdef\@prof{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}

\newtcolorbox[auto counter,number within=section]{problem}[2][section]{
    colback=white, colframe=black!75!white,
    title=Problem #2,
    code={
            \phantomsection
            \addcontentsline{toc}{#1}{Problem #2}
        },
    breakable,
    phantomlabel={sec:\thetcbcounter.#2}
}


