<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Guru;

class GuruController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $gurus =  Guru::when($search, function($query, $search){
            $query->where('nama','like',"%{$search}%")
            ->orWhere('mapel','like',"%{$search}%");
        })->paginate(5)->withQueryString();
        return view('guru.index', compact('gurus'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('guru.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama'=>'required|string|min:3|max:225',
            'mapel'=>'required|string|max:100',
        ]);
        Guru::create($request->only(['nama','mapel']));
        return redirect()->route('guru.index')->with('success','Data guru berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Guru $guru)
    {
        return view('guru.edit',compact('guru'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Guru $guru)
    {
        $request->validate([
            'nama'=>'required|string|min:3|max:25',
            'mapel'=>'required|string|max:100',
        ]);
        $guru->update($request->only(['nama','mapel']));
        return redirect()->route('guru.index')
        ->with('success', 'Data guru berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Guru $guru)
    {
        $guru->delete();
        return redirect()->route('guru.index')
        ->with('success', 'Data guru berhasil dihapus');
    }
}
