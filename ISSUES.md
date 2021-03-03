# GITHUB ISSUES

# layers 

Hi everybody,

I am trying to refactor code that I have seen being used here
by others into a  module for simplyfying and managing
layers and variable states. I am quite new to coding in ruby
and using karabiner and I have stumbled on a problem. I would
like ask here and see if there is something obvious that
I am missing or not understanding.

Explanation of goal with code attached:

Eg. 
    1. press-hold `j` -> command
    2. press-hold `spacepar` -> enter `space layer`
    3. press `f` key -> output `tab`
        
        now since we are holding down j and pressing
        f the output should be cmd+tab which would
        switch applictation by using thumbs and homerow only.

This is an example of how I have my qmk kb setup.
So that I can reach every command necessary on homerow.

hold down space gives me vi keys and tab/alt/enter on left hand.

# PROBLEM

code compiles BUT ONLY vi left arrow works as expected.

I see that the variable is set properly with eventviewer 
it seems but only spacebar-h works.

Am I doing something obvious wrong??

Also, I think that it is pretty neat how the actual json.rb 
file becomes quite small and much clearer to work with.
 
I am happy for other comments or critique as well.

# export 

how add application support to path?
