# StacksHelp
This is a version of a bash loop from the Stacks Manual and RadStacksHelpR that can be used to automatically run iterations of the Stacks pipeline to easily optimize parameters. 

Each bash script is for a different parameter. First, you should run the "m" script to iterate through values of m, then use the RadStacksHelpR "m" script to visualize the optimum value. Next, run the "M" script using the optimum value of m that you've just obtained. Then repeat the same process for "n". 

For the bash scripts, the only things that you should change are 1), the name of your taxon; 2) path to the popmap; 3) path to the processed rad tags; 4) path to the output Stacks folder. 

To more easily download all of the outputs for visualization, you can run the "download_loop.sh" from your local device. The annoying part is that you will have to put in the 2-factor log-in info for each folder. Just make sure to specify the directory in that loop as well. 



