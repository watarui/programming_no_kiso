type ekikan_tree_t = Empty
                   (* Leaf は左右の子が Empty であるような Node で代用する *)
                   (* 駅名（漢字）, [(その駅に直接つながっている駅名（漢字）, その駅までの距離), ...] *)
                   | Node of ekikan_tree_t * string * (string * float) list * ekikan_tree_t
