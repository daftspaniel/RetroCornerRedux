decb dskini cococashgrab.dsk -3
decb copy CashGrab.bas -t cococashgrab.dsk,CASHGRAB.BAS
Move-Item cococashgrab.dsk .\Media\cococashgrab.dsk -Force

dragondos create dragoncashgrab.vdk
dragondos write .\dragoncashgrab.vdk CASHGRAB.BAS -basic
Move-Item dragoncashgrab.vdk .\Media\dragoncashgrab.vdk -Force
