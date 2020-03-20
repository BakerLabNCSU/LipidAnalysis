# An In-depth Assessment of the Molecular Signatures of Preeclampsia and Gestational Diabetes Mellitus Utilizing 
Multi-Omics Analyses and Innovative Visualization Tools

*Melanie T. Odenkirk, Kelly G. Stratton, Marina A. Gritsenko, Lisa M. Bramer, Bobbie-Jo Webb-Robertson, 
Jennifer Kyle, Kent J. Bloodsworth, Karl K. Weitz, Jeremy Ash, Denis Fourches, Brandie D. Taylor, 
Kristin E. Burnum-Johnson, Erin S. Baker*

## Usage
To run any of the r scripts provided, clone the repository and open the **lipidvisualization.Rproj** file in Rstudio.
Run the scripts within the project, so that they can find the relevant paths on your machine.

## Files

* The *analyses* folder contains three rmarkdown files and one r script, which perform the majority of the analyses reported in the paper.
	* **PD_Lipid_SMILES.r**: Reads in lipid identifications, compiles SMILES annotations for annotated lipid species from LIPID MAPS. Outputs lipidome clustering profile of identified
lipids using an ECFP_6 fingerprint, Euclidean distance and average linkage method. 
	* **All_lipid_HG_Associations.rmd**: Takes the clustering profile off all identified lipids as input. Maps biological variability of GDM and PRE diseases to clustering pattern. See already rendered report: **All_lipid_HG_Associations.html.**
	* **SIG_lipid_HG_Associations.rmd**: Takes the clustering profile off all identified lipids as input. Maps biological variability of GDM and PRE diseases to clustering pattern. See already rendered report: **SIG_lipid_HG_Associations.html.**
	* **Lipid_FA_Clustering.rmd**: Parses lipid identifications by fatty acyl components. Plots biological variability of GDM and PRE diseases by FA classifications.  See already rendered report: **Lipid_FA_Clustering.html.**
* The *analyses/data folder* contains the data used by each analysis script.
	* **GDM vs. Ctrl__Negative.csv**: Output from statistical analysis of GDM vs. Ctrl comparisons of lipids identified in negative ESI analysis.
	* **GDM vs. Ctrl__Positive.csv**: Output from statistical analysis of GDM vs. Ctrl comparisons of lipids identified in positive ESI analysis.
	* **PRE vs. Ctrl__Negative.csv**: Output from statistical analysis of PRE vs. Ctrl comparisons of lipids identified in negative ESI analysis.
	* **PRE vs. Ctrl__Positive.csv**: Output from statistical analysis of PRE vs. Ctrl comparisons of lipids identified in positive ESI analysis.
	* **All_Lipid_SMILES.csv**: Compiled lipid identifications and SMILES annotations of all lipids identified in GDM vs. Ctrl and PRE vs. Ctrl analyses.
	* **fp_all_lipid.rdata**: Clustering output of all identified lipids. 
	* **Lipid_SIG_SMILES.csv**: Compiled lipid identifications and SMILES annotations of all lipids identified in GDM vs. Ctrl and PRE vs. Ctrl analyses.
	* **fp_sig_lipid.rdata**: Clustering output of significantly idnetified lipids in either GDM vs. Control or PRE vs. Control comparisons. 
	* **lipid_color_classification.csv**: Annotation of lipid head group for differentiation tree nodes by lipid head group classification. 
	* **FA_Clustering_tail length order_ALL_Lipids.tiff**: P-value heatmap grouping of all identified lipids by fatty acyl composition.
	* **FA_Clustering_tail length order_SIG_Lipids.tiff**: P-value heatmap grouping of all significant lipids in Disease versus Control comparison by fatty acyl composition.
* Lipid data used for statistical analysis is provided in Supplemental Table S3.
