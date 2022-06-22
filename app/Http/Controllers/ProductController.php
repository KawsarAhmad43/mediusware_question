<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Models\Variant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function index()
    {

        $products= Product::with('price')->paginate(2);
        return view('products.index', compact('products'));
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function create()
    {
        $variants = Variant::all();
        return view('products.create', compact('variants'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   




    public function store(Request $request)
    {
        Log::alert($request);
        $product = new Product([
            
            'id' => $request->input('id'),
            'title' => $request->input('title'),
            'sku' => $request->input('sku'),
            'description' => $request->input('description')
        ]);
        
        $product->save();




      $variant=  $request-> input('product_variant');
      Log::alert($variant);
    //   to save sub childes of 
      for($i=0;$i<count($variant);$i++){
        // product variant id

       Log::alert($variant[$i]);
           for($j=0;$j<count($variant[$i]['tags']);$j++){
                  $variant[$i]['tags'];

                  Log::alert($variant[$i]['tags'][$j]);

                  $data=new ProductVariant([
                    'variant'=>$variant[$i]['tags'][$j],
                    'variant_id'=>$variant[$i]['option'],
                    'product_id'=>$product->id,
                    ]);

                    $data->save();

             }
     
      }

        
        return response()->json('Product created!');
    }


    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $variants = Variant::all();
        return view('products.edit', compact('variants'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }
}
