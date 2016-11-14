<?php

namespace Proyecto2Bundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('Proyecto2Bundle:Default:index.html.twig');
    }

    public function listoAction(Request $request)
    {
        $request->getSession()->remove('carro');
    }

    public function pagaAction(Request $request)
    {
        $carro = $request->getSession()->get('carro');
        $carro = array_unique($carro);
        $total = 0;
        foreach ($carro as $id)
        {
            $total =  $this->getDoctrine()->getRepository('Proyecto2Bundle:Vuelo')->find($id)->getPrecio();
        }
        return $this->render('Proyecto2Bundle:Default:cobro.html.twig',array('total'=>$total));
    }

    public function reserAction(Request $request)
    {
        $id = $request->request->get('id');
        $session = $request->getSession();
        if ($session && $id)
        {
            $carritos = $session->get('carro');
            if (!$carritos)
            {
                $carritos= array();
            }
            array_push($carritos,intval($id));
            $session->set('carro',$carritos);
            return new Response('Bien');
        }
        return new Response('Mal');
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
        $tipo = $em->getRepository('Proyecto2Bundle:Tipo')->findOneBy(array('tipo' => $tipo))->getIdTipo();
        $origen = $em->getRepository('Proyecto2Bundle:Ciudad')->findOneBy(array('ciudad' => $origen))->getIdCiudad();
        $destino = $em->getRepository('Proyecto2Bundle:Ciudad')->findOneBy(array('ciudad' => $destino))->getIdCiudad();
        $conn = $this->getDoctrine()->getManager()->getConnection();
        if ($request->request->get("hotel") && $request->request->get("cantidad")) {
            $hotel = $request->request->get("hotel");
            $cantidad = $request->request->get("cantidad");
            $sql = "SELECT c.id_vuelo FROM vuelo c join hotel h on c.destino = h.id_ciudad  WHERE c.origen = " . $origen . " and c.destino = " . $destino . "
             and h.id_ciudad = " . $hotel . " and c.id_tipo = " . $tipo . " and c.fecha ='" . $datetime->format('Y-m-d') . "' and extract(hour from c.hora) ='" . $hora->format('h') . "' group by 1;";
        } else {
            $sql = "SELECT c.id_vuelo FROM vuelo c WHERE c.origen = " . $origen . " and c.destino = " . $destino . "
             and c.id_tipo = " . $tipo . " and c.fecha ='" . $datetime->format('Y-m-d') . "' and extract(hour from c.hora) ='" . $hora->format('h') . "';";
        }
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $hoteles = $stmt->fetchAll();
        $vuelos = array();
        foreach ($hoteles as $hot) {
            $vuelos[] = $em->getRepository('Proyecto2Bundle:Vuelo')->findOneBy(array('idVuelo' => $hot));
        }
        if ($request->request->get("hotel"))
        {
            $hotel = $em->getRepository('Proyecto2Bundle:Hotel')->findOneBy(array('idHotel' => $hotel))->getHotel();

            return $this->render('@Proyecto2/Default/result.html.twig', array(
                'vuelos' => $vuelos,'hotel'=>$hotel));
        }
        return $this->render('@Proyecto2/Default/result.html.twig', array(
            'vuelos' => $vuelos,'hotel'=>false));
    }
}