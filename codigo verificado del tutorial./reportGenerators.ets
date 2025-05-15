import router from '@ohos.router'; 
import document from '@ohos.document';
import fileio from '@ohos.fileio';
@Entry  
@Component  
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct ReportGenerator {
  // Mock directory validation function (replace with actual implementation if needed)
  isDirectory(uri: string): boolean {
    // Implement logic to verify if `uri` is a directory path
    // This could involve filesystem checks or pattern matching
    return uri.endsWith("/"); // Example: simple check if path ends with '/' (works on Unix-based systems)
  }
  titleMessage: string = 'Generar Reportes' 
  homeButtonMessage: string = 'Volver al inicio'
  radioBtnLbl: string = 'Seleccione el formato'
  fileNamePlaceholder: string = 'Escriba el nombre del archivo'
  radioBtnPdf: string = 'PDF'
  radioBtnWord: string = 'Word'
  radioBtnCSV: string = 'CSV'
  radioBtnGroup: string = 'documentFormat'
  saveLocationLbl: string = 'Indique el nombre del archivo'
  mainBtnText: string = 'Generar'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() { 
    Grid() { 
      GridItem() {
        Button() { 
          Text(this.homeButtonMessage)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) 
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
        .onClick(() => {
          router.push({ url: this.homeURL })
        })
      }.height('55%')

      GridItem() {
        Text(this.titleMessage) 
          .fontSize(45) 
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) 
          .textAlign(TextAlign.Start)
          .padding({ right: '20%' })
      }.columnStart(2).columnEnd(4).width('100%')

      GridItem() {
        Text(this.radioBtnLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      }.margin({ left: '20%' })

      GridItem() {
        Column() {
          Text(this.radioBtnPdf).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnPdf, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Column() {
          Text(this.radioBtnWord).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnWord, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Column() {
          Text(this.radioBtnCSV).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnCSV, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Text(this.saveLocationLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      }.margin({ left: '20%' })

      GridItem() {
        TextInput({placeholder:this.fileNamePlaceholder})
          .width('45%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
      } .columnStart(2) .columnEnd(4)

      GridItem(){
        Button() { 
          Text(this.mainBtnText)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) 
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
      } .columnStart(2) .columnEnd(3) .width('100%') .margin({left:'100%'})

    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .width('100%') 
    .height('100%') 
    .backgroundColor(this.backgroundColor)
  }
}
