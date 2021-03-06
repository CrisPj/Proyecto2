<?php

namespace Proyecto2Bundle\Entity;

/**
 * Tipo
 */
class Tipo
{
    /**
     * @var string
     */
    private $tipo;

    /**
     * @var integer
     */
    private $idTipo;


    /**
     * Set tipo
     *
     * @param string $tipo
     *
     * @return Tipo
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;

        return $this;
    }

    /**
     * Get tipo
     *
     * @return string
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Get idTipo
     *
     * @return integer
     */
    public function getIdTipo()
    {
        return $this->idTipo;
    }

    public function __toString()
    {
        return $this->getTipo();
    }
}
