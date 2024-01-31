import FolderInside from '../Collect/FolderInside';
import router from '@ohos.router'
@Entry
@Component
struct Folder {
  build() {
    Row() {
      Column() {
        Row(){
          Column(){
            Image('/images/79.png').borderRadius(20).width(100).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/FolderInside'
              })
            })
          }.padding(10)
          Column(){
            Image('/images/80.png').borderRadius(20).width(100).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/FolderInside'
              })
            })
          }.padding(10)
          Column(){
            Image('/images/81.png').borderRadius(20).width(100).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/FolderInside'
              })
            })
          }.padding(10)
        }
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}

export default Folder;