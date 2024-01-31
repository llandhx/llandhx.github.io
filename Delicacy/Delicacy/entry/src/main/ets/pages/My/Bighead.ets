import router from '@ohos.router'
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController

  build() {
    Column() {

      Text('修改成功！').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('确认')
          .onClick(() => {
              this.controller.close()
             router.back()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}


/*
import router from '@ohos.router'
setTimeout(()=>{
  console.log('123')
},2000)
*/

@Entry
@Component
struct Index {
  ways: string[] = ['拍照', '从相册选择']
  @State textValue: string = ''
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController = new CustomDialogController({
    //自定义弹窗内容构造器。
    builder: CustomDialogExample(),
    //点击遮障层退出时的回调。
    cancel: ()=>{console.log('点击了遮罩层')},
    //是否允许点击遮障层退出。默认值：true
    autoCancel: true,
    //弹窗在竖直方向上的对齐方式。
    alignment: DialogAlignment.Center,
    //弹窗相对alignment所在位置的偏移量
    offset: { dx: 0, dy: -70 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 6
  })

  build() {
    Column() {
      Row() {
        Column(){
          Image('/images/left.png')
            .onClick(()=>{
              router.back()
            })
            .width(27)
            .height(27)
            .offset({x:10})
        }
        Column(){
          Text('编辑资料').fontSize(25).textAlign(TextAlign.Center).offset({x:-130})
        }
      }.margin({top:15,left:10}).width('100%').justifyContent(FlexAlign.SpaceBetween)
      Row() {
        Image('/images/touxiang.webp')
          .onClick((event: ClickEvent) => {
          TextPickerDialog.show({
            range: this.ways,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              console.info("文本选择" + JSON.stringify(value))
            }
          })
        })
          .width(70)
          .height(70)
          .border({ radius: 50 })


      }
      .justifyContent(FlexAlign.Center)
      .padding({left:100,right:100})
      .width('100%')
      .margin({top:28})
      Row(){
          Text('点击更换头像').fontSize(18)
        }
      .margin({top:10})
      Row(){
        Column(){
          Text('用户名')
        }
        .padding({left:5})
        Column(){
          TextInput({text:'斗宗强者看大门！'}).width('290')
        }

      }
      .margin({top:22})
      Row(){
        Column(){
          Text('性别')
        }
        .padding({left:5})
        Column(){
          TextInput({placeholder:'男'}).width('300')
        }

      }
      .margin({top:5})
      Row(){
        Column(){
          Text('生日')
        }
        .padding({left:5})
        Column(){
          TextInput({placeholder:'完善生日信息'}).width('300')
        }

      }
      .margin({top:5})
      Row(){
        Column(){
          Text('QQ')
        }
        .padding({left:5})
        Column(){
          TextInput({placeholder:'输入常用QQ'}).width('310')
        }
      }
      .margin({top:5})
      Row(){

        Text('修改完成').fontSize(20).onClick((event: ClickEvent) => {
          //利用自定义控制器的open方法打开
          this.dialogController.open()
        })

        // router.pushUrl({url:'pages/My/Page1'})
      }.justifyContent(FlexAlign.Center).margin({top:45})
      .width(200)
      .backgroundColor('rgba(0,0,255,0.3)')
      .borderRadius(30)

    }
    .height('100%')

  }
}
