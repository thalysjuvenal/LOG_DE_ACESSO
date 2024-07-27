#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} MSQUIT
Função chamada após o login do usuário e no MDI a cada nova aba
@author Thalys Augusto
@since  Setembro/2021
@version 1.0
@project
@param
    Vetor PARAMIXB
    O vetor PARAMIXB possui a seguinte estrutura:
    [1] - Tipo de ação
        .T. = Logoff
        .F. = Saiu do sistema
/*/
User Function MSQUIT()
    Local lLogoff   := ParamIxb[1] //variável lógica que identifica se o P.E. está sendo executado pelo Logoff ou pela saida definitiva.
    Local cDatabase := GetPvProfString(GetEnvServer(),'DBDATABASE','',GetAdv97()) //Tipo de Banco
    Local cIp       := GetPvProfString(GetEnvServer(),'DBSERVER'  ,'',GetAdv97()) //IP do TOP
    Local cAlias    := GetPvProfString(GetEnvServer(),'DBALIAS'   ,'',GetAdv97()) //Alias
    Local cPort     := GetPvProfString(GetEnvServer(),'DBPort'    ,'',GetAdv97()) //Porta

    If Empty(cDatabase)
        cDatabase := GetPvProfString('DBAccess','DataBase','',GetAdv97()) //Tipo de Banco
        cIp       := GetPvProfString('DBAccess','Server'  ,'',GetAdv97()) //IP do TOP
        cAlias    := GetPvProfString('DBAccess','ALIAS'   ,'',GetAdv97()) //Alias
        cPort     := GetPvProfString('DBAccess','PORT'    ,'',GetAdv97()) //Porta
    Endif

    If lLogOff

        If !Empty(cDatabase)

            nHndBanco := TcLink(cDatabase + "/" + cAlias,cIp,Val(cPort))

            If nHndBanco > 0

                If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
                    ZZL->(dbCloseArea())  //Se estiver aberto Fecha
                Endif

                //TEM QUE COLOCAR O NOME DA TABELA DENTRO DO DBUSEAREA PORQUE O SISTEMA NAO RECONHECE A TABELA
                //POR QUE APARTIR DESSE MOMENTO O PROTHEUS ESTA ENCERRADO SEM ACESSO AS TABELAS DO DBAccess
                dbUseArea(.T., "TOPCONN", "ZZL990" , "ZZL", .T., .F.)

                Reclock("ZZL",.T.)
                ZZL->ZZL_FILIAL := cFilAnt
                ZZL->ZZL_EMP    := cEmpAnt
                ZZL->ZZL_FIL    := cFilAnt
                ZZL->ZZL_ID     := __cUserId
                ZZL->ZZL_NAME   := UsrRetName(__cUserId)
                ZZL->ZZL_AMB    := GetEnvServer()
                ZZL->ZZL_IP     := GetClientIP()
                ZZL->ZZL_DATA   := MsDate()
                ZZL->ZZL_HORA   := Time()
                ZZL->ZZL_COMP   := GetComputerName()
                ZZL->ZZL_ROTINA := "EFETUOU LOGOFF DO SISTEMA"
                ZZL->ZZL_MODULO := cModulo
                ZZL->ZZL_XNU    := "LOGOFF"
                ZZL->ZZL_DSEMAN := Semana()
                ZZL->ZZL_DATABA := dDatabase
                ZZL->ZZL_MEMORI := cValToChar(_GetThreadUsedMem())
                ZZL->(MsUnlock("ZZL"))

                // Fecha a conexão com o Banco
                TcUnlink(nHndBanco)

                If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
                    ZZL->(dbCloseArea())  //Se estiver aberto Fecha
                Endif

            Endif

        Endif

    Else

        if cModulo != "MPSDU"

            If !Empty(cDatabase)

                nHndBanco := TcLink(cDatabase + "/" + cAlias,cIp,Val(cPort))

                If nHndBanco > 0

                    If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
                        ZZL->(dbCloseArea())  //Se estiver aberto Fecha
                    Endif

                    //TEM QUE COLOCAR O NOME DA TABELA DENTRO DO DBUSEAREA PORQUE O SISTEMA NAO RECONHECE A TABELA
                    //POR QUE APARTIR DESSE MOMENTO O PROTHEUS ESTA ENCERRADO SEM ACESSO AS TABELAS DO DBAccess
                    dbUseArea(.T., "TOPCONN", "ZZL990" , "ZZL", .T., .F.)

                    Reclock("ZZL",.T.)
                    ZZL->ZZL_FILIAL := cFilAnt
                    ZZL->ZZL_EMP    := cEmpAnt
                    ZZL->ZZL_FIL    := cFilAnt
                    ZZL->ZZL_ID     := __cUserId
                    ZZL->ZZL_NAME   := UsrRetName(__cUserId)
                    ZZL->ZZL_AMB    := GetEnvServer()
                    ZZL->ZZL_IP     := GetClientIP()
                    ZZL->ZZL_DATA   := MsDate()
                    ZZL->ZZL_HORA   := Time()
                    ZZL->ZZL_COMP   := GetComputerName()
                    ZZL->ZZL_ROTINA := "ENCERROU TOTALMENTE DO SISTEMA"
                    ZZL->ZZL_MODULO := cModulo
                    ZZL->ZZL_XNU    := "ENCERROU"
                    ZZL->ZZL_DSEMAN := Semana()
                    ZZL->ZZL_DATABA := dDatabase
                    ZZL->ZZL_MEMORI := cValToChar(_GetThreadUsedMem())
                    ZZL->(MsUnlock("ZZL"))

                    // Fecha a conexão com o Banco
                    TcUnlink(nHndBanco)

                    If Select("ZZL") > 0     //Verifica se já existe um arquivo aberto
                        ZZL->(dbCloseArea())  //Se estiver aberto Fecha
                    Endif

                Endif

            Endif

        Endif

    EndIf

Return .T.


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
