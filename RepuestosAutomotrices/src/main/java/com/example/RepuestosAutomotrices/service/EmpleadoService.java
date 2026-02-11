package com.example.RepuestosAutomotrices.service;

import com.example.RepuestosAutomotrices.Entity.Empleado;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface EmpleadoService {
    List<Empleado> getAllEmpleados();
    Empleado getEmpleadoById(Integer id);
    Empleado saveEmpleado (Empleado empleado) throws RuntimeException;
    Empleado updateEmpleado(Integer id, Empleado empleado);
    void deleteEmpleado(Integer id);
}
