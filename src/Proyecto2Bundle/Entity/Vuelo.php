<?php

namespace Proyecto2Bundle\Entity;

/**
 * Vuelo
 */
class Vuelo
{
    /**
     * @var \DateTime
     */
    private $fecha;

    /**
     * @var integer
     */
    private $precio;

    /**
     * @var integer
     */
    private $idVuelo;

    /**
     * @var \Proyecto2Bundle\Entity\Ciudad
     */
    private $origen;

    /**
     * @var \Proyecto2Bundle\Entity\Ciudad
     */
    private $destino;

    /**
     * @var \Proyecto2Bundle\Entity\Tipo
     */
    private $idTipo;


    /**
     * Set fecha
     *
     * @param \DateTime $fecha
     *
     * @return Vuelo
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set precio
     *
     * @param integer $precio
     *
     * @return Vuelo
     */
    public function setPrecio($precio)
    {
        $this->precio = $precio;

        return $this;
    }

    /**
     * Get precio
     *
     * @return integer
     */
    public function getPrecio()
    {
        return $this->precio;
    }

    /**
     * Get idVuelo
     *
     * @return integer
     */
    public function getIdVuelo()
    {
        return $this->idVuelo;
    }

    /**
     * Set origen
     *
     * @param \Proyecto2Bundle\Entity\Ciudad $origen
     *
     * @return Vuelo
     */
    public function setOrigen(\Proyecto2Bundle\Entity\Ciudad $origen = null)
    {
        $this->origen = $origen;

        return $this;
    }

    /**
     * Get origen
     *
     * @return \Proyecto2Bundle\Entity\Ciudad
     */
    public function getOrigen()
    {
        return $this->origen;
    }

    /**
     * Set destino
     *
     * @param \Proyecto2Bundle\Entity\Ciudad $destino
     *
     * @return Vuelo
     */
    public function setDestino(\Proyecto2Bundle\Entity\Ciudad $destino = null)
    {
        $this->destino = $destino;

        return $this;
    }

    /**
     * Get destino
     *
     * @return \Proyecto2Bundle\Entity\Ciudad
     */
    public function getDestino()
    {
        return $this->destino;
    }

    /**
     * Set idTipo
     *
     * @param \Proyecto2Bundle\Entity\Tipo $idTipo
     *
     * @return Vuelo
     */
    public function setIdTipo(\Proyecto2Bundle\Entity\Tipo $idTipo = null)
    {
        $this->idTipo = $idTipo;

        return $this;
    }

    /**
     * Get idTipo
     *
     * @return \Proyecto2Bundle\Entity\Tipo
     */
    public function getIdTipo()
    {
        return $this->idTipo;
    }
}
