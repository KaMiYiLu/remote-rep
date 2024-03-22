import { HomeTabsItem, CommonConstants as Const } from '../viewmodel/Common';

import { RecommendList, SwiperList } from '../viewmodel/HomeTabsModel';
import { MyMine } from './MyMine';
import { RecentlyPlayed } from './RecentlyPlayedComponent';
import { Recommended } from './RecommendedComponent';


@Component
export struct Mine {
  // @Link currentBreakpoint: string;
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_head'))
          .width($r('app.float.home_image_size'))
      }

      Row() {
        Text($r('app.string.head_recently'))
      }

      Row() {
        Scroll(this.scroller) {
          // 标题
          GridRow({
            columns: { xs: 4, sm: 4, md: 8, lg: 12 },
            gutter: { x: 24 },
            breakpoints: { value: ['320vp', '520vp', '840vp'] }
          }) {
            // 轮播图
            GridCol({ span: { xs: 4, sm: 4, md: 12, lg: 12 } }) {
              Swiper() {
                ForEach(SwiperList, (item: HomeTabsItem) => {
                  Stack({ alignContent: Alignment.TopStart }) {
                    Image(item.img)
                      .width(Const.FULL_SIZE)
                      .height(Const.FULL_SIZE)
                      .borderRadius($r('app.float.home_swiper_radius'))
                      .objectFit(ImageFit.Cover)

                    Column() {
                      Text(item.title)
                        .fontSize($r('app.float.home_text_size1'))
                        .fontColor(Color.White)
                        .margin({ bottom: $r('app.float.home_text_margin_1') })
                      Text(item.intro)
                        .fontSize($r('app.float.home_text_size3'))
                        .fontColor(Color.White)
                        .opacity(Const.OPACITY)
                    }
                    .alignItems(HorizontalAlign.Start)
                    .margin({ top: $r('app.float.home_text_margin_3'), left: $r('app.float.home_text_margin_2') })
                  }
                }, (item: HomeTabsItem) => JSON.stringify(item))
              }
              .height($r('app.float.home_swiper_height'))
              .itemSpace(Const.ITEM_SPACE)
              .autoPlay(true)

              // .displayCount(this.currentBreakpoint === Const.LG ?
              // Const.NUM_3 : (this.currentBreakpoint === Const.MD ? Const.NUM_2 : Const.NUM_1))
            }
            .height($r('app.float.home_grid_height2'))

            //我的主页
            GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
              MyMine()
            }
            .height($r('app.float.home_column_height'))
            GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
              RecentlyPlayed()
            }
            .height($r('app.float.home_grid_height3'))
          }
          .height('100%')
        }
        .width('100%')
        .height('100%')
        .align(Alignment.TopStart)
        .scrollBar(BarState.Off)
      }
    }
  }
}


