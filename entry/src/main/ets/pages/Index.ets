
import { HomeTabs } from "../view/HomeTabsComponent"

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      HomeTabs()
    }
    .height('100%')
    .padding({ top: '0.00vp', right: '12', bottom: '0.00vp', left: '12.00vp' })

  }
}