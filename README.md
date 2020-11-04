# dFCwalk
*****************************************************
dFCwalk MATLAB toolbox
*****************************************************

We have developed a framework to describe the dynamics of Functional Connectivity (dFC) 
estimated from brain activity time-series as a complex random walk in the space of possible 
functional networks. This conceptual and methodological framework considers dFC as a 
smooth reconfiguration process, combining “liquid” and “coordinated” aspects. 
Unlike other previous approaches, our method does not require the explicit extraction 
of discrete connectivity states.

We provide here MATLAB functions implementing several metrics for the quantitative 
characterization of the dFC random walk. 

First, dFC speed analyses extract the distribution of the time-resolved rate 
of reconfiguration of FC along time, for typical speed or scaling analyses. 

Second, meta-connectivity (MC) analyses identify groups of functional links whose 
fluctuations co-vary in time and that define veritable dFC modules organized along 
specific dFC meta-hub controllers (differing from conventional FC modules and hubs). 
The decomposition of whole-brain dFC by MC allows performing dFC speed analyses 
separately for each of the detected dFC modules.

Although we applied such analyses mostly to fMRI resting state data, 
in principle our methods can be extended to any type of neural activity 
(from Local Field Potentials to EEG, MEG, fNIRS, etc.) or even non-neural time-series.


Code contributors:
Demian Battaglia & Lukas M. Arbabyazd

Code testing: 
Demian Battaglia, Lukas M. Arbabyazd, Diego Lombardo

Project responsibles:
Demian Battaglia, Viktor Jirsa

Project consultants:
Mira Didic, Olivier Blin


*****************************************************
Toolbox installation
*****************************************************

Download the toolbox folder and add it to Matlab path

External toolboxes as the Brain Connectivity Toolbox (https://sites.google.com/site/bctnet/)
or the Fluctuation Analysis Toolbox (https://github.com/marlow17/FluctuationAnalysis) may also be 
useful companions.


*****************************************************
Function instructions
*****************************************************

Different functions have an extensive help. Just type the name of the function at the MATLAB
prompt to get a description of the syntax and the aim of each function.

You can also find a description of the toolbox and a few pipelines of analysis that are feasible
with it in the MethodsX manuscript:

Lukas M. Arbabyazd, Diego Lombardo, Olivier Blin, Mira Didic, Demian Battaglia & Viktor Jirsa 
Dynamic Functional Connectivity as a complex random walk: definitions and the dFCwalk toolbox,
in press.

*****************************************************
Contact
*****************************************************

For information and requests, contact:

Demian Battaglia (demian.battaglia@univ-amu.fr)
Viktor Jirsa (viktor.jirsa@univ-amu.fr)

