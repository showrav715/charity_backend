<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Role;
use Illuminate\Http\Request;

class ManageRoleController extends Controller
{
    public function index()
    {
        $roles = Role::all();
        return view('admin.role.index', compact('roles'));
    }

    public function create()
    {
        return view('admin.role.create');
    }

    public function store(Request $request)
    {
        $this->storeData($request, new Role());
        return redirect()->route('admin.role.index')->with('success', 'Role created successfully.');
    }

    public function edit($id)
    {
        $role = Role::find($id);
        return view('admin.role.edit', compact('role'));
    }

    public function update(Request $request, $id)
    {
        $role = Role::find($id);
        $this->storeData($request, $role, $id);
        return redirect()->route('admin.role.index')->with('success', 'Role updated successfully.');
    }

    public function storeData($request, $role, $id = null)
    {
        $request->validate([
            'name' => 'required|unique:roles,name' . ($id ? ',' . $id : ''),
        ]);
        $role->name = $request->name;
        $role->section = json_encode($request->section, true);
        $role->save();
    }

    public function destroy(Request $request)
    {
        $role = Role::find($request->id);
        $admin = Admin::where('role', $role->name)->first();
        if ($admin) {
            return redirect()->route('admin.role.index')->with('error', 'Role is assigned to admin.');
        }

        $role->delete();
        return redirect()->route('admin.role.index')->with('success', 'Role deleted successfully.');
    }
}
