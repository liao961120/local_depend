library(DiagrammeR)

var <- 1:3

grViz("
digraph { //non-directed graph
      graph [layout = neato]  //layout = dot|neato|twopi|circo|fdp
      
      node [shape = circle,
      style = filled,
      color = orange]
      
      node [fillcolor = red]
      a [label = '受']
      
      node [fillcolor = orange1]  //orange1-4
      b [label = '@@1-1']
      c [label = '@@1-2']
      d [label = '@@1-3']
      
      edge [color = grey, arrowhead = none, arrowtail = none]
      {b c d} -> a
      }
      
      # Comments for Ref: vector of length=3
      [1]: paste('Number: ', var, sep='')   

      ")
