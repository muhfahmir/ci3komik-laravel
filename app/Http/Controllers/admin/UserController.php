<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $user;
    public function __construct()
    {
        if(!Auth::check()) 
        {
            return redirect()->route('login');
        }
    }
    public function index()
    {
        $users = User::all();
        // return base_path();
        return view('pages.admin.user.userPage', compact(['users']));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('pages.admin.user.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required_with:password_confirmation|same:password_confirmation|min:4',
            'password_confirmation' => 'required',
        ];
        try {
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect('user/create')
                    ->withErrors($validator)
                    ->withInput();
            }
    
            DB::beginTransaction();
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = $request->password;
            $user->is_active = $request->status || 0 ;
            $user->save();
            DB::commit();
            
             return redirect()->route('user')->with('status', "Berhasil menambahkan user");
        }catch (Exception $e) {
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
        $user = User::find($id);
        return view('pages.admin.user.edit',compact('user'));
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
        $rules = [
            'name' => 'required',
            'email' => 'required|email',
        ];
        try {
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect('user')->with('status-danger','Gagal Update User');
            }
    
            $user = User::find($id);
            
            DB::beginTransaction();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->save();
            DB::commit();
            return redirect('user')->with('status',"Berhasil mengupdate User");
        } catch (Exception $e) {
            return $e->getMessage();
        }
       
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $genre = User::find($id);
            $genre->delete();
            return redirect()->route('user')->with('status','Berhasil menghapus user');
        } catch (Exception $e) {
            return $e->getMessage();
        }
        
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('login')->with('logout',"Anda Berhasil Logout");
    }
}
