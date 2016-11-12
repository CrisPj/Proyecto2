<?php

namespace Proyecto2Bundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('Proyecto2Bundle:Default:index.html.twig');
    }

    public function hotelAction()
    {
        return $this->render('Proyecto2Bundle:Default:form2.html.twig');
    }

    public function vueloAction()
    {
        return $this->render('Proyecto2Bundle:Default:form.html.twig');
    }
    public function busquedaVueloAction(Request $request)
    {
        $fecha = $request->request->get("fecha");
        $hora = $request->request->get("hora");
        $origen = $request->request->get("origen");
        $destino = $request->request->get("destino");
        $tipo = $request->request->get("clase");
//
        $datetime = new \DateTime($fecha);
       $hora = new \DateTime($hora);
        $em = $this->getDoctrine()->getManager();
        $tipo = $em->getRepository('Proyecto2Bundle:Tipo')->findOneBy(array('tipo'=> $tipo))->getIdTipo();
        $origen = $em->getRepository('Proyecto2Bundle:Ciudad')->findOneBy(array('ciudad'=> $origen))->getIdCiudad();
        $destino = $em->getRepository('Proyecto2Bundle:Ciudad')->findOneBy(array('ciudad'=> $destino))->getIdCiudad();
        $conn = $this->getDoctrine()->getManager()->getConnection();
        $sql = "SELECT c.id_vuelo FROM vuelo c WHERE c.origen = ".$origen." and c.destino = ".$destino ."
             and c.id_tipo = " .$tipo . " and c.fecha ='". $datetime->format('Y-m-d') ."' and extract(hour from c.hora) ='". $hora->format('h')."';";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $hoteles = $stmt->fetchAll();
        $vuelos = array();
        foreach ($hoteles as $hotel)
        {
            $vuelos[] = $em->getRepository('Proyecto2Bundle:Vuelo')->findOneBy(array('idVuelo' => $hotel));
        }
        return $this->render('@Proyecto2/Default/result.html.twig',array(
            'vuelos' => $vuelos));
    }
}
