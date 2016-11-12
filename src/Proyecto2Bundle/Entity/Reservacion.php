<?php

namespace Proyecto2Bundle\Entity;

/**
 * Reservacion
 */
class Reservacion
{
    /**
     * @var integer
     */
    private $idReservacion;

    /**
     * @var \Proyecto2Bundle\Entity\Cliente
     */
    private $idCliente;

    /**
     * @var \Proyecto2Bundle\Entity\Vuelo
     */
    private $idVuelo;

    /**
     * @var \Proyecto2Bundle\Entity\Hotel
     */
    private $idHotel;


    /**
     * Set idReservacion
     *
     * @param integer $idReservacion
     *
     * @return Reservacion
     */
    public function setIdReservacion($idReservacion)
    {
        $this->idReservacion = $idReservacion;

        return $this;
    }

    /**
     * Get idReservacion
     *
     * @return integer
     */
    public function getIdReservacion()
    {
        return $this->idReservacion;
    }

    /**
     * Set idCliente
     *
     * @param \Proyecto2Bundle\Entity\Cliente $idCliente
     *
     * @return Reservacion
     */
    public function setIdCliente(\Proyecto2Bundle\Entity\Cliente $idCliente)
    {
        $this->idCliente = $idCliente;

        return $this;
    }

    /**
     * Get idCliente
     *
     * @return \Proyecto2Bundle\Entity\Cliente
     */
    public function getIdCliente()
    {
        return $this->idCliente;
    }

    /**
     * Set idVuelo
     *
     * @param \Proyecto2Bundle\Entity\Vuelo $idVuelo
     *
     * @return Reservacion
     */
    public function setIdVuelo(\Proyecto2Bundle\Entity\Vuelo $idVuelo)
    {
        $this->idVuelo = $idVuelo;

        return $this;
    }

    /**
     * Get idVuelo
     *
     * @return \Proyecto2Bundle\Entity\Vuelo
     */
    public function getIdVuelo()
    {
        return $this->idVuelo;
    }

    /**
     * Set idHotel
     *
     * @param \Proyecto2Bundle\Entity\Hotel $idHotel
     *
     * @return Reservacion
     */
    public function setIdHotel(\Proyecto2Bundle\Entity\Hotel $idHotel = null)
    {
        $this->idHotel = $idHotel;

        return $this;
    }

    /**
     * Get idHotel
     *
     * @return \Proyecto2Bundle\Entity\Hotel
     */
    public function getIdHotel()
    {
        return $this->idHotel;
    }
    /**
     * @var integer
     */
    private $total;


    /**
     * Set total
     *
     * @param integer $total
     *
     * @return Reservacion
     */
    public function setTotal($total)
    {
        $this->total = $total;

        return $this;
    }

    /**
     * Get total
     *
     * @return integer
     */
    public function getTotal()
    {
        return $this->total;
    }
}
