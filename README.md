# TDT4165Assignment4


## Task 3 Whatis the benefit of running on two separate threads?

Running two threads allows the cpu to compute multiple instructions at the same time. With dataflow and stream there are no race conflicts in this case. 

## Task 4 How does lzy affect task 3 in terms of throughput and resource usage?

Without lazy the Generate and Product functions ran at the same time. Product would be blocked by the unbound variables and generate would make several datapoints before product would continue. With lazy they would each block the other. Product would need the next value and then generate would generate only that, then producer would need the next and that would be generated. The effect is that the two run sequentially. The resorce usage is less as the product function would only be given one value and the result of its previus product.