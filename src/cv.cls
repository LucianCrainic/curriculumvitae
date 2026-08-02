\ProvidesClass{yaac-another-awesome-cv}[2020/03/24  v2.3.1 'YAAC: Another Awesome CV' Class]

\def\@@ptsize{10pt}

\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\ProcessOptions\relax

\LoadClass[a4paper,\@@ptsize]{article}

\newif\if@showLinks   \@showLinksfalse
\newif\if@isCompact   \@isCompactfalse
\newif\if@isDarkTheme \@isDarkThemefalse

\DeclareOption{green}{
  \def\@green{green}
}

\DeclareOption{red}{
  \def\@red{red}
}

\DeclareOption{indigo}{
  \def\@indigo{indigo}
}
\DeclareOption{orange}{
  \def\@orange{orange}
}

\DeclareOption{monochrome}{
  \def\@monochrome{monochrome}
}

\DeclareOption{localFont}{
  \def\@local{local}
}

\DeclareOption{alternative}{
  \def\@alternative{alternate}
}

\DeclareOption{showLinks}{ \@showLinkstrue}
\DeclareOption{compact}{ \@isCompacttrue}
\DeclareOption{light}{ \@isDarkThemefalse}
\DeclareOption{dark}{ \@isDarkThemetrue}

\ProcessOptions

% Dependences
%A Few Useful Packages
\RequirePackage[english,french]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec}
\RequirePackage{url,parskip}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{fullpage}
\RequirePackage[margin=1.5cm]{geometry}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}

% Portfolio color system, mirrored from luciancrainic.github.io.
\if@isDarkTheme
  \definecolor{cvPage}{HTML}{111316}
  \definecolor{cvText}{HTML}{EEF0F3}
  \definecolor{cvTextSoft}{HTML}{B5BAC3}
  \definecolor{cvTextFaint}{HTML}{858C98}
  \definecolor{cvBorder}{HTML}{2D3239}
  \definecolor{cvBorderStrong}{HTML}{434A54}
  \definecolor{cvAccent}{HTML}{8D93FF}
  \definecolor{cvAccentText}{HTML}{BCC0FF}
\else
  \definecolor{cvPage}{HTML}{F6F6F3}
  \definecolor{cvText}{HTML}{17191D}
  \definecolor{cvTextSoft}{HTML}{525761}
  \definecolor{cvTextFaint}{HTML}{676C75}
  \definecolor{cvBorder}{HTML}{D9DAD5}
  \definecolor{cvBorderStrong}{HTML}{B9BCB7}
  \definecolor{cvAccent}{HTML}{4D55D7}
  \definecolor{cvAccentText}{HTML}{3038A6}
\fi

% Compatibility aliases used by the original CV commands.
\colorlet{basecolor}{cvAccent}
\colorlet{linkcolor}{cvAccentText}
\colorlet{accentcolor}{cvAccent}
\colorlet{symbolcolor}{cvAccent}
\colorlet{darkGrey}{cvBorderStrong}

\AtBeginDocument{\pagecolor{cvPage}\color{cvText}\arrayrulecolor{cvBorderStrong}}

% Setup hyperref package, and colours for links
%\definecolor{linkcolour}{rgb}{0,0.2,0.6}

\if@showLinks
\hypersetup{%
  breaklinks
}%
\else
\hypersetup{%
  pdfborder = {0 0 0},
  breaklinks
}%
\fi

% Setup fancyhdr package
\fancyhf{}
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
%\fancyfoot[C]{\thepage}
\pagestyle{fancy}

%\pagestyle{empty}                         % non-numbered pages
%\font\fb=''[cmr10]''                      % for use with \LaTeX command

% Setup CV sections
\titleformat{\section}{\Large\raggedright\color{accentcolor}}{}{0em}{}[\color{cvBorder}\titlerule]
\titlespacing{\section}{0pt}{1pt}{1pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em}
\setlist[itemize,2]{label=\faAngleRight, nosep, leftmargin=1.5em}

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Mapping=tex-text}
%

