set serveroutput on;
------------CAMERA------------
--actualizarea unei camere existente
EXECUTE  pachet_camera.update_camera('101', 210);
--actualizarea unei camere care nu exista
EXECUTE  pachet_camera.update_camera('10001', 210);

--Testare tip camera invalid (Trigger trigger_check_tip_camera)
EXECUTE pachet_camera.insert_camera('305', 'Suita', 270);

EXECUTE pachet_camera.delete_camera('304');

--Testarea functiei de afisare a numarului camerei (nr 202)
ACCEPT v_nr_cam NUMBER PROMPT 'Numar camera: ';
DECLARE
    v_tip camera.tipul%type;
BEGIN
    v_tip := pachet_camera.get_tip_camera(&v_nr_cam);
    DBMS_OUTPUT.PUT_LINE('Tipul camerei cu numarul ' || &v_nr_cam || ': ' || v_tip);
END;
/

--Afisarea camerelor si perioadelor disponibile
EXECUTE pachet_camera.afisare_camere_indisponibile();

------------CLIENT------------
--insereare client minor (Testare trigger trigger_check_varsta)
EXECUTE pachet_client.insert_client('8234512876012', 'Petrescu', 'Ionut', '0732123140', 'petrescu.ionut@gmail.com', 'Str. Cuza Voda, Nr. 14, Brasov', 2);

--inserare client cu o adresa de email invalida (Testare trigger trigger_check_email)
execute pachet_client.insert_client('8234512876012', 'Petrescu', 'Ionut', '0732123140', 'petrescu.ionut', 'Str. Cuza Voda, Nr. 14, Brasov', 18);

EXECUTE pachet_client.update_client_telefon('1234567890123', '0777123456');
EXECUTE pachet_client.update_client_email('7890123456789', 'mihaiCristina2002@gmail.com');
EXECUTE pachet_client.update_client_adresa('7890123456789', 'Str. Gheorghe Doja, Nr. 28, Iasi');
EXECUTE pachet_client.update_client_nume('1234509876012', 'Donici');

--Nu exista niciun client cu cnp-ul specificat in baza de date
EXECUTE pachet_client.update_client_telefon('5678901234565', '0767123456');

EXECUTE pachet_client.delete_client('7890123456789');
EXECUTE pachet_client.delete_client('9012345678901');

--Afisarea unui client care nu exista in baza de date
EXECUTE pachet_client.afisare_rezervari_client_perioada('1111111111111');
--Afisarea unui client cu cnp valid
EXECUTE pachet_client.afisare_rezervari_client_perioada('0123456789012');

--Verificare daca clientul are rezervari (cnp : 1234567890123)
ACCEPT v_cnp NUMBER PROMPT 'CNP-ul';
DECLARE
  v_has_reservations BOOLEAN;
BEGIN
  v_has_reservations := pachet_client.has_reservations(&v_cnp);
  IF v_has_reservations THEN
    dbms_output.put_line('Clientul cu CNP-ul ' || &v_cnp || ' are rezervări.');
  ELSE
    dbms_output.put_line('Clientul cu CNP-ul ' || &v_cnp || ' nu are rezervări.');
  END IF;
END;
/


------------RECEPTIONIST------------
--Actualizarea adresei unui receptionist existent
EXECUTE pachet_receptionist.update_adresa_receptionist(1,  'Str. Parcului, Nr. 10');

--Actualizarea salariului unui receptionist existent
EXECUTE pachet_receptionist.update_salar_receptionist(3, 3200);

--Actualizarea adresei unui receptionist care nu exista
EXECUTE pachet_receptionist.update_adresa_receptionist(5,  'Str. Parcului, Nr. 10');

--Stergerea unui receptionist care nu exista
EXECUTE pachet_receptionist.delete_receptionist(6);


------------REZERVARE------------
--Update 
EXECUTE pachet_rezervare.update_rezervare_check_out(3, TO_DATE('2024-01-25', 'YYYY-MM-DD'), '123456789012');

--Actualizarea unei rezervari inexistente
EXECUTE pachet_rezervare.update_rezervare_check_out(11, TO_DATE('2024-01-25', 'YYYY-MM-DD'), '123456789012');


--Stergere rezervare
EXECUTE pachet_rezervare.delete_rezervare(8);
EXECUTE pachet_rezervare.delete_rezervare(3);
EXECUTE pachet_rezervare.delete_rezervare(5);
--Stergerea unei rezervari inexistente
EXECUTE pachet_rezervare.delete_rezervare(11);

-- Nu sunt camere disponibile pentru perioada data!
EXECUTE pachet_rezervare.insert_rezervare(9, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, '0123456789012', 2);

-- Numarul de persoane este prea mare pentru o singura  camera
EXECUTE pachet_rezervare.insert_rezervare(10, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 7, '0123456789012', 2);

--Inserare cu data de check-in inainte de SYSDATE
EXECUTE pachet_rezervare.insert_rezervare(9, TO_DATE('2020-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 3, '0123456789012', 2);

--Inserare cu data de check-out inainte de SYSDATE
EXECUTE pachet_rezervare.insert_rezervare(9, TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2020-03-20', 'YYYY-MM-DD'), 1, '0123456789012', 2);

--Verificare update check-out cu o data care este inainte de data de check-in stabilita (2024-07-15)
EXECUTE pachet_rezervare.update_rezervare_check_out(5, TO_DATE('2024-07-05', 'YYYY-MM-DD'), '123456789012');

--Verificare update check-in cu o data care este dupa data de check-out stabilita (2024-01-20)
EXECUTE pachet_rezervare.update_rezervare_check_in(4, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '123456789012');

--Afisarea tuturor rezervarilor si a sumei totale
EXECUTE pachet_rezervare.afisare_rezervari_client_suma();

------------FACTURA------------

--Actualizarea metodei de plata la o factura existenta
EXECUTE pachet_factura.update_metoda_plata(2, 'Cash');

--Actualizarea metodei de plata la o factura care nu exista
EXECUTE pachet_factura.update_metoda_plata(10, 'Cash');

--Afisarea facturilor existente in baza de date
EXECUTE pachet_factura.afisare_facturi();

--Testare trigger update_suma_totala
EXECUTE pachet_camera.update_camera(202, 320);

--Inserare factura cu o data mia mica ca sysdate - EROARE
EXECUTE pachet_factura.insert_factura(9, TO_DATE('2021-04-14', 'YYYY-MM-DD'), 'RO123456639E', 'Bonuri', 9);



