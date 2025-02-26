using MyFirstPackage
using Documenter

DocMeta.setdocmeta!(MyFirstPackage, :DocTestSetup, :(using MyFirstPackage); recursive=true)

makedocs(;
    modules=[MyFirstPackage],
    authors="Erdong-Huang",
    sitename="MyFirstPackage.jl",
    format=Documenter.HTML(;
        canonical="https://Erdong-Huang.github.io/MyFirstPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Erdong-Huang/MyFirstPackage.jl",
    devbranch="main",
)
