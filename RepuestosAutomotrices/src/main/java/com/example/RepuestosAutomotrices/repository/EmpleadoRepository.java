package com.example.RepuestosAutomotrices.repository;

import com.example.RepuestosAutomotrices.Entity.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado,Integer> {

}
