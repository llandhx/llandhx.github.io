
@Component
struct Demo3 {//名字要和文件名一样
  build(){
    Scroll(){
      Column(){
        Row(){
          Image('/images/dangao.jpg').width(100).height(100).borderRadius(20)
          Image('/images/huoguo.webp').width(100).height(100).borderRadius(20)
          Image('/images/pisa.webp').width(100).height(100).borderRadius(20)
        }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
      }
      .height('100%')
    }.height(420).scrollable(ScrollDirection.Vertical)
  }
}
export default Demo3;