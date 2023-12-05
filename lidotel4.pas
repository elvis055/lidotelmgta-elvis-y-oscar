program hola12;

  uses crt,sysutils;
type
  archivos = record
      nombre:string[30];
      apellido:string[30];
      id:string[8];
      telefono:string[12];
      correo_e:string[60];
    end;

var
       opcion:char;
       Cliente:file of archivos;
       Cliente_I:file of archivos;
       Cliente_P:file of archivos;
       Clientes_GP:file of archivos;
       NCliente:archivos;
       Cantidad_d,personas_c:byte;
       precio:real;
       bid:string;

procedure linea;
begin
   textcolor(lightred);
   writeln('----------------------------------------');
   textcolor(lightcyan);
end;

procedure factura;
begin
   linea;
   writeln('        .:OPERACION EXISITOSA:.');
   linea;
   writeln('Nombre: ',NCliente.nombre);
   writeln('Apellido: ',NCliente.apellido);
   writeln('ID: ',NCliente.id);
   linea;
   writeln('Correo: ',NCliente.correo_e);
   writeln('Telefono: ',NCliente.telefono);
   linea;
   writeln('Cantidad de Dias: ',Cantidad_d);
   writeln('Cantidad de Personas: ',personas_c);
   linea;
   writeln('Precio total por noches: ',precio:6:2);
   writeln;
   writeln('Presione cualquier tecla para seguir.');
   linea;
   readkey;
end;

procedure Cliente_Nuevo;                                                             //Nuevo cliente
  var

    contiene_Letras,contiene_Numeros:boolean;
    i:integer;

begin


   assign(Cliente, 'Registro_Individual.txt');
      if (not fileExists('Registro_Individual.txt')) then
          begin
            rewrite(Cliente);
            close(Cliente);
          end;

     with NCliente do
         begin
             writeln;
             Writeln('Ingresar sus datos.');
             writeln;
           repeat
             write('Nombre: ');
               readln(nombre);

               contiene_Numeros := False;



    for i := 1 to length(nombre) do
    begin
      if (nombre[i] in ['0'..'9']) then
      begin
        contiene_Numeros := True;
        break;
      end;
    end;

    if contiene_Numeros then
       begin
          textcolor(lightred);
          writeln('EL Nombre no puede contener numeros. Por favor, ingrese nuevamente.');
          textcolor(lightcyan);
       end;

  until not contiene_Numeros;

           repeat
             write('Apellido: ');
               readln(apellido);
               contiene_Numeros := False;




    for i := 1 to length(apellido) do
    begin
      if (apellido[i] in ['0'..'9']) then
      begin
        contiene_Numeros := True;
        break;
      end;
    end;

    if contiene_Numeros then
       begin
          textcolor(lightred);
          writeln('EL Apellido no puede contener numeros. Por favor, ingrese nuevamente.');
          textcolor(lightcyan);
       end;

  until not contiene_Numeros;


            repeat
             write('ID: ');
               readln(id);
               contiene_Letras := False;


    for i := 1 to length(id) do
    begin
      if (id[i] in ['a'..'z', 'A'..'Z']) then
      begin
        contiene_Letras := True;
        break;
      end;
    end;

    if contiene_Letras then
       begin
          textcolor(lightred);
          writeln('El ID no puede contener letras. Por favor, ingrese nuevamente.');
          textcolor(lightcyan);
       end;

  until not contiene_Letras;

             write('Correo: ');
             readln(correo_e);

            repeat
             write('Telefono: ');
               readln(telefono);
               contiene_Letras := False;


    for i := 1 to length(telefono) do
    begin
      if (telefono[i] in ['a'..'z', 'A'..'Z']) then
      begin
        contiene_Letras := True;
        break;
      end;
    end;

    if contiene_Letras then
       begin
          textcolor(lightred);
          writeln('El N de Telefono no puede contener letras. Por favor, ingrese nuevamente.');
          textcolor(lightcyan);
       end;

  until not contiene_Letras;

         end;


                    reset(Cliente);
                    seek(Cliente, FileSize(Cliente));
                    write(Cliente, NCliente);
                    close(Cliente);


end;
procedure Reservacion;                                                               //reservacion
  var
    op3,op2:char;
    hijos:string[2];
    cantidad_ninyos,i:integer;
    DatosNinyos: array [1..10] of record
      Nombre:string;
      edad:byte;
    end;
    cantidad_P:byte;
