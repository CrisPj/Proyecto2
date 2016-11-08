<?php

namespace Proyecto2Bundle\Entity;

/**
 * Cupones
 */
class Cupones
{
    /**
     * @var string
     */
    private $cupon;

    /**
     * @var boolean
     */
    private $estado;

    /**
     * @var integer
     */
    private $idCupon;


    /**
     * Set cupon
     *
     * @param string $cupon
     *
     * @return Cupones
     */
    public function setCupon($cupon)
    {
        $this->cupon = $cupon;

        return $this;
    }

    /**
     * Get cupon
     *
     * @return string
     */
    public function getCupon()
    {
        return $this->cupon;
    }

    /**
     * Set estado
     *
     * @param boolean $estado
     *
     * @return Cupones
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;

        return $this;
    }

    /**
     * Get estado
     *
     * @return boolean
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * Get idCupon
     *
     * @return integer
     */
    public function getIdCupon()
    {
        return $this->idCupon;
    }
}
