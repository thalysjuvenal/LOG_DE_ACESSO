#include "TOTVS.CH"

/*/{Protheus.doc} SduLogin

	Descricao

	@author  Nome
	@example Exemplos
	@param   [Nome_do_Parametro],Tipo_do_Parametro,Descricao_do_Parametro
	@return  Especifica_o_retorno
	@table   Tabelas
	@since   10-06-2024
/*/
User Function SduLogin()
	Local lRet      := .T.
	//SE NO APPSERVER.INI NÃO TEM ESSA INFORMAÇÕES
	Local cDatabase := GetPvProfString(GetEnvServer(),'DBDATABASE','',GetAdv97()) //Tipo de Banco
	Local cIp       := GetPvProfString(GetEnvServer(),'DBSERVER'  ,'',GetAdv97()) //IP do TOP
	Local cAlias    := GetPvProfString(GetEnvServer(),'DBALIAS'   ,'',GetAdv97()) //Alias
	Local cPort     := GetPvProfString(GetEnvServer(),'DBPort'    ,'',GetAdv97()) //Porta

	//ELE PEGA DO DBACCESS
	If Empty(cDatabase)
		cDatabase := GetPvProfString('DBAccess','DataBase','',GetAdv97()) //Tipo de Banco
		cIp       := GetPvProfString('DBAccess','Server'  ,'',GetAdv97()) //IP do TOP
		cAlias    := GetPvProfString('DBAccess','ALIAS'   ,'',GetAdv97()) //Alias
		cPort     := GetPvProfString('DBAccess','PORT'    ,'',GetAdv97()) //Porta
	Endif


	If !Empty(cDatabase)
		nHndBanco := TcLink(cDatabase + "/" + cAlias,cIp,Val(cPort))

		If nHndBanco > 0

			If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
				ZZL->(dbCloseArea())  //Se estiver aberto Fecha
			Endif

			//TEM QUE COLOCAR O NOME DA TABELA DENTRO DO DBUSEAREA PORQUE O SISTEMA NAO RECONHECE A TABELA
			//POR QUE APARTIR DESSE MOMENTO O PROTHEUS ESTA ENCERRADO SEM ACESSO AS TABELAS DO DBAccess
			dbUseArea(.T., "TOPCONN", "ZZL990" , "ZZL", .T., .F.)

			ZZL->(Reclock("ZZL",.T.))
			ZZL->ZZL_FILIAL := ""
			ZZL->ZZL_EMP    := ""
			ZZL->ZZL_FIL    := ""
			ZZL->ZZL_ID     := Alltrim(__cUserId)
			ZZL->ZZL_NAME   := Alltrim(UsrRetName(__cUserId))
			ZZL->ZZL_AMB    := GetEnvServer()
			ZZL->ZZL_IP     := GetClientIP()
			ZZL->ZZL_DATA   := MsDate()
			ZZL->ZZL_HORA   := Time()
			ZZL->ZZL_COMP   := GetComputerName()
			ZZL->ZZL_ROTINA := "LOGIN"
			ZZL->ZZL_MODULO := cModulo
			ZZL->ZZL_XNU    := "APSDU"
			ZZL->ZZL_DSEMAN := Semana()
			ZZL->ZZL_DATABA := dDatabase
			ZZL->(Msunlock("ZZL"))

			// Fecha a conexão com o Banco
			TcUnlink(nHndBanco)

			If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
				ZZL->(dbCloseArea())  //Se estiver aberto Fecha
			Endif
		Endif
	Endif
Return lRet

/*/{Protheus.doc} Semana

	Puxar qual o dia da semana

	@author  Nome
	@example Exemplos
	@param   [Nome_do_Parametro],Tipo_do_Parametro,Descricao_do_Parametro
	@return  Especifica_o_retorno
	@table   Tabelas
	@since   10-06-2024
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

/*/{Protheus.doc} SduLogout

	Fechar APSDU

	@author  Nome
	@example Exemplos
	@param   [Nome_do_Parametro],Tipo_do_Parametro,Descricao_do_Parametro
	@return  Especifica_o_retorno
	@table   Tabelas
	@since   10-06-2024
/*/
User Function SduLogout()
	Local lRet      := .T.
	Local cUser     := ParamIXB[1]
	Local cDatabase := GetPvProfString(GetEnvServer(), 'DBDATABASE' , '' ,GetAdv97()) //Tipo de Banco
	Local cIp       := GetPvProfString(GetEnvServer(), 'DBSERVER' , '' ,GetAdv97()) //IP do TOP
	Local cAlias    := GetPvProfString(GetEnvServer(), 'DBALIAS' , '' ,GetAdv97()) //Alias
	Local cPort     := GetPvProfString(GetEnvServer(), 'DBPort' , '' ,GetAdv97()) //Porta

	If Empty(cDatabase)
		cDatabase := GetPvProfString('DBAccess','DataBase','',GetAdv97()) //Tipo de Banco
		cIp       := GetPvProfString('DBAccess','Server'  ,'',GetAdv97()) //IP do TOP
		cAlias    := GetPvProfString('DBAccess','ALIAS'   ,'',GetAdv97()) //Alias
		cPort     := GetPvProfString('DBAccess','PORT'    ,'',GetAdv97()) //Porta
	Endif

	If !Empty(cDatabase)
		nHndBanco := TcLink(cDatabase + "/" + cAlias,cIp,Val(cPort))

		If nHndBanco > 0

			If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
				ZZL->(dbCloseArea())  //Se estiver aberto Fecha
			Endif

			//TEM QUE COLOCAR O NOME DA TABELA DENTRO DO DBUSEAREA PORQUE O SISTEMA NAO RECONHECE A TABELA
			//POR QUE APARTIR DESSE MOMENTO O PROTHEUS ESTA ENCERRADO SEM ACESSO AS TABELAS DO DBAccess
			dbUseArea(.T., "TOPCONN", "ZZL990" , "ZZL", .T., .F.)

			ZZL->(Reclock("ZZL",.T.))
			ZZL->ZZL_FILIAL := ""
			ZZL->ZZL_EMP    := ""
			ZZL->ZZL_FIL    := ""
			ZZL->ZZL_ID     := Alltrim(cUser)
			ZZL->ZZL_NAME   := Alltrim(cUserName)
			ZZL->ZZL_AMB    := GetEnvServer()
			ZZL->ZZL_IP     := GetClientIP()
			ZZL->ZZL_DATA   := MsDate()
			ZZL->ZZL_HORA   := Time()
			ZZL->ZZL_COMP   := GetComputerName()
			ZZL->ZZL_ROTINA := "LOGOUT"
			ZZL->ZZL_MODULO := cModulo
			ZZL->ZZL_XNU    := "APSDU"
			ZZL->ZZL_DSEMAN := Semana()
			ZZL->ZZL_DATABA := dDatabase
			ZZL->(Msunlock("ZZL"))

			// Fecha a conexão com o Banco
			TcUnlink(nHndBanco)

			If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
				ZZL->(dbCloseArea())  //Se estiver aberto Fecha
			Endif
		Endif
	Endif
Return lRet




