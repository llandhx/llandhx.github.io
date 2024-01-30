import router from '@ohos.router'
import HomeComponent1 from './HomeComponent1'
import HomeComponent2 from './HomeComponent2'
import HomeComponent3 from './HomeComponent3'
@Entry
@Component
struct Home {
  @State message: string = 'Hello World'
  @Builder NavigationTitle() {
    Column(){
      Text('首页').padding({top:10,bottom:0}).fontColor(Color.Black)
        .fontSize(25)
        .lineHeight(40)
        .fontWeight(500)
      Row() {
        Image('/images/modular.png').height(35).width(35)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Home/Classification'
            })
          })
        Search({ value: '', placeholder: '搜索美食' })
          .searchButton('搜索')
          .placeholderFont({ size: 15 })
          .textFont({ size: 20, weight: FontWeight.Bold })
          .textAlign(TextAlign.Start)
          .width('80%')
          .onSubmit((value: string) => {
            router.pushUrl({
              url:'pages/Home/FoodSearch'
            })
          })
        Image('/images/notification.png').height(35).width(35)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Home/Massage'
            })
          })
      }.width('100%').height(60).padding({left:10,right:10})
    }.width('100%')
  }
  build() {
    Navigation() {
      Row() {
        Column() {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              HomeComponent1()
            }

            ListItem() {
              Text('热门食谱').fontSize(30)
                .lineHeight(40)
                .fontWeight(500)
            }

            ListItem() {
              HomeComponent2()
            }.onClick(() => {
              router.pushUrl({
                url: 'pages/Home/FoodSearch'
              })
            })

            ListItem() {
              Text('更多推荐').fontSize(30)
                .lineHeight(40)
                .fontWeight(500)
            }

            ListItem() {
              HomeComponent3()
            }
          }
          .listDirection(Axis.Vertical) // 排列方向
          //.divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
          .edgeEffect(EdgeEffect.Fade) // 滑动到边缘无效果
          .onScrollIndex((firstIndex: number, lastIndex: number) => {
            console.info('first' + firstIndex)
            console.info('last' + lastIndex)
          })
          .width('90%')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(0xffffff)
        .padding({ top: 5 })
        .width('100%')
      }
      .height('100%')
    }.margin({top:0})
    .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Free)
    // .toolBar(this.NavigationToolbar())
    // .hideTitleBar(true)
  }
}
export default Home