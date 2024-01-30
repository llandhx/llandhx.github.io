import thermal from '@ohos.thermal'
@Entry
@Component
struct FoodList {
  @State src:string=''
  @State name:string=''
  build() {
    Column(){
      Row(){
        Image(this.src).width(120).borderRadius(10).height(120)
      }
      Row(){
        Text(this.name).fontSize(20)
      }
    }.height(180).width('50%').justifyContent(FlexAlign.SpaceEvenly)
  }
}
export default FoodList