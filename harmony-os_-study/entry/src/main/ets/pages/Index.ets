import { FirList }from "../view/FirList"
import { HomeTabs } from "../view/HomeTabsComponent"
import { MessageHead } from '../view/MessageHead';
import { Mine } from '../view/Mine';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  @State message: string = 'Hello World';

  build() {
    Column(){
      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          HomeTabs()
        }.tabBar("主页")
        TabContent(){
          MessageHead()
        }.tabBar("联系人")
        TabContent(){
          Mine()

        }.tabBar("我的")
      }
      .barHeight(80)
      .barMode(BarMode.Fixed)
      .onChange((index : number)=>{
        this.currentIndex = index
        console.log(`index:${index}`)
      })
    }
    .height('100%')
    .padding({ top: '0.00vp', right: '12', bottom: '0.00vp', left: '12.00vp' })

  }
}