import { friendData, IFriend } from '../model/FirDataModel'

@Component
export struct FirList {
  //列表
  build() {
    List() {
      ForEach(friendData, (item: IFriend) => {
        ListItem() {
          Column() {
            Row() {
            }
            Text(`序列${item.id}`)
            Row() {
              Image($rawfile(item.icon))
                .height(60)
                .width(60)
              Text(`${item.name}`)
            }

            Divider().height(30).color($r("app.color.my_color"))
          }
          .alignItems(HorizontalAlign.Start)
        }
      })
    }
  }
}

