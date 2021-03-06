<?php

namespace Proyecto2Bundle\Entity;

/**
 * MetodoPago
 */
class MetodoPago
{
    /**
     * @var string
     */
    private $metodoPago;

    /**
     * @var integer
     */
    private $idMetodoPago;


    /**
     * Set metodoPago
     *
     * @param string $metodoPago
     *
     * @return MetodoPago
     */
    public function setMetodoPago($metodoPago)
    {
        $this->metodoPago = $metodoPago;

        return $this;
    }

    /**
     * Get metodoPago
     *
     * @return string
     */
    public function getMetodoPago()
    {
        return $this->metodoPago;
    }

    /**
     * Get idMetodoPago
     *
     * @return integer
     */
    public function getIdMetodoPago()
    {
        return $this->idMetodoPago;
    }
}
