module uc(input wire clock,reset,z, input wire [1:0] id_out, input wire [5:0] opcode, 
          output reg s_inc, s_inm, we3, rwe1, rwe2, rwe3, rwe4, sec, s_es, s_rel, swe, s_ret, output wire [2:0] op);


  assign op = opcode[2:0];

  always @(*)
  begin

    rwe1 <= 1'b0;      //Desactivar puertos de E/S
    rwe2 <= 1'b0;      //Desactivar puertos de E/S
    rwe3 <= 1'b0;      //Desactivar puertos de E/S
    rwe4 <= 1'b0;      //Desactivar puertos de E/S
    swe <= 1'b0;      //desactivar registro especial(subrutina)
    s_ret <= 1'b0;    //no tomar valor de retorno

    if (reset == 1'b1)
    begin
      we3 <= 1'b0;   //No escribir en el banco de registros
      s_inm <= 1'b0; //Da igual el valor, no se trabaja con registros
      s_inc <= 1'b1; //Para que el PC coja la siguiente instrucción
      sec <= 1'b0;      //Da igual
      s_es <= 1'b0;     //Desactivar E/S
      s_rel <= 1'b0;    //Despreciar salto relativo
      swe <= 1'b0;      //desactivar registro especial(subrutina)
      s_ret <= 1'b0;    //no tomar valor de retorno

    end

    else
    begin
      casex (opcode)              

        // Instrucciones ariméticas (4ºbit a 0)
        6'bxx0xxx:
        begin
          //op <= opcode[2:0]; //Código de operación de ALU
          we3 <= 1'b1;       //Permitir escritura en registros
          s_inm <= 1'b0;     //Escoger resultado de la ALU
          s_inc <= 1'b1;     //Escoger siguiente instrucción
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Despreciar salto relativo
        end

        // Instrucción: Carga Inmediata
        6'bxx1010:
        begin
          we3 <= 1'b1;       //Permitir escritura en registros
          s_inm <= 1'b1;     //La ALU no nos interesa
          s_inc <= 1'b1;     //Escoger siguiente instrucción
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Despreciar salto relativo
        end

        // Instrucción: Salto Incondicional
        6'bxx1001:
        begin
          we3 <= 1'b0;       //No trabaja con registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registros
          s_inc <= 1'b0;     //Escoger el salto indicado
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Despreciar salto relativo
        end

        // Instrucción: LES cargar desde E/S
        6'bxx1011:
        begin
          we3 <= 1'b1;       //Permitir escritura en registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registro
          sec <= 1'b0;      //Da igual
          s_es <= 1'b1;     //Activar entrada desde E/S
          s_inc <= 1'b1;   //Siguiente instrucción
          s_rel <= 1'b0;    //Despreciar salto relativo
        end

        // Instrucción: Envia a la E/S desde el registro
        6'bxx1101:
        begin
          we3 <= 1'b0;       //No trabaja con registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registros
          sec <= 1'b1;      //A 1 = Registro
          s_es <= 1'b0;     //Desctivar entrada desde E/S
          s_inc <= 1'b1;   //Siguiente instrucción
          s_rel <= 1'b0;    //Despreciar salto relativo
          if (id_out == 2'b00)
            rwe1 <= 1'b1;
          else if(id_out == 2'b01)
            rwe2 <= 1'b1;
          else if(id_out == 2'b10)
            rwe3 <= 1'b1;
          else
            rwe4 <= 1'b1;                      
        end

        // Instrucción: Envia a la E/S desde la memoria
        6'bxx1110:
        begin
          we3 <= 1'b0;       //No trabaja con registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registros
          sec <= 1'b0;      //A 0 = Memoria
          s_es <= 1'b0;     //Desctivar entrada desde E/S
          s_inc <= 1'b1;   //Siguiente instrucción
          s_rel <= 1'b0;    //Despreciar salto relativo
          if (id_out == 2'b00)
            rwe1 <= 1'b1;
          else if(id_out == 2'b01)
            rwe2 <= 1'b1;
          else if(id_out == 2'b10)
            rwe3 <= 1'b1;
          else
            rwe4 <= 1'b1;              
        end                

        // Instrucción: Salto Condicional (si z=0)
        6'b001111:
        begin
          we3 <= 1'b0;       //No trabaja con registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registros
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Despreciar salto relativo
          if (z == 1'b0)
            s_inc <= 1'b0;   //Saltar
          else
            s_inc <= 1'b1;   //Siguiente instrucćión
        end
    
        // Instrucción: Salto Condicional (si z=1)
        6'b011111:
        begin
          we3 <= 1'b0;       //No trabaja con registros
          s_inm <= 1'b0;     //Da igual el valor porque no se trabaja con registros
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Despreciar salto relativo
          if (z == 1'b0)
            s_inc <= 1'b1;   //Siguiente instrucción
          else
            s_inc <= 1'b0;   //Saltar
        end

        //Instrucción: Salto relativo
        6'b011000:
        begin
          we3 <= 1'b0;       //Denegar escritura en registros
          s_inm <= 1'b0;     //La ALU no nos interesa
          s_inc <= 1'b1;     //Escoger el salto relativo
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b1;    //Escoger salto relativo
        end
        
        //Instrucción: Salto a subrutina
        6'b101000:
        begin
          we3 <= 1'b0;       //Denegar escritura en registros
          s_inm <= 1'b0;     //La ALU no nos interesa
          s_inc <= 1'b0;     //Escoger siguiente instrucción
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Escoger siguiente instrucción
          swe <= 1'b1;      //activar registro especial(subrutina)
        end
        
        //Instrucción: Retorno subrutina
        6'b111000:
        begin
          we3 <= 1'b0;       //denegar escritura en registros
          s_inm <= 1'b0;     //La ALU no nos interesa
          s_inc <= 1'b0;     //da igual
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //Da igual
          s_ret <= 1'b1;    //Tomar el valor de retorno
        end

        //Instrucción: NOP
        6'b111111:
        begin
          we3 <= 1'b0;       //Denegar escritura en registros
          s_inm <= 1'b0;     //La ALU no nos interesa
          s_inc <= 1'b1;     //Escoger siguiente instrucción
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //No activar salto relativo   
          s_ret <= 1'b0;    //No tomar el valor de retorno
        end

        default:
        begin
          we3 <= 1'b0;       //Denegar escritura en registros
          s_inm <= 1'b0;     //La ALU no nos interesa
          s_inc <= 1'b1;     //Escoger siguiente instrucción
          sec <= 1'b0;      //Da igual
          s_es <= 1'b0;     //Desactivar E/S
          s_rel <= 1'b0;    //No activar salto relativo   
          s_ret <= 1'b0;    //No tomar el valor de retorno
        end
      endcase
    end
  end

endmodule