% Define font to use according to localFont option
\ifundef{\@local}
{
  %\setmainfont[BoldFont = Helvetica Neue, ItalicFont=Helvetica Neue Thin Italic ,SmallCapsFont = Helvetica Neue Light]{Helvetica Neue Thin}
  \setmainfont{Source Sans Pro Light}[
    BoldFont = SourceSansPro-Regular,
  ItalicFont= Source Sans Pro Light Italic]
}
{
  \setmainfont{SourceSansPro-Light}[
    Path = fonts/,
    BoldFont = SourceSansPro-Regular,
  ItalicFont = SourceSansPro-LightIt]
}

%New length definition
\newlength{\fulllength}
\setlength{\fulllength}{16.8cm}

\newlength{\leftcolumnlength}
\setlength{\leftcolumnlength}{2.5cm}

\newlength{\rightcolumnlength}
%\setlength{\rightcolumnlength}{15.3cm minus 1cm}
%\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}
\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}

% Override default left column length of (2.5cm)
% Usage: \setleftcolumnlength{<length>}
\newcommand{\setleftcolumnlength}[1]{
  \setlength{\leftcolumnlength}{#1}
  \setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}
}

% Font Awesome icons aliases
\newcommand{\mailSymbol}{\faAt}
\newcommand{\locationSymbol}{\faMapMarker*}
\newcommand{\infoSymbol}{\faInfo}
\newcommand{\linkedinSymbol}{\faLinkedinIn}
\newcommand{\viadeoSymbol}{\faViadeo}
\newcommand{\mobileSymbol}{\faMobile*}
\newcommand{\githubSymbol}{\faGithub}
\newcommand{\stackoverflowSymbol}{\faStackOverflow}
\newcommand{\stackexchangeSymbol}{\faStackExchange}
\newcommand{\mediumSymbol}{\faMedium}
\newcommand{\bitbucketSymbol}{\faBitbucket}
\newcommand{\websiteSymbol}{\faLink}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{cvText} }
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=cvBorderStrong,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex,text=cvTextSoft]{#1};
}

