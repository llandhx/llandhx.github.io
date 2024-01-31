import router from '@ohos.router'
@Entry
@Component
struct Massage {
  @State selected: number=0
  scroller: Scroller = new Scroller()
  @Builder NavigationTitle() {
    Column(){
      Row() {
        Image('/images/left.png').height(30).width(30)
          .onClick(()=>{
            router.back()
          })
          .padding({left:10})
        Text('消息').padding({top:10,bottom:0}).fontColor(Color.Black)
          .fontSize(23)
          .lineHeight(40)
          .fontWeight(500)
          .margin({left:115})
      }.width('100%').height(60).padding({left:10,right:10}).alignItems(VerticalAlign.Bottom)
    }.width('100%')
  }
  @Builder NavigationToolbar() {

  }
  build() {
    Navigation() {
      Column(){
        Row(){
          Image('/images/zan.png').width(40).margin({left:25})
          Text('赞与收藏').fontSize(20).padding({left:10})
        }.height('12%').width('100%')
        Divider().strokeWidth(1).color(Color.Gray).opacity(0.3).width('90%')
        Row(){
          Image('/images/pinglun.png').width(40).margin({left:25})
          Text('评论和@').fontSize(20).padding({left:10})
        }.height('12%').width('100%')
        Divider().strokeWidth(1).color(Color.Gray).opacity(0.3).width('90%')
        Row(){
          Image('/images/shoucang.png').width(40).margin({left:25})
          Text('新增粉丝').fontSize(20).padding({left:10})
        }.height('12%').width('100%')
      }.margin({top:-50})
    }.margin({top:0})
    .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Free)
  }
}


