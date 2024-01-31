import router from '@ohos.router'
@Entry
@Component
struct shezhi {

  build() {
    Column(){
      Row() {
        Column(){
          Image('/images/left.png')
            .onClick(()=>{
              router.back()
            })
            .width(30)
            .height(30)
            .offset({x:15})
            .padding({bottom:5})
        }
        Column(){
          Text('设置').fontSize(25).offset({x:-150})
        }


      }.margin({top:15}).width('100%').justifyContent(FlexAlign.SpaceBetween)
      Row(){Divider().strokeWidth(0.5).color('#808080')}
      Row(){
        Text('隐私政策').fontSize(18)
        Image('/images/xiangyou.jpg').width(23) .height(23)
      }
      .onClick(()=>{
        router.pushUrl({url:'pages/My/zhengce'})
      })
      .width('100%').justifyContent(FlexAlign.SpaceBetween).margin({top:10}).padding({left:10,right:10})
      Row(){Divider().strokeWidth(0.5).color('#808080')}.margin({top:8})
      Row(){
        Text('系统权限').fontSize(18)
        Image('/images/xiangyou.jpg').width(23) .height(23)
      }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({top:10}).padding({left:10,right:10})
      Row(){Divider().strokeWidth(0.5).color('#808080')}.margin({top:8})
      Row(){
        Text('菜谱统计').fontSize(18)
        Image('/images/xiangyou.jpg').width(23) .height(23)
      }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({top:10}).padding({left:10,right:10})
      Row(){Divider().strokeWidth(0.5).color('#808080')}.margin({top:8})
    }
    .height('100%')
    .width('100%')
  }
}