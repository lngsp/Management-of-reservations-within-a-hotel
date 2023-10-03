BEGIN
  pachet_camera.insert_camera('101', 'Single', 200);
  pachet_camera.insert_camera('102', 'Apartament', 320);
  pachet_camera.insert_camera('103', 'Single', 200);
  pachet_camera.insert_camera('104', 'Apartament', 320);
  pachet_camera.insert_camera('201', 'Tripla', 270);
  pachet_camera.insert_camera('202', 'Dubla', 220);
  pachet_camera.insert_camera('203', 'Single', 200);
  pachet_camera.insert_camera('204', 'Tripla', 270);
  pachet_camera.insert_camera('301', 'Dubla', 220);
  pachet_camera.insert_camera('302', 'Tripla', 270);
  pachet_camera.insert_camera('303', 'Apartament', 320);
  pachet_camera.insert_camera('304', 'Tripla', 270);
  
END;
/

BEGIN
    pachet_client.insert_client('1234567890123', 'Popescu', 'Ion', '0745123456', 'popescu.ion@gmail.com', 'Str. Florilor, Nr. 10, Bucuresti', 35);
    pachet_client.insert_client('2345678901234', 'Ionescu', 'Maria', '0723123456', 'ionescu.maria@yahoo.com', 'Str. Libertatii, Nr. 20, Bucuresti', 28);
    pachet_client.insert_client('3456789012345', 'Radulescu', 'Elena', '0724123456', 'radulescu.elena@gmail.com', 'Str. Mihai Viteazu, Nr. 5, Cluj-Napoca', 42);
    pachet_client.insert_client('4567890123456', 'Popa', 'Mihai', '0725123456', 'popa.mihai@yahoo.com', 'Str. Victoriei, Nr. 15, Timisoara', 39);
    pachet_client.insert_client('5678901234567', 'Stanciu', 'Ana', '0726123456', 'stanciu.ana@gmail.com', 'Str. Crisana, Nr. 7, Oradea', 31);
    pachet_client.insert_client('6789012345678', 'Dumitrescu', 'George', '0727123456', 'dumitrescu.george@yahoo.com', 'Str. Unirii, Nr. 25, Brasov', 48);
    pachet_client.insert_client('7890123456789', 'Mihai', 'Cristina', '0728123456', 'mihai.cristina@gmail.com', 'Str. Republicii, Nr. 8, Iasi', 36);
    pachet_client.insert_client('8901234567890', 'Gheorghe', 'Vlad', '0729123456', 'gheorghe.vlad@yahoo.com', 'Str. Mihail Kogalniceanu, Nr. 12, Constanta', 27);
    pachet_client.insert_client('9012345678901', 'Georgescu', 'Andreea', '0730123456', 'georgescu.andreea@gmail.com', 'Str. Aviatorilor, Nr. 18, Sibiu', 41);
    pachet_client.insert_client('0123456789012', 'Iacob', 'Adrian', '0731123456', 'iacob.adrian@yahoo.com', 'Str. Independentei, Nr. 30, Cluj-Napoca', 33);
    pachet_client.insert_client('1234509876012', 'Petrescu', 'Gabriela', '0732123456', 'petrescu.gabriela@gmail.com', 'Str. Cuza Voda, Nr. 14, Brasov', 29);
END;
/

BEGIN
  pachet_receptionist.insert_receptionist(1, '5001238225489', 'Lungu', 'Vladimir', 'Str. Lalelelor, Nr. 10', '0723743456', 2500, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
  pachet_receptionist.insert_receptionist(2, '1004986115748', 'Donici', 'Maria', 'Str. Salciilor, Nr. 5', '0732023407', 2800, TO_DATE('2022-03-20', 'YYYY-MM-DD'));
  pachet_receptionist.insert_receptionist(3, '1254892157315', 'Conta', 'Ana', 'Str. Mihail Vasile, Nr. 7', '0771023456', 3000, TO_DATE('2022-05-10', 'YYYY-MM-DD'));
  pachet_receptionist.insert_receptionist(4, '1247892145223', 'Andrei', 'Mihai', 'Str. Mihail Kogalniceanu, Nr. 15', '0741373406', 2700, TO_DATE('2022-07-25', 'YYYY-MM-DD'));
END;
/

BEGIN
    pachet_rezervare.insert_rezervare(1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-05', 'YYYY-MM-DD'), 2, '1234567890123', 1);
    pachet_rezervare.insert_rezervare(2, TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'), 3, '2345678901234', 2);
    pachet_rezervare.insert_rezervare(3, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 3, '0123456789012', 2);
    pachet_rezervare.insert_rezervare(4, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 4, '0123456789012', 2);
    pachet_rezervare.insert_rezervare(5, TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 2, '0123456789012', 2);
    pachet_rezervare.insert_rezervare(6, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, '0123456789012', 2);
    pachet_rezervare.insert_rezervare(7, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, '0123456789012', 2);
    pachet_rezervare.insert_rezervare(8, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, '0123456789012', 2);
END;
/

BEGIN
  pachet_factura.insert_factura(1, TO_DATE('2023-05-27', 'YYYY-MM-DD'), 'RO123456789A', 'Card', 1);
  pachet_factura.insert_factura(2, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'RO987654321B', 'Cash', 2);
  pachet_factura.insert_factura(3, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'RO567890123C', 'Bonuri', 3);
  pachet_factura.insert_factura(4, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'RO567890123C', 'Card', 4);
  pachet_factura.insert_factura(5, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'RO567890123C', 'Card', 5);
  pachet_factura.insert_factura(6, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'RO567890123C', 'Bonuri', 6);
  pachet_factura.insert_factura(7, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'RO567890123C', 'Card', 7);
END;
/