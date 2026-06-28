package com.example.Inkapark.servicio;

import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.Inkapark.modelo.Usuario;
import com.example.Inkapark.repositorio.UsuarioRepositorio;

@Service
public class AuthServicio {

    private final UsuarioRepositorio usuarioRepositorio;
    private final PasswordEncoder encoder;

    public AuthServicio(UsuarioRepositorio usuarioRepositorio, PasswordEncoder encoder) {
        this.usuarioRepositorio = usuarioRepositorio;
        this.encoder = encoder;
    }

    /*** Login general (cliente o admin). Bloquea si no está verificado. Soporta* legacy texto plano.*/
    public Optional<Usuario> login(String correo, String contrasena) {
        String correoNormalizado = normalizar(correo);

        if (correoNormalizado == null || correoNormalizado.isBlank() || contrasena == null || contrasena.isBlank()) {
            return Optional.empty();
        }

        return usuarioRepositorio.findByCorreo(correoNormalizado)
                .filter(Usuario::isVerificado)
                .filter(u -> passwordMatches(contrasena, u.getContrasena()));
    }

    /** Login admin (rol ADMIN).*/
    public Optional<Usuario> loginAdmin(String correo, String contrasena) {
        return login(correo, contrasena)
                .filter(u -> u.getRol() == Usuario.Rol.ADMIN);
    }

    /** BCrypt con fallback a texto plano para cuentas viejas.*/
    private boolean passwordMatches(String raw, String stored) {
        if (raw == null || raw.isBlank() || stored == null || stored.isBlank()) {
            return false;
        }

        boolean looksHashed = stored.startsWith("$2a$")
                || stored.startsWith("$2b$")
                || stored.startsWith("$2y$");

        if (looksHashed) {
            return encoder.matches(raw, stored);
        }

        return stored.equals(raw);
    }

    private String normalizar(String correo) {
        return correo == null ? null : correo.trim().toLowerCase();
    }
}
