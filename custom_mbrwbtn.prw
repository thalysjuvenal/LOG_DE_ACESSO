//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} MBrwBtn
TESTE
@author Thalys Augusto
@since 10/06/2024
@version 1.0
@type function
/*/

User Function MBrwBtn()
	Local aArea     := FWGetArea()
	Local lRetorno  := .T.
	Local cAliasAtu := ParamIXB[1]
	Local nRecNoAtu := ParamIXB[2]
	Local nOpcaMenu := ParamIXB[3]
	Local cFuncMenu := ParamIXB[4]
	Local cIdMenu := FWGetMnuFile()

	ZZL->(Reclock("ZZL",.T.))
	ZZL->ZZL_FILIAL := ZZL->(xFilial("ZZL"))
	ZZL->ZZL_EMP    := cEmpAnt
	ZZL->ZZL_FIL    := cFilAnt
	ZZL->ZZL_ID     := __cUserId
	ZZL->ZZL_NAME   := UsrRetName(__cUserId)
	ZZL->ZZL_AMB    := GetEnvServer()
	ZZL->ZZL_IP     := GetClientIP()
	ZZL->ZZL_DATA   := MsDate()
	ZZL->ZZL_HORA   := Time()
	ZZL->ZZL_COMP   := GetComputerName()
	ZZL->ZZL_ROTINA := FunName()
	ZZL->ZZL_MODULO := cModulo
	ZZL->ZZL_XNU    := Alltrim(cIdMenu)
	ZZL->ZZL_DSEMAN := Semana()
	ZZL->ZZL_DATABA := dDatabase
	ZZL->ZZL_MEMORI := cValToChar(_GetThreadUsedMem())
	ZZL->ZZL_ALIASD := cAliasAtu
	ZZL->ZZL_NRECNO := nRecNoAtu
	ZZL->ZZL_NOPCME := nOpcaMenu
	ZZL->ZZL_CFUNMN := cFuncMenu
	ZZL->(MsUnlock("ZZL"))

	FWRestArea(aArea)


Return lRetorno

/*/{Protheus.doc} Semana

	Dia da semana por extenso

	@author  Thalys Augusto
	@example Exemplos
	@param   [Nome_do_Parametro],Tipo_do_Parametro,Descricao_do_Parametro
	@return  Especifica_o_retorno
	@table   Tabelas
	@since   20-06-2024
/*/

Static Function Semana()
	Local xDia := Dow(MsDate())
	Local xRet := ""

	Do Case
		Case xDia == 1
			xRet := "DOMINGO"
		Case xDia == 2
			xRet := "SEGUNDA"
		Case xDia == 3
			xRet := "TERCA"
		Case xDia == 4
			xRet := "QUARTA"
		Case xDia == 5
			xRet := "QUINTA"
		Case xDia == 6
			xRet := "SEXTA"
		Case xDia == 7
			xRet := "SABADO"
	EndCase
Return(xRet)
