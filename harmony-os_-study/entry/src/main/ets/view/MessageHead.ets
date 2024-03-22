

import { HomeTabsItem, CommonConstants as Const } from '../viewmodel/Common';

import { SwiperList } from '../viewmodel/HomeTabsModel';
import { FirList } from './FirList';
import { RecentlyPlayed } from './RecentlyPlayedComponent';
import { Recommended } from './RecommendedComponent';


@Component
export struct MessageHead {
  // @Link currentBreakpoint: string;
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      // 标题
      GridRow({
        columns: { xs: 4, sm: 4, md: 8, lg: 12 },
        gutter: { x: 24 },
        breakpoints: { value: ['320vp', '520vp', '840vp'] }
      }) {
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
          Row() {
            Text($r('app.string.message_home'))
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
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
          Search({ placeholder: '搜索...' })
            .width('100%')
            .height($r('app.float.home_search_height'))
            .margin({ bottom: $r('app.float.home_margin1') })
            .placeholderFont({ size: $r('app.float.home_search_size') })
        }
        .height($r('app.float.home_grid_height1'))

        //列表
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          FirList()
        }
        .height($r('app.float.home_column_height'))
      }.height('10%')

    }.width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
  }

}


