grViz('
digraph { //directed graph
    "總攻" -> "受";
    "強攻" -> "受";
    "健氣攻" -> "受";
     }'
)

grViz('
graph { //non-directed graph
    "總 攻" -- "受";
    "強 攻" -- "受";
    "健氣攻" -- "受";
     }'
)