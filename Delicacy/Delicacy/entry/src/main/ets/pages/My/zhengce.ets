import router from '@ohos.router'
@Entry
@Component
struct Zhengce {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Column(){
          Image('/images/left.png')
            .onClick(()=>{
              router.back({url:'pages/My/shezhi'})
            })
            .width(27)
            .height(27)
            .offset({x:10})
        }
        Column(){
          Text('隐私政策').fontSize(25).textAlign(TextAlign.Center).offset({x:-130})
        }
      }.margin({top:15,left:10}).width('100%').justifyContent(FlexAlign.SpaceBetween)
      Scroll(){
      Row(){
        Text('用户按照页面给与的提示完成全部注册步骤后，即成为知闻的用户，用户字形保管账号及密码，并准确、安全地使用账号及密码。知闻'+
        '可通过用户自行设定、向用户提供个性化信息服务。').fontSize(19)
      }.margin({left:3,right:3,top:15})
      }
      .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
      .scrollBar(BarState.On)
    }
    .height(400)
  }
}