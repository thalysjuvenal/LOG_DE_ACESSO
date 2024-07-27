#include "TOTVS.CH"


/*/{Protheus.doc} CHKEXEC

	Ponto de Entrada Log de Acesso

	@author  Nome
	@example Exemplos
	@param   [Nome_do_Parametro],Tipo_do_Parametro,Descricao_do_Parametro
	@return  Especifica_o_retorno
	@table   Tabelas
	@since   10-06-2024
/*/
User Function CHKEXEC()
	Local lRet  := .T.
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
	ZZL->ZZL_ROTINA := ParamIxb
	ZZL->ZZL_MODULO := cModulo
	ZZL->ZZL_XNU    := Alltrim(cIdMenu)
	ZZL->ZZL_DSEMAN := Semana()
	ZZL->ZZL_DATABA := dDatabase
	ZZL->ZZL_MEMORI := cValToChar(_GetThreadUsedMem())
	ZZL->(MsUnlock("ZZL"))

Return(lRet)

//FWGetMnuFile()


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

