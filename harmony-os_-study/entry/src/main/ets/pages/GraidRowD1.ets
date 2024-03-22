@Entry
@Component
struct Index {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  build() {
    GridRow({
      columns:{
        md:24,
      },
      //direction:GridRowDirection.Row,
      gutter:{x:50,y:-5},
      breakpoints: {
        value: ['320vp', '600vp', '840vp'],
        reference: BreakpointsReference.WindowSize //断点切换参考物
      }
    }) {
      ForEach(this.bgColors, (color:Color, index) => {
        GridCol({
          span: {
            xs: 2, // 在最小宽度类型设备上，栅格子组件占据的栅格容器2列。
            sm: 3, // 在小宽度类型设备上，栅格子组件占据的栅格容器3列。
            md: 6, // 在中等宽度类型设备上，栅格子组件占据的栅格容器4列。
            lg: 12, // 在大宽度类型设备上，栅格子组件占据的栅格容器6列。
            // xl: 8, // 在特大宽度类型设备上，栅格子组件占据的栅格容器8列。
            // xxl: 12 // 在超大宽度类型设备上，栅格子组件占据的栅格容器12列。
          }
        }) {
          Row() {
            Text(`${index}`)
          }.width("100%").height('50vp')
        }.backgroundColor(color)
      })
    }
  }
}