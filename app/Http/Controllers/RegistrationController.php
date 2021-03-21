<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class RegistrationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('pages.auth.registerPage');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $rules = [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'required',
        ];
        // $validate = Validator::make($request->all(), $rules);

        // $this->validate(request(), [
        //     'name' => 'required',
        //     'email' => 'required|email',
        //     'password' => 'required'
        // ]);
        try {
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect('/register')
                    ->withErrors($validator)
                    ->withInput();
            }
    
            // $user = User::create(request(['name', 'email', 'password']));
            // Cara 1 insert
            // DB::beginTransaction();
            // $user = new User();
            // $user->name = $request->name;
            // $user->email = $request->email;
            // $user->password = $request->password;
            // $user->is_active = 0;
            // $user->save();
            // DB::commit();
    
            // Cara 2
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $request->password,
                'is_active' => 0,
            ]);
    
            // cara 3 
            // $user = DB::table('users')->insert(
            //     [
            //         'name' => $request->name,
            //         'email' => $request->email,
            //         'password' => $request->password,
            //         'is_active' => 0,
            //         'created_at' => time()
            //     ]
            // );
    
    
            return redirect()->route('login')->with('status','Anda berhasil mendaftarkan Akun');
        } catch (Exception $e) {
            return $e->getMessage();
        }
       
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
