<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Cupones;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


/**
 * Cupone controller.
 *
 */
class CuponesController extends Controller
{
    /**
     * Finds and displays a cupone entity.
     *
     */
    public function showAction(Request $request)
    {
        $ticket = $request->get('ticket');
        $cupon =$this->getDoctrine()->getRepository('Proyecto2Bundle:Cupones')->findOneBy(array('cupon' => $ticket,'estado'=> false));
        if ($cupon)
        {
            return new Response($cupon->getPorcentaje());
        }
        return Response::HTTP_INTERNAL_SERVER_ERROR;
    }
}