begin

    repeat

       Cantidad_d:=0;
       cantidad_P:=0;
       precio:=0;


     clrscr;
     writeln('Reservacion');
     writeln;
     writeln('Eliga su modalidad:');
     writeln;
     writeln('1) Individual      2) Pareja      3) Grupo/Familia   0) Atras');
     writeln;
     write('Elija una opcion: ');
     textcolor(lightred);
     readln(op3);
     textcolor(lightcyan);

     case op3 of

          '1':begin                                                                   //seleccion individual

                 repeat

                  personas_c:=1;

                   assign(Cliente_I, 'Registro_Individual_tipo.txt');
                    if (not fileExists('Registro_Individual_tipo.txt')) then
                        begin
                          rewrite(Cliente_I);
                          close(Cliente_I);
                        end;

                  clrscr;
                  writeln('Individual');
                  writeln;
                  writeln('Tipos de reservaciones en el Hotel (por noche): ');
                  writeln;
                  writeln('1) Suite 300$    2) Family Room 200$   3) Doble 120$   4) Sencilla 60$  0)Atras');
                  writeln;
                  write('Elija su opcion: ');
                  textcolor(lightred);
                 readln(op2);
                 textcolor(lightcyan);

                 case op2 of
                    '1':begin
                      clrscr;
                      writeln('suite');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();                     
                      writeln('Ingresar los Datos de las personas a reservar: ');
                      Cliente_Nuevo;

                      clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=300*Cantidad_d;
                                 factura;
                    end;

                    '2':begin
                      clrscr;
                      writeln('family room');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                      writeln('Ingresar los Datos de las personas a reservar: ');
                      Cliente_Nuevo;

                      clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=200*Cantidad_d;
                                 factura;
                    end;

                    '3':begin
                      clrscr;
                      writeln('doble');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                      writeln('Ingresar los Datos de las personas a reservar: ');
                      Cliente_Nuevo;

                      clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=120*Cantidad_d;
                                 factura;
                    end;

                    '4':begin
                      clrscr;
                      writeln('sencilla');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                      writeln('Ingresar los Datos de las personas a reservar: ');
                      Cliente_Nuevo;

                      clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=60*Cantidad_d;
                                 factura;

                    end;
                     end;

                     reset(Cliente_I);
                    seek(Cliente_I, FileSize(Cliente_I));
                    write(Cliente_I, NCliente);
                    close(Cliente_I);

                  until op2='0';

          end;

          '2':begin                                                                   //seleccion parejas

                 repeat

                 assign(Cliente_P, 'Registro_Parejas_tipo.txt');
                    if (not fileExists('Registro_Parejas_tipo.txt')) then
                        begin
                          rewrite(Cliente_P);
                          close(Cliente_P);
                        end;

                   personas_c:=2;

                  clrscr;
                  writeln('pareja');
                  writeln('Tipo de reservaciones (por noche): ');
                  writeln;
                  writeln('1) Suite 300$    2) Family Room 200$   3) Doble 120$   4) Sencilla 60$  0)Atras');
                  writeln;
                  write('Elija su opcion: ');
                 readln(op2);

                 case op2 of
                    '1':begin
                      clrscr;
                      writeln('suite');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                                   writeln('Ingresar los Datos de las personas a reservar: ');
                                   Cliente_Nuevo;
                                   Cliente_Nuevo;


                                 clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=300*Cantidad_d;
                                 factura;
                    end;

                    '2':begin
                      clrscr;
                      writeln('family room');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                                  writeln('Ingresar los Datos de las personas a reservar: ');
                                   Cliente_Nuevo;
                                   Cliente_Nuevo;

                                 clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=200*Cantidad_d;
                                 factura;
                    end;

                    '3':begin
                      clrscr;
                      writeln('doble');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                                   writeln('Ingresar los Datos de las personas a reservar: ');
                                   Cliente_Nuevo;
                                   Cliente_Nuevo;


                                 clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=120*Cantidad_d;
                                 factura;
                    end;

                    '4':begin
                      clrscr;
                      writeln('sencilla');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                                   writeln('Ingresar los Datos de las personas a reservar: ');
                                   Cliente_Nuevo;
                                   Cliente_Nuevo;


                                 clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 clrscr;
                                 precio:=60*Cantidad_d;
                                 factura;
                    end;
                        end;

                       reset(Cliente_P);
                        seek(Cliente_P, FileSize(Cliente_P));
                        write(Cliente_P, NCliente);
                        close(Cliente_P);


               until op2='0';

          end;
