import { HomeTabsItem, CommonConstants as Const } from '../viewmodel/Common';
import { RecentlyPlayList, RecommendList } from '../viewmodel/HomeTabsModel';

@Component
export struct MyMine {
  build() {
    Column() {
      Row() {
        Text($r('app.string.title_home_like'))
          .fontSize($r('app.float.home_text_size1'))
          .fontWeight(Const.FONT_WEIGHT)
        Blank()
        Text($r('app.string.title_home_more'))
          .fontSize($r('app.float.home_text_size2'))
          .opacity(Const.OPACITY)
        Image($r('app.media.ic_more'))
          .width($r('app.float.home_image_size'))
      }
      .width(Const.FULL_SIZE)
      .height($r('app.float.home_row_width1'))
      .padding({
        top: $r('app.float.home_margin3'),
        left: $r('app.float.home_margin2'),
        right: $r('app.float.home_margin2')
      })
      Row() {
        List({ space: Const.ITEM_SPACE }) {
          ForEach(RecommendList, (item: HomeTabsItem) => {
            ListItem() {
              Column() {
                Image(item.img)
                  .height($r('app.float.home_image_height2'))
                  .margin({ bottom: $r('app.float.home_margin1') })
              }
            }
          }, (item: HomeTabsItem) => JSON.stringify(item))
        }
        .width(Const.FULL_SIZE)
        .height($r('app.float.home_list_height2'))
        .listDirection(Axis.Horizontal)
      }
      .width(Const.FULL_SIZE)
      .height($r('app.float.home_column_height'))

    }
  }
}
