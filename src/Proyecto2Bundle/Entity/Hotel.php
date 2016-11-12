<?php

namespace Proyecto2Bundle\Entity;

/**
 * Hotel
 */
class Hotel
{
    /**
     * @var string
     */
    private $hotel;

    /**
     * @var integer
     */
    private $idHotel;

    /**
     * Set hotel
     *
     * @param string $hotel
     *
     * @return Hotel
     */
    public function setHotel($hotel)
    {
        $this->hotel = $hotel;

        return $this;
    }

    /**
     * Get hotel
     *
     * @return string
     */
    public function getHotel()
    {
        return $this->hotel;
    }

    /**
     * Get idHotel
     *
     * @return integer
     */
    public function getIdHotel()
    {
        return $this->idHotel;
    }
    /**
     * @var integer
     */
    private $costo;

    /**
     * @var integer
     */
    private $capacidad;


    /**
     * Set costo
     *
     * @param integer $costo
     *
     * @return Hotel
     */
    public function setCosto($costo)
    {
        $this->costo = $costo;

        return $this;
    }

    /**
     * Get costo
     *
     * @return integer
     */
    public function getCosto()
    {
        return $this->costo;
    }

    /**
     * Set capacidad
     *
     * @param integer $capacidad
     *
     * @return Hotel
     */
    public function setCapacidad($capacidad)
    {
        $this->capacidad = $capacidad;

        return $this;
    }

    /**
     * Get capacidad
     *
     * @return integer
     */
    public function getCapacidad()
    {
        return $this->capacidad;
    }
}