(*  procedure buscarCliente(id: string);
var
  clienteActual: archivos;
  encontrado: boolean;
begin
  reset(Cliente);
  encontrado := False;
  while (not eof(Cliente)) and (not encontrado) do
  begin
    read(Cliente, clienteActual);
    if clienteActual.id = idBuscado then
    begin
      writeln('Cliente encontrado:');
      writeln('Nombre: ', clienteActual.nombre);
      writeln('Apellido: ', clienteActual.apellido);
      writeln('ID: ', clienteActual.id);
      writeln('Correo: ', clienteActual.correo_e);
      writeln('Telefono: ', clienteActual.telefono);
      encontrado := True;
    end;
  end;
  if not encontrado then
    writeln('Cliente no encontrado.');
  close(Cliente);
end;

procedure editarCliente(idBuscado: string);
var
  clienteActual: archivos;
  pos: integer;
  encontrado: boolean;
begin
  reset(Cliente);
  encontrado := False;
  pos := 0;
  while (not eof(Cliente)) and (not encontrado) do
  begin
    read(Cliente, clienteActual);
    if clienteActual.id = idBuscado then
    begin
      writeln('Cliente encontrado, ingrese los nuevos datos:');
      with clienteActual do
      begin
        write('Nombre: ');
        readln(nombre);
        write('Apellido: ');
        readln(apellido);
        write('ID: ');
        readln(id);
        write('Correo: ');
        readln(correo_e);
        write('Telefono: ');
        readln(telefono);
      end;
      seek(Cliente, pos);
      write(Cliente, clienteActual);
      encontrado := True;
    end;
    pos := pos + 1;
  end;
  if not encontrado then
    writeln('Cliente no encontrado.');
  close(Cliente);
end;*)


          '3':begin                                                                   //seleccion grupo/familia

              clrscr;

               assign(Clientes_GP, 'Registro_Grupo/Familia_tipo.txt');
                    if (not fileExists('Registro_Grupo/Familia_tipo.txt')) then
                        begin
                          rewrite(Clientes_GP);
                          close(Clientes_GP);
                        end;


              repeat
              writeln('Grupo_Familia');
                  writeln('Elija su tipo de reservacion (por noche): ');
                  writeln;
                  writeln('1) Suite 300$    2) Family Room 200$   3) Doble 120$   4) Sencilla 60$  0)Atras');
                  writeln;
                  write('Elija su opcion: ');
                 readln(op2);

                 case op2 of
                    '1':begin
                      clrscr;
                      writeln('suite');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                write('Usted viene con sus hijos(si o no): ');
                    readln(hijos);
                                  if (hijos='si') or (hijos='SI') then
                                    begin
                                    write('Cantidad de ninyos: ');
                                        readln(cantidad_ninyos);
                                        writeln;
                                           for i:= 1 to cantidad_ninyos do
                                             begin
                                               write('Nombre del ',i,' ninyo: ');
                                               textcolor(lightred);
                                               readln(DatosNinyos[i].Nombre);
                                               textcolor(lightcyan);
                                               write('Edad del ',i,' ninyo: ');

                                               textcolor(lightred);
                                               readln(DatosNinyos[i].edad);
                                               textcolor(lightcyan);

                                                 end;
                                         end;
                                  clrscr;
                                  write('Cuantas personas estan con su Grupo/Familia: ');
                                  textcolor(lightred);
                                  readln(cantidad_P);
                                  textcolor(lightcyan);
                                    for i:= 1 to cantidad_P do
                                      begin
                                         clrscr;
                                         writeln('Cliente ',i,':');
                                         Cliente_Nuevo;
                                         writeln('Presione cualquier tecla para seguir adelante.');
                                         readkey;
                                      end;

                                           clrscr;
                                 clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 personas_c:=cantidad_P+cantidad_ninyos;
                                 clrscr;
                                 precio:=300*Cantidad_d;
                                 factura;
                    end;

                    '2':begin
                      clrscr;
                      writeln('family room');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                write('Usted viene con sus hijos(si o no): ');
                    readln(hijos);
                                  if (hijos='si') or (hijos='SI') then
                                    begin
                                    write('Cantidad de ninyos: ');
                                        readln(cantidad_ninyos);
                                        writeln;
                                           for i:= 1 to cantidad_ninyos do
                                             begin
                                               write('Nombre del ',i,' ninyo: ');
                                               textcolor(lightred);
                                               readln(DatosNinyos[i].Nombre);
                                               textcolor(lightcyan);
                                               write('Edad del ',i,' ninyo: ');

                                               textcolor(lightred);
                                               readln(DatosNinyos[i].edad);
                                               textcolor(lightcyan);

                                                 end;
                                         end;
                                  clrscr;
                                  write('Cuantas personas estan con su Grupo/Familia: ');
                                  textcolor(lightred);
                                  readln(cantidad_P);
                                  textcolor(lightcyan);
                                    for i:= 1 to cantidad_P do
                                      begin
                                         clrscr;
                                         writeln('Cliente ',i,':');
                                         Cliente_Nuevo;
                                         writeln('Presione cualquier tecla para seguir adelante.');
                                         readkey;
                                      end;

                                            clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 personas_c:=cantidad_P+cantidad_ninyos;
                                 clrscr;
                                 precio:=200*Cantidad_d;
                                 factura;
                    end;

                    '3':begin
                      clrscr;
                      writeln('doble');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                write('Usted viene con sus hijos(si o no): ');
                    readln(hijos);
                                  if (hijos='si') or (hijos='SI') then
                                    begin
                                    write('Cantidad de ninyos: ');
                                        readln(cantidad_ninyos);
                                        writeln;
                                           for i:= 1 to cantidad_ninyos do
                                             begin
                                               write('Nombre del ',i,' ninyo: ');
                                               textcolor(lightred);
                                               readln(DatosNinyos[i].Nombre);
                                               textcolor(lightcyan);
                                               write('Edad del ',i,' ninyo: ');

                                               textcolor(lightred);
                                               readln(DatosNinyos[i].edad);
                                               textcolor(lightcyan);

                                                 end;
                                         end;
                                  clrscr;
                                  write('Cuantas personas estan con su Grupo/Familia: ');
                                  textcolor(lightred);
                                  readln(cantidad_P);
                                  textcolor(lightcyan);
                                    for i:= 1 to cantidad_P do
                                      begin
                                         clrscr;
                                         writeln('Cliente ',i,':');
                                         Cliente_Nuevo;
                                         writeln('Presione cualquier tecla para seguir adelante.');
                                         readkey;
                                      end;

                                            clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 personas_c:=cantidad_P+cantidad_ninyos;
                                 clrscr;
                                 precio:=120*Cantidad_d;
                                 factura;
                    end;

                    '4':begin
                      clrscr;
                      writeln('sencilla');
                      writeln('esta habitacion incluye lo siguiente:');
                      writeln('Desayuno Buffet en el Restaurant Le Nouveau,');
                      writeln('acceso inalambrico a Internet (WIFI),');
                      writeln('Business Center, uso de nuestra exclusiva piscina,'); 
                      writeln('acceso a nuestro gimnasio, sillas y toldos en la playa,'); 
                      writeln(' kit de vanidades y ninos de 0 a 2 anos sin recargos.');
                      writeln();            
                write('Usted viene con sus hijos(si o no): ');
                    readln(hijos);
                                  if (hijos='si') or (hijos='SI') then
                                    begin
                                    write('Cantidad de ninyos: ');
                                        readln(cantidad_ninyos);
                                        writeln;
                                           for i:= 1 to cantidad_ninyos do
                                             begin
                                               write('Nombre del ',i,' ninyo: ');
                                               textcolor(lightred);
                                               readln(DatosNinyos[i].Nombre);
                                               textcolor(lightcyan);
                                               write('Edad del ',i,' ninyo: ');

                                               textcolor(lightred);
                                               readln(DatosNinyos[i].edad);
                                               textcolor(lightcyan);

                                                 end;
                                         end;
                                  clrscr;
                                  write('Cuantas personas estan con su Grupo/Familia: ');
                                  textcolor(lightred);
                                  readln(cantidad_P);
                                  textcolor(lightcyan);
                                    for i:= 1 to cantidad_P do
                                      begin
                                         clrscr;
                                         writeln('Cliente ',i,':');
                                         Cliente_Nuevo;
                                         writeln('Presione cualquier tecla para seguir adelante.');
                                         readkey;
                                      end;

                                           clrscr;
                                 writeln;
                                 write('Cantidad de dias a quedarse: ');
                                 textcolor(lightred);
                                 readln(Cantidad_d);
                                 textcolor(lightcyan);
                                 personas_c:=cantidad_P+cantidad_ninyos;
                                 clrscr;
                                 precio:=60*Cantidad_d;
                                 factura;
                    end;

                 end;

                     reset(Clientes_GP);
                      seek(Clientes_GP, FileSize(Clientes_GP));
                      write(Clientes_GP, NCliente);
                      close(Clientes_GP);

                until op2='0';

                                    end;
         end;
