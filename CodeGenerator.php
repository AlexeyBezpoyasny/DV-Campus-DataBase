<?php
declare(strict_types=1);

class CodeGenerator
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            $connection->beginTransaction();
            $this->cleanup();
            $connection->commit();

            $connection->beginTransaction();
            $this->generateEmployees(50);
            $this->generateSalaries();
            $this->generateIncome();
            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomFirstName(): string
    {
        static $randomFirstNames = ['Uells', 'Gibson', 'Endryus', 'Hud', 'Hanter', 'Leng', 'Fauler', 'But', 'Rayan', 'Rays', 'Teylor', 'Kuper', 'Myorfi', 'Dikkerson', 'Kammings', 'Karson', 'Henderson', 'Patterson', 'Meloun', 'Ueyd', 'Makkormik', 'Karson', 'Frimen', 'Hempton', 'Lourens', 'Filds', 'Park', 'Din', 'Meloun', 'Uebster', 'Karter', 'Hant', 'Mitchell', 'Uebb', 'Klark', 'Lukas', 'Franklin', 'Dikkerson', 'Makkenzi'];
        return $randomFirstNames[array_rand($randomFirstNames)];
    }

    private function getRandomLastName(): string
    {
        static $randomLastNames = ['Pitirim', 'Severian', 'Amos', 'Foka', 'Kallinik', 'Florentiy', 'Daniil', 'Boris', 'Vikentiy', 'Faviy', 'Serafim', 'Silvan', 'Panfil', 'Diodor', 'Elizar', 'Aris', 'Akinfiy', 'Borislav', 'Gektor', 'Efrem', 'Florentiy', 'Mark', 'Flaviy', 'Sofroniy', 'Akakiy', 'Martemyan', 'Vitold', 'Modest', 'Gonorat', 'Amandin', 'Ianikit', 'Martin'];
        return $randomLastNames[array_rand($randomLastNames)];
    }


    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=cherkasy_elektro_trans', 'cherkasy_elektro_trans', 'cherkasy_elektro_trans', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM employee WHERE employee_id > 17');
        $connection->exec('ALTER TABLE employee AUTO_INCREMENT = 18');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 59');
    }

    /**
     * @param int $employeesCount
     * @throws Exception
     */
    public function generateEmployees(int $employeesCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        $start = microtime(true);

        $positionId = $employeeFirstName = $employeeLastName = $dob = $dateOfEmployment = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 16);
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employee (position_id, employee_first_name, employee_last_name, dob, date_of_employment)
    VALUES (:positionId, :employeeFirstName, :employeeLastName, :dob, :dateOfEmployment)
SQL
        );
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':employeeFirstName', $employeeFirstName);
        $statement->bindParam(':employeeLastName', $employeeLastName);
        $statement->bindParam(':dob', $dob);
        $statement->bindParam(':dateOfEmployment', $dateOfEmployment);

        for ($employeeId = 7; $employeeId < $employeesCount; $employeeId++) {
            $positionId = random_int(1, 7);
            $employeeFirstName = $this->getRandomFirstName();
            $employeeLastName = $this->getRandomLastName();
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $dob = date('Y-m-d', $timestamp);
            $timestampSecond = random_int($currentTimestamp - 631139040, $currentTimestamp);
            $dateOfEmployment = date('Y-m-d', $timestampSecond);
            $statement->execute();
        }

        echo 'Create employees: ' . (microtime(true) - $start) . "\n";
    }

    public function generateSalaries(): void
    {
        $connection = $this->getConnection();

        $start = microtime(true);
        $employeeId = $positionId = $salarySum = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (employee_id, position_id, salary_sum)
    VALUES (:employeeId, :positionId, :salarySum)
SQL
        );
        $statement->bindParam(':employeeId', $employeeId, PDO::PARAM_INT);
        $statement->bindParam(':positionId', $positionId, PDO::PARAM_INT);
        $statement->bindParam(':salarySum', $salarySum, PDO::PARAM_INT);

        $employeeIdsStatement = $connection->query('SELECT employee_id FROM employee');
        $employeeIds = $employeeIdsStatement->fetchAll(PDO::FETCH_COLUMN);

        foreach ($employeeIds as $employeeId) {
            for ($i = 0; $i < 2000; $i++) {
                $positionId = random_int(1, 7);
                $salarySum = random_int(1000, 100000);
                $statement->execute();
            }
        }

        echo 'Create salaries: ' . (microtime(true) - $start) . "\n";
    }

    public function generateIncome(): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        $start = microtime(true);
        $employeeId = $transportId = $dateOfWork = $dailyProfit = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO income (employee_id, transport_id, date_of_work, daily_profit)
    VALUES (:employeeId, :transportId, :dateOfWork, :dailyProfit)
SQL
        );
        $statement->bindParam(':employeeId', $employeeId, PDO::PARAM_INT);
        $statement->bindParam(':transportId', $transportId, PDO::PARAM_INT);
        $statement->bindParam(':dateOfWork', $dateOfWork);
        $statement->bindParam(':dailyProfit', $dailyProfit, PDO::PARAM_INT);

        $employeeIdsStatement = $connection->query('SELECT employee_id FROM employee');
        $employeeIds = $employeeIdsStatement->fetchAll(PDO::FETCH_COLUMN);

        foreach ($employeeIds as $employeeId) {
            for ($i = 0; $i < 20000; $i++) {
                $transportId = random_int(1, 11);
                $timestamp = random_int($currentTimestamp - 631139040, $currentTimestamp);
                $dateOfWork = date('Y-m-d', $timestamp);
                $dailyProfit = random_int(100, 10000);
                $statement->execute();
            }
        }

        echo 'Create incomes: ' . (microtime(true) - $start) . "\n";
    }
}

$generator = new CodeGenerator();
$generator->generate();