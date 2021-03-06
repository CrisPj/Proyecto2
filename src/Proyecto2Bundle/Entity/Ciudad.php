<?php

namespace Proyecto2Bundle\Entity;

/**
 * Ciudad
 */
class Ciudad
{
    /**
     * @var string
     */
    private $ciudad;

    /**
     * @var integer
     */
    private $idCiudad;


    /**
     * Set ciudad
     *
     * @param string $ciudad
     *
     * @return Ciudad
     */
    public function setCiudad($ciudad)
    {
        $this->ciudad = $ciudad;

        return $this;
    }

    /**
     * Get ciudad
     *
     * @return string
     */
    public function getCiudad()
    {
        return $this->ciudad;
    }

    /**
     * Get idCiudad
     *
     * @return integer
     */
    public function getIdCiudad()
    {
        return $this->idCiudad;
    }

    public function __toString()
    {
        return $this->getCiudad();
    }
}
