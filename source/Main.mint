record Ui.Pager.Item {
  contents : Html,
  name : String
}

component Main {
  connect Application exposing { page, setPage }

  get pages : Array(Ui.Pager.Item) {
    [
      {
        name = "home",
        contents = <Home/>
      },
      {
        name = "donations",
        contents = <Donations/>
      },
      {
        name = "roadmap",
        contents = <RoadMap/>
      },
      {
        name = "news",
        contents = <News/>
      },
      {
        name = "not_found",
        contents =
          <div>
            <{ "404" }>
          </div>
      }
    ]
  }

  fun render : Html {
    <div>
      <{ content }>
      </div>
  } where {
    content =
      pages
      |> Array.find((item : Ui.Pager.Item) : Bool => { item.name == page })
      |> Maybe.map((item : Ui.Pager.Item) : Html => {item.contents })
      |> Maybe.withDefault(<div/>)
  }
}