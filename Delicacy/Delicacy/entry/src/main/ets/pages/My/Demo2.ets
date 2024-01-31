import router from '@ohos.router';
@Component
struct Demo2 {//名字要和文件名一样
  build(){
    Scroll(){
    Column(){
      Row(){
        Image('/images/dangao.jpg').width(130).height(130).borderRadius(20)
        Image('/images/lamian.webp').width(130).height(130).borderRadius(20)
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).margin({top:5})
      Row(){
        Image('/images/huoguo.webp').width(130).height(130).borderRadius(20)
        Image('/images/niupai.jpg').width(130).height(130).borderRadius(20)
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).margin({top:5})
      Row(){
        Image('/images/pisa.webp').width(130).height(130).borderRadius(20)
        Image('/images/roushi.webp').width(130).height(130).borderRadius(20)
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).margin({top:5})
      Row(){
        Column(){
          Text('-------')
        }
        Column(){
          Text('我也是有底线的').fontSize(10)
        }
        Column(){
          Text('-------')
        }
      }
    }
    .height('100%')
    }.height(420).scrollable(ScrollDirection.Vertical)
    }
}
export default Demo2;