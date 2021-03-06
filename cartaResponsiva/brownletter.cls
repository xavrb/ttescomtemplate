%
% brownletter.cls -- a document class for writing letters with Brown letterhead 
%
% Copyright 2003, Nesime Tatbul (tatbul@cs.brown.edu)
%
% Notes:
%
% 1. This class can be used for creating letters with Brown logo at the
%    header and CS department address at the footer (as in standard Brown
%    letterhead stationery).
% 2. It is based on the standard Latex document class, letter.cls.
% 3. Required packages are epsfig and ifthen.
% 4. If Brown logo is to be included in the head, then the file
%    brownlogo.eps must be provided. Otherwise, the logo is omitted.
% 5. For example usage, please see brownletter_example.tex
% 
% Please contact tatbul@cs.brown.edu to report any problems or bugs.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brownletter}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{epsfig}
\RequirePackage{ifthen}
\DeclareGraphicsExtensions{.eps}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[letterpaper]{letter} % we always use letter paper

\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

\newboolean{logofound}
\IfFileExists{logoescom.png}
    {\setboolean{logofound}{true}}
    {\setboolean{logofound}{false}}

\setlength{\textwidth}{6.875in}
\setlength{\textheight}{7.0in}
\setlength{\topskip}{0.0in}
\setlength{\footskip}{1.0in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\setlength{\topmargin}{-0.875in}

\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{9}

\newsavebox{\departmenthead}
\newsavebox{\departmentfoot}
\newsavebox{\emptyfoot}

\sbox{\departmenthead}{
    \begin{tabular*}{\textwidth}
                    {@{}l@{\extracolsep{0.0in}} @{\extracolsep{0.5in}}l@{} }
    \parbox{4.625in}{\raggedright
        \ifthenelse{\boolean{logofound}}
           {\epsfig{file=ipnLogo.jpg, height=0.9in}}
           {\parbox[t][1.0in][t]{2.0in}{\hfill} 
            \ClassWarning{brownletter}{brownlogo.eps COULD NOT BE FOUND!}}
    } &
    \parbox[c][1.0in]{2.125in}{\epsfig{file=logoescom.png, height=0.7in}}\\
    \end{tabular*}
}

\savebox{\departmentfoot}[\textwidth][c]{\ixcmrmn
    Brown University 
    ~Box 1910 / 115 Waterman Street
    ~Providence, RI 02912 
    ~TEL: 401 863-7600 
    ~FAX: 401 863-7657
}

\savebox{\emptyfoot}[\textwidth][c]{\ixcmrmn
    \hspace*{\textwidth}
}

% header and footer should be placed only on the first page
\renewcommand{\ps@firstpage}{
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{1.0in}
    \renewcommand{\@oddhead}{\usebox{\departmenthead}}
    \renewcommand{\@oddfoot}{\usebox{\departmentfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{}
}

\renewcommand{\ps@empty}{
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{}
    \renewcommand{\@oddfoot}{\usebox{\emptyfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{\usebox{\emptyfoot}}
}

\providecommand{\@evenhead}{}
\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}
\providecommand{\@oddfoot}{}

\pagestyle{empty}

% we add the subject command to the opening
 
% we push closing to the right
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \hspace*{0.6\textwidth}\parbox{0.4\textwidth}{\raggedright
    \ignorespaces #1\\[4\medskipamount]%
    \ifx\@empty\fromsig
        \fromname
    \else \fromsig 
    \fi\strut}%
    \par
}