% Render author's name
% Usage: \user{<firstanme>}{<lastname>}
\newcommand\user[2]{\color{accentcolor}{\LARGE #1 \textsc{\textbf{#2}}}\color{cvText}}

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{symbolcolor}{#1}#2\hspace{0.8em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{symbolcolor}{#1}\link{#2}{#3}\hspace{0.8em}}}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's tagline
% Usage: \tagline{<tag line>}
\newcommand*{\tagline}[1]{\def\@tagline{#1}}

% Define author's photo
% Usage: \photo[<shape: circular, square, roundedsquare, squircle>]{<diameter>}{<photo>}
% The shape of the author's photo is circular by default.
\newcommand{\photo}[3][circular]{\def\@photo{#3}\def\@photodiameter{#2}\def\@photoshape{#1}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{https://www.linkedin.com/in/}{linkedin.com/in/#1}}

% Render author's viadeo(optional)
% Usage: \viadeo{<viadeo-nick>}
\newcommand*{\viadeo}[1]{\sociallink{\viadeoSymbol}{https://www.viadeo.com/fr/profile/#1}{viadeo.com/fr/profile/#1}}

% Render author's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}}           % Github icon + URL

% Render author's stackoverflow profile (optional)
% Usage: \stackoverflow{<stackoverflow-user-id>}
\newcommand*{\stackoverflow}[1]{\sociallink{\stackoverflowSymbol}{https://www.stackoverflow.com/u/#1}{stackoverflow.com/u/#1}}

% Render author's stackexchange profile (optional)
% Usage: \stackexchange{<stackexchange-user-id>}
\newcommand*{\stackexchange}[1]{\sociallink{\stackexchangeSymbol}{https://stackexchange.com/users/#1}{stackexchange.com/users/#1}}

% Render author's medium (optional)
% Usage: \medium{<medium-nick>}
\newcommand*{\medium}[1]{\sociallink{\mediumSymbol}{https://www.medium.com/@#1}{medium.com/#1}}

% Render author's bitbucket (optional)
% Usage: \bitbucket{<bitbucket-account-name>}
\newcommand*{\bitbucket}[1]{\sociallink{\bitbucketSymbol}{https://bitbucket.com/#1}{bitbucket.com/#1}}

% Render author's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}

% Render a website link (optional)
% Usage: \website{<website name>}{<website adress>}
\newcommand*{\website}[2]{\sociallink{\websiteSymbol}{#1}{#2}}

% Render author's mobile phone (optional)
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}

% Render author's tagline
\newcommand\resumetitle[1]{
  \ifundef{\@alternative}{
    \par{
      \bigskip\center{\Large \color{accentcolor}\textbf{#1}\color{cvText}}\par
    }
    \bigskip
  }{
    \color{accentcolor}\textbf{\large{#1}}\color{cvText}
  }
}

\newcommand\idphoto{
  \ifthenelse{\equal{\@photoshape}{square}}{
    % Draw square photo
    \tikz\path[fill overzoom image={\@photo}]rectangle(\linewidth,\linewidth);
  }{
    \ifthenelse{\equal{\@photoshape}{roundedsquare}}{
      % Draw square photo with rounded corners
      \tikz\path[fill overzoom image={\@photo}][rounded corners=2mm]rectangle(\linewidth,\linewidth);
    }{
      \ifthenelse{\equal{\@photoshape}{squircle}}{
        % Draw squircle photo
        \tikz\path[fill overzoom image={\@photo}][rounded corners=8mm]rectangle(\linewidth,\linewidth);
      }{
        % Draw circular photo
        \tikz\path[fill overzoom image={\@photo}]circle[radius=0.5\linewidth];
      }
    }

  }
}

% Define social entries to print in header
\newcommand{\socialinfo}[1]{\def\@socialinfo{#1}}

% Render CV header
% Needs \@firstname, \@lastname and \@tagline to be defined
\newcommand*{\makecvheader}{
  \ifundef{\@alternative}{
    % \ifundef{\@photodiameter}{
    %   \begin{minipage}{\linewidth}
    % }{
    %   \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
    % }
    \color{accentcolor}\user{\@firstname}{\@lastname}\color{cvText}\\
    \small{\@socialinfo}
  \end{minipage}
  % \ifdef{\@photodiameter}{
  %   \begin{minipage}{\@photodiameter}
  %     \idphoto
  %   \end{minipage}
  % }{}
  \resumetitle{\@tagline}
}{
  \ifundef{\@photodiameter}{
    \begin{minipage}{\linewidth}
    }{
      \begin{minipage}{\dimexpr\linewidth-\@photodiameter-2em}
      }
      \user{\@firstname}{\@lastname}\\
      \resumetitle{\@tagline}
      \smallskip\\
      \small{\@socialinfo}
    \end{minipage}
    % \ifdef{\@photodiameter}{
    %   \begin{minipage}{\@photodiameter}
    %     \idphoto
    %   \end{minipage}
    % }{}
    \bigskip
  }
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\textcolor{cvTextSoft}{#1}}
  \fancyfoot[C]{\textcolor{cvTextSoft}{#2}}
  \fancyfoot[R]{\textcolor{cvTextSoft}{#3}}
}

% Resume part title definition
\newcommand\sectionTitle[2]{
\section{\texorpdfstring{#2\enspace \textsc{#1}}{#1}}}

% Define the 'keywords' environment
\newenvironment{keywords}{%
  \renewcommand{\arraystretch}{1.1}

  \begin{tabular}{>{}r>{}p{13cm}}
  }{%
  \end{tabular}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\keywordsentry[2]{
  \textbf{#1} &   #2\\
}

% Define a new column type for the scholarship environment
\newcolumntype{Y}{>{\raggedleft}p{\leftcolumnlength}}

% Define the 'scholarship' environment
\newenvironment{scholarship}{%
  \begin{tabular}{Y p{\rightcolumnlength}}
  }{%
  \end{tabular}
}

% Render a scholarshipentry in the scolarship environment
% Usage: \scholarshipentry{<date>}{<description>}
\newcommand\scholarshipentry[2]{
  #1    &  #2 \\
}

% Define the 'skills' environment
\newenvironment{skills}{%
  \begin{longtable}{R{\leftcolumnlength}p{\rightcolumnlength}}
  }{%
  \end{longtable}
}

% Render a skill in the skills environment
% Usage: \skill{<skill>}{<level>}
\newcommand\skill[2]{
  \textbf{#1}    & \foreach \x in {1,...,5}{{\color{accentcolor!80} \ifnumgreater{\x}{#2}{\faCircle[regular]}{\faCircle}}\enspace } \\
}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

% Define the 'experiences' environment
\newenvironment{experiences}{%
  \begin{longtable}{R{\leftcolumnlength}|E}
  }{%
  \end{longtable}
}

% Render an experience in the experiences environment
% Usage:
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Country>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\experience[7]{
  \textbf{#1}    & \textbf{#2, \textsc{#3}, #4}                   \\*
  \textbf{#5}    &
  \begin{minipage}[t]{\rightcolumnlength}
    #6
  \end{minipage}                    \\*
  & \footnotesize{\foreach \n in {#7}{\cvtag{\n}}}   \\
}

% Render a consultant experience in the experiences environment
% Usage:
% \consultantexperience
%  {<End date>}      {<Consultant title>}{<Consulting Enterprise>}{<Country>}
%  {<Start date}     {<Client title>}{<Client business unit>}
%                    {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\consultantexperience[9]{
  \textbf{#1}    & \textbf{#2, \textsc{#3}, #4}                   \\*
  \textbf{#5}    & \emph{#6} pour \textsc{#7}                               \\*
  &
  \begin{minipage}[t]{\rightcolumnlength}
    #8
  \end{minipage}                    \\*
  & \footnotesize{\foreach \n in {#9}{\cvtag{\n}}}   \\
}

% Define the empty separator macro with different spacing according to document class option 'compact'
\if@isCompact
\newcommand\emptySeparator{\multicolumn{2}{c}{}\\[-0.6em]}
\else
\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}
\fi

% Define the 'projects' environment
\newenvironment{projects}{%
  \par
  }{%
  \par
}

% Define the 'project' entry in the 'projects' environment
% Usage:
% \project
%   {<Project name>}{<dates>}
%   {<link1> <link2>}
%   {<Project description>}
%   {<techno1>,<techno2>}
\newcommand\project[5]{
  \noindent
  \begin{minipage}[t]{\linewidth}
    \textbf{#1} \hfill \textsc{#2}\smallskip\\
    #3\\
    #4\smallskip\\
    \footnotesize{\foreach \n in {#5}{\cvtag{\n}}}
  \end{minipage}
  \par\smallskip
}

\newcommand*\twocolumnsection[2]{
  \begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
    #1
  \end{minipage}
  \hfill
  \begin{minipage}[t]{\dimexpr(\linewidth/2) - 3em}
    #2
  \end{minipage}
}

% Define the 'referencees' environment
\newenvironment{referees}{%
}{%
  \hfill
  \bigskip
}

\newcommand*\referee[5]{
  \hspace{1em}
  \begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
    \begin{tabular}{>{}l >{}l}
      \multicolumn{2}{l}{\textbf{#1}}\\
      \multicolumn{2}{l}{\emph{#2}, \textsc{#3}}\\
      \quad \mailSymbol & \href{mailto:#4}{#4} \\
      \quad \faPhone & #5 \\
    \end{tabular}
  \end{minipage}%
}

\newcommand*\refereeMailOnly[4]{
  \hspace{1em}
  \begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
    \begin{tabular}{>{}l >{}l}
      \multicolumn{2}{l}{\textbf{#1}}\\
      \multicolumn{2}{l}{\emph{#2}, \textsc{#3}}\\
      \quad \mailSymbol & \href{mailto:#4}{#4} \\
    \end{tabular}
  \end{minipage}%
}
