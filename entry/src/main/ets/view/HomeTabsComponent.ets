

import { HomeTabsItem, CommonConstants as Const } from '../viewmodel/Common';

import { SwiperList } from '../viewmodel/HomeTabsModel';
import { RecentlyPlayed } from './RecentlyPlayedComponent';
import { Recommended } from './RecommendedComponent';


@Component
export struct HomeTabs {

  // @Link currentBreakpoint: string;
  private scroller: Scroller = new Scroller();

  build(){
    Scroll(this.scroller) {
      // 标题
      GridRow({
        columns: { xs: 4, sm: 4, md: 8, lg: 12 },
        gutter: { x: 24},
        breakpoints: { value: ['320vp', '520vp', '840vp'] }
      }){
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
          Row() {
            Text($r('app.string.title_home'))
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(500)
              .width('100%')
              .margin({
                top: $r('app.float.home_title_margin'),
                bottom: $r('app.float.home_title_margin'),
                left: $r('app.float.home_title_margin')
              })
          }
        }
        .height($r('app.float.title_height'))
        .margin({ bottom: $r('app.float.home_margin1') })

        // 搜索
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 8 } }) {
          Search({ placeholder: '搜索...' })
            .width('100%')
            .height($r('app.float.home_search_height'))
            .margin({ bottom: $r('app.float.home_margin1') })
            .placeholderFont({ size: $r('app.float.home_search_size') })
        }
        .height($r('app.float.home_grid_height1'))

        // 轮播图
        GridCol({ span: { xs: 4, sm: 4, md: 4, lg: 4 } }) {
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

        // 最近播放
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          RecentlyPlayed()
        }
        .height($r('app.float.home_grid_height3'))


        // 为你推荐
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Recommended()
        }
        .height($r('app.float.home_column_height'))


      }
        .height('100%')




    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
  }

}