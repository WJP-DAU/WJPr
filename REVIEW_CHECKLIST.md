# Checklist de Revisión para PRs

Usa esta lista para revisar pull requests de nuevas funciones en WJPr.

## Estructura del Código

### Nomenclatura

- Archivo nombrado `{tipo}Chart.R`
- Función nombrada `wjp_{tipo}()`
- Variables internas con sufijo `_var` (ej: `target_var`, `colors_var`)

### Parámetros

- Usa parámetros estándar: `data`, `target`, `grouping`
- Parámetros opcionales tienen defaults: `colors = NULL`, `cvec = NULL`
- Incluye `ptheme = WJP_theme()` como último parámetro

### Manejo de Columnas

- Usa `all_of()` para renombrar columnas
- Verifica [`is.null()`](https://rdrr.io/r/base/NULL.html) antes de
  renombrar parámetros opcionales
- Evita doble rename cuando `colors == grouping` o `labels == grouping`

``` r
# Patrón correcto
if (is.null(colors)) {
  data <- data %>% mutate(colors_var = grouping_var)
} else if (colors == grouping) {
  data <- data %>% mutate(colors_var = grouping_var)
} else {
  data <- data %>% rename(colors_var = all_of(colors))
}
```

### Colores

- Aplica `scale_*_manual(values = cvec)` solo si `!is.null(cvec)`
- No asume colores por defecto para datos del usuario

### Tema

- Aplica `ptheme` antes de ajustes específicos
- Usa `theme()` para sobrescribir elementos específicos

### Retorno

- Función retorna objeto ggplot con `return(plt)`

------------------------------------------------------------------------

## Documentación Roxygen2

### Tags Obligatorios

- `#' @description` con `lifecycle::badge("experimental")`
- `#' @param` para TODOS los parámetros
- `#' @return` describiendo el valor de retorno
- `#' @export`
- `#' @examples` con código reproducible

### Formato de @param

- Incluye tipo de dato: `@param target String. Column name...`
- Describe valor por defecto si existe: `Default is NULL.`

### Ejemplo

- Carga librerías necesarias
  ([`library(dplyr)`](https://dplyr.tidyverse.org), etc.)
- Usa datos de ejemplo simples o
  [`WJPr::gpp`](https://worldjusticeproject-org.github.io/WJPr/reference/gpp.md)/[`WJPr::roli`](https://worldjusticeproject-org.github.io/WJPr/reference/roli.md)
- Ejemplo ejecuta sin errores

------------------------------------------------------------------------

## Archivos Actualizados

- `data-raw/generate-examples.R` - Nueva sección para generar imagen
- `man/figures/example-{tipo}.png` - Imagen generada
- `CLAUDE.md` - Nueva función documentada
- `NAMESPACE` - Función exportada (generado por
  [`devtools::document()`](https://devtools.r-lib.org/reference/document.html))

------------------------------------------------------------------------

## Verificación Final

``` r
# Ejecutar estos comandos antes de aprobar:
devtools::document()
devtools::check()

# Probar la función
devtools::load_all()
wjp_fonts()
# ... ejecutar ejemplo de la función
```

### Resultado de `devtools::check()`

- 0 errors
- 0 warnings
- Notes aceptables (no relacionadas con la nueva función)

------------------------------------------------------------------------

## Notas del Revisor

*Espacio para comentarios adicionales…*
