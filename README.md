# Dependencies
To execute the program you need to install the following modules:
 - FileIO
 - ImageView
 - ColorTypes
 - Images
 - Colors

That can be achieved from the Julia interpreter. Executing the following commands:
```
    using Pkg
    Pkg.add("FileIO");Pkg.add("ImageView")
    Pkg.add("ColorTypes");Pkg.add("Images");Pkg.add("Colors")
```

# Execution
*lenna.png* can be replaced with a valid image path. 

```
    julia lbp.jl lenna.png
```