until op3='0';
end;
procedure Servicio;                                                                  //servicio
  var
    op6:char;
begin

   repeat
    clrscr;
    writeln('Elija el servicio que desea consultar informacion:');
    writeln;
    writeln('1) Family Room   2) Sencilla   3) Doble   4)Suite   0) Atras');
    writeln;
    write('Elija una opcion: ');
    readln(op6);


           case op6 of                                                                             //seleccion de servicios

              '1':begin
              clrscr;
              writeln('Family Room: ');
              writeln;
              writeln('Calida y confortable habitacion decorada con un estilo vanguardista,');
              writeln('100% libre de humo, cama Lidotel Royal King, con reloj despertador,');
              writeln('TV 32" HD Plasma con cable, banyo con ducha, cafetera electrica,');
              writeln('nevera ejecutiva,caja electronica de seguridad y secador de cabello,');
              writeln('armario adicional amplio,una habitacion separada con 2 camas full,');
              writeln('banyo con ducha.');
              readkey;
              end;

              '2':begin
              clrscr;
              writeln('Sencilla');
              writeln;
              writeln('Amplia y confortable habitacion decorada con un estilo vanguardista,');
              writeln('cama Lidotel Royal King con sabanas de algodon egipcio, soporte para');
              writeln('iPod con reloj despertador,TV 32" HD Plasma con cable, banyo con ducha,');
              writeln(' cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
              readkey;
              end;

              '3':begin
                clrscr;
              writeln('Doble');
              writeln;
              writeln('Amplia y confortable habitacion decorada con un estilo vanguardista,');
              writeln('Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para');
              writeln('iPod con reloj despertador, TV 32" HD Plasma con cable, banyo con ducha,');
              writeln('cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
              readkey;
              end;

              '4':begin
              clrscr;
              writeln('Suite');
              writeln;
              writeln('Calida y confortable habitacion decorada con un estilo vanguardista,');
              writeln('100% libre de humo, Cama Lidotel Royal King, con reloj despertador,');
              writeln('TV 32" HD Plasma con cable, 2 banyos con ducha, cafetera electrica, ');
              writeln('nevera ejecutiva, caja electronica de seguridad y secador de cabello,');
              writeln('armario adicional amplio y area separada con 2 sofa-cama individuales.');
              readkey;
              end;


             end;
      until op6='0';

end;
BEGIN                                                                                //menu
repeat
clrscr;

textcolor(lightcyan);
  gotoxy(27,10);
  writeln('LIDOTEL MARGARITA');
  gotoxy(30,11);
  writeln('"EL MISTER"');
  gotoxy(27,13);
  writeln('1. Nuevo Cliente');
  gotoxy(27,14);
  writeln('2. Cliente Anterior');
  gotoxy(27,15);
  writeln('3. Reservacion');
  gotoxy(27,16);
  writeln('4. Actualizar Datos De Clientes');
  gotoxy(27,17);
  writeln('5. Buscar Cliente Registrado');
  gotoxy(27,18);
  writeln('6. Servicios');
  gotoxy(27,19);
  writeln('0. Salir');
  gotoxy(27,21);
  write('Eliga la opcion de su preferencia: ');
  textcolor(lightred);
  readln(opcion);
  textcolor(lightcyan);



    case opcion of

         '1':begin
           clrscr;
           writeln('Nuevo Cliente');
           Cliente_Nuevo;


         end;

         '2':begin
           clrscr;
           writeln('Cliente Anterior');
           writeln;
           writeln('Nombre: ',NCliente.nombre);
           writeln('Apellido: ',NCliente.apellido);
           writeln('ID: ',NCliente.id);
           writeln('Correo: ',NCliente.correo_e);
           writeln('Telefono: ',NCliente.telefono);
           writeln;
           writeln('Presione cualquier tecla parar continuar.');


           readkey;
         end;

         '3':begin
           clrscr;
           reservacion;

         end;

         '4':begin
           clrscr;
           writeln('Actualizar Datos De Clientes');
           readkey;
         end;

         '5':begin
           clrscr;
           writeln('Buscar Cliente Registrado');
           writeln('ingrese la cedula del cliente a buscar');
           readln(bid);
           
           readkey;
         end;

         '6':begin
           clrscr;
           Servicio;

         end;
    end;

    until opcion='0';


END.
