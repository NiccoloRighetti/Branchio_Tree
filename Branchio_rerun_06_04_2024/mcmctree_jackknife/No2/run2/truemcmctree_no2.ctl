          seed = -1
       seqfile = /mnt/z/Ricerca/Branchio_New_Analyses/Branchio_rerun_06_04_2024/mcmctree_jackknife/input_files_clock2_jk/fna_concat.phy
      treefile = /mnt/z/Ricerca/Branchio_New_Analyses/Branchio_rerun_06_04_2024/mcmctree_jackknife/input_files_clock2_jk/tree_calib_no2.tree
      mcmcfile = mcmc.txt
       outfile = out.txt

         ndata = 1
       seqtype = 0    * 0: nucleotides; 1:codons; 2:AAs
       usedata = 2 /mnt/z/Ricerca/Branchio_New_Analyses/Branchio_rerun_06_04_2024/mcmctree_jackknife/input_files_clock2_jk/in.BV 1    * 0: no data (prior); 1:exact likelihood;
                      * 2:approximate likelihood; 3:out.BV (in.BV)
         clock = 2    * 1: global clock; 2: independent rates; 3: correlated rates

         model = 4    * 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85
         alpha = 2  * alpha for gamma rates at sites
         ncatG = 5    * No. categories in discrete gamma

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

       BDparas = 1 1 0.1    * birth, death, sampling

   rgene_gamma = 2 10.99   * gammaDir prior for rate for genes
  sigma2_gamma = 1 10  * gammaDir prior for sigma^2     (for clock=2 or 3)

         print = 1       * 0: no mcmc sample; 1: everything except branch rates 2: everything
        burnin = 100000
      sampfreq = 1000 
       nsample = 20000
