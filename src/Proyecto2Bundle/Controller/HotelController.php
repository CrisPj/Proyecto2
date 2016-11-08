<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Hotel;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;


/**
 * Hotel controller.
 *
 */
class HotelController extends Controller
{
    /**
     * Lists all hotel entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $hoteles = $em->getRepository('Proyecto2Bundle:Hotel')->findAll();

        $json = array();
        foreach ($hoteles as $hotel)
        {
            $json[] = array("hotel" => $hotel->getHotel()) ;
        }
        return new Response(json_encode($json,JSON_PRETTY_PRINT), 200,          ['Content-Type' => 'application/json']);
    }

    /**
     * Finds and displays a hotel entity.
     *
     */
    public function showAction(Hotel $hotel)
    {

        return $this->render('hotel/show.html.twig', array(
            'hotel' => $hotel,
        ));
    }
}
