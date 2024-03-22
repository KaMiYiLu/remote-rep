@Entry
@Component
struct Index {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown';
  build() {

    GridRow({ columns: { sm: 4, md: 8 }, breakpoints: { value: ['200vp', '300vp', '400vp', '500vp', '600vp'] } ,direction: GridRowDirection.RowReverse}) {
      ForEach(this.bgColors, (color:Color, index) => {
        GridCol({offset:4}) {
          Row() {
            Text(`${index + 1}`)
          }.width('100%').height('50')
        }.backgroundColor(color)
      })
    }
  }
}