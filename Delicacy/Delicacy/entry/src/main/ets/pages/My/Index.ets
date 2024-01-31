import Demo2 from '../My/Demo2'
import Demo3 from '../My/Demo3'


@Component
struct TabsExample {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 10, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      /*barPosition
       * */
      Tabs({ index:this.currentIndex,barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          //内容
          Demo2()
        }.tabBar(this.TabBuilder(0, '菜谱4'))

        TabContent() {
          Demo3()
        }.tabBar(this.TabBuilder(1, '作品3'))
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      .barWidth(200)
      .barHeight(60)
      .animationDuration(200)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width(360)
      .height(380)
      .margin({ top: 52 })
      .backgroundColor('#F1F3F5')
      .margin({top:20})
    }.width('100%')
    .height(0)
    .margin({top:30})
  }
}

export default TabsExample