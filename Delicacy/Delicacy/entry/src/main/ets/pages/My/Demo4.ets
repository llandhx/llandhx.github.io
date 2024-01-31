@CustomDialog


@Entry
@Component
struct Index {
  fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State textValue: string = ''
  @State inputValue: string = 'click me'

  build() {
    Column() {
      Button('文本滑动选择器弹窗').onClick((event: ClickEvent) => {
        TextPickerDialog.show({
          range: this.fruits,
          onAccept: (value: TextPickerResult) => {
            // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
            console.info("文本选择" + JSON.stringify(value))
          }
        })
      })

      Button('警告弹框').onClick((event: ClickEvent) => {
        AlertDialog.show(
          {
            title: 'title',//弹窗标题。
            message: 'text',//弹窗内容。
            autoCancel: true,//点击遮障层时，是否关闭弹窗。默认值：true
            alignment: DialogAlignment.Bottom,//弹窗在竖直方向上的对齐方式。
            offset: { dx: 0, dy: -20 },//弹窗相对alignment所在位置的偏移量。
            gridCount: 6,//弹窗容器宽度所占用栅格数。
            confirm: {//确认按钮的文本内容、文本色、按钮背景色和点击回调
              value: '确定',
              action: () => {
                console.info('Button-clicking callback')
              }
            },
            cancel: () => {//点击遮障层关闭dialog时的回调。
              console.info('Closed callbacks')
            }
          }
        )
      })

      Button('自定义弹窗').onClick((event: ClickEvent) => {
        //利用自定义控制器的open方法打开
        this.dialogController.open()
      })




    }
  }
}