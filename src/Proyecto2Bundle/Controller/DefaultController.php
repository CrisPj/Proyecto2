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
        return $this->render('Proyecto2Bundle:Default:index2.html.twig');
    }

    public function busquedaVueloAction(Request $request)
    {
        $fecha = $request->request->get("fecha");
        $hora = $request->request->get("hora");
        $origen = $request->request->get("origen");
        $destino = $request->request->get("destino");
        $tipo = $request->request->get("tipo");

        $datetime = new \DateTime($fecha);
        $em = $this->getDoctrine()->getManager();
        $hoteles = $em->getRepository('Proyecto2Bundle:Vuelo')->findBy(

            array('fecha' => $datetime,'hora' => $hora,'origen' => $origen,'destino' => $destino,'idTipo' => $tipo)
            );

        var_dump($hoteles);
        die();

        $request->query->get('name');
        $ciudades = $em->getRepository('Proyecto2Bundle:Ciudad')->f;
        return $this->render('@Proyecto2/Default/result.html.twig');
        die("perro");

    }}
