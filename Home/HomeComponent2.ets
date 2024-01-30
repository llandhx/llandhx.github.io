// xxx.ets
import router from '@ohos.router'
@Entry
@Component
struct ScrollComponent2 {
  scroller: Scroller = new Scroller()
  private arr: any=[
    {image:'/images/zaocan.webp',title:'早餐'},
    {image:'/images/52.jpeg',title:'点心蛋糕'},
    {image:'/images/zhongcan.webp',title:'中式美食'}
  ]

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        Row() {
          ForEach(this.arr,(e)=>{
            Column() {
              Image(e.image).padding({ right: 8 }).height('80%').borderRadius(10).onClick(()=>{
                router.pushUrl({
                  url:'pages/Home/FoodSearch'
                })
              })
              Text(e.title).margin({top:8}).fontSize(25).onClick(()=>{
                router.pushUrl({
                  url:'pages/Home/FoodSearch'
                })
              })
            }
          })
        }.height('100%').offset({})
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)  // 滚动条常驻显示
     /* .scrollBarColor(Color.Gray)  // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度*/
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
    }.width('100%').height(200)
  }
}
export default ScrollComponent2