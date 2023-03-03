`cart``user``article`ALTER TABLE odjel
ADD COLUMN brNaloga INT,
ADD COLUMN sumaSati INT,
ADD COLUMN avgSati DECIMAL(6,2);

DELIMITER //
DROP TRIGGER IF EXISTS prviTriger //
CREATE TRIGGER prviTriger AFTER INSERT ON nalog FOR EACH ROW
BEGIN
DECLARE v_sifOdjel,v_brNalog INT DEFAULT 0;
DECLARE v_sumaSati INT DEFAULT 0;
DECLARE v_avgSati DECIMAL(6,2) DEFAULT 0;

	SELECT DISTINCT sifOdjel INTO v_sifOdjel
	FROM radnik
	WHERE sifRadnik=new.sifRadnik
	
	SELECT COUNT(*),SUM(n.ostvareniSatiRada),AVG(n.ostvareniSatiRada)
	INTO v_brNalog,v_sumaSati,v_avgSati
	FROM nalog n NATURAL JOIN radnik r 
	WHERE r.sifOdjel=v_sifOdjel
	
	UPDATE odjel 
	SET brNaloga=v_brNaloga,sumaSati=v_sumaSati,avgSati=v_avgSati
	where sifOdjel=v_sifOdjel
end //
Delimiter;

DELIMITER //
DROP TRIGGER IF EXISTS drugiTriger //
CREATE TRIGGER drugiTriger AFTER INSERT ON studenti FOR EACH ROW
BEGIN
declare v_iznadAvg,v_ispodAvg decimal(6,2) default 0;

select sum(case when avg(studenta)>=prosjekSmjera then 1 else 0) as iznadAvg
SUM(CASE WHEN AVG(studenta)<=prosjekSmjera THEN 1 ELSE 0) AS ispodAvg


create user 'admin_user' @'localhost' identified by 'admin';
grant select,update on studenti.ocjene to 'admin_user' @'localhost';
alter user identified by 'loz' with max_queries_per_hour 20 max_updates_per_hour 25;

grant select,update on studenti.ocjene to 'admin_user'@'localhost';

GRANT SELECT,UPDATE ON studenti.kolegiji TO 'admin_user' @'localhost';
ALTER USER IDENTIFIED BY 'loz' WITH MAX_QUERIES_PER_HOUR 20 MAX_UPDATES_PER_HOUR 25;

show grants for 'admin_user'@'localhost';

revoke all privileges,grant option from 'admin_user' @ 'localhost';




create user 'profesor'@'%' identified by 'prof_adm';
grant select(jmbag,ime,prezime),update(id_smjera,datum_upisa) on studenti.student to 'profesor'@'%';
alter user identified by 'prof_adm' with  max_queries_per_hour 20 max_updates_per_hour 25

grant select(idKolegij),update(jmbagStudent,ocjena) on studenti.ocjene;
show grants for 'profesor'@'%'
revoke all privileges,grant option from 'profesor'@'%'




create user 'leader'@'localhost' identified by 'lead_loz'
grant select,update on autoradionica.klijent to 'leader'@'localhost';
alter user identified by 'lead_loz2' with max_queries_per_hour 10 max_updates_per_hour 10;

GRANT SELECT,UPDATE ON autoradionica.klijent TO 'leader'@'localhost';

GRANT SELECT,UPDATE ON autoradionica.nalog TO 'leader'@'localhost';
ALTER USER IDENTIFIED BY 'lead_loz2' WITH MAX_QUERIES_PER_HOUR 10 MAX_UPDATES_PER_HOUR 10;

show grants for 'leader'@'localhost';
revoke all privileges,grant oprion from 'leader'@'localhost'





create user 'user_adm'@'192.168.31.170' identified by 'adm_pass'

grant create routine on stundeti.* to 'user_adm'@'192.168.31.170';
grant execute on procedure studenti.izbrojiOcjene to 'user_adm'@'192.168.31.170'



