import router from '@ohos.router'
@Entry
@Component
struct Recommendation {
  build() {
    Column() {
      Image("/images/67.jpeg").width(280).height(350).margin({top:20}).borderRadius(10)
      Divider().strokeWidth(6).color(Color.Gray).opacity(0.3).margin(20)
      Text('烤面包 | 新手推荐').fontSize(28).margin(3)
      Row(){
        Image('/images/73.png').width(20)
        Text("15-30分钟").fontColor(Color.Gray)
        Blank(20)
        Text('零厨艺').fontColor(Color.Gray)
      }
      Button('就这个了')
        .width(160)
        .backgroundColor('#149')
        .fontColor(Color.White)
        .margin(5)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/Collect/CookBook'
          })
        })
    }
    .borderRadius(20)
    .border({width:2,color:Color.Gray})
    .width('90%')
    .height('80%')
  }
}

export default Recommendation;