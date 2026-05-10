<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Guru</title>
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet"
    >
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            padding: 40px;
            color: #1e293b;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
        }

        .btn-tambah {
            background: #2563eb;
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            text-decoration: none;
            transition: 0.3s;
            font-weight: 600;
        }

        .btn-tambah:hover {
            background: #1d4ed8;
        }

        .card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .search-input {
            width: 300px;
            max-width: 100%;
            padding: 12px 15px;
            border: 1px solid #dbeafe;
            border-radius: 10px;
            outline: none;
            transition: 0.3s;
            background: #f8fafc;
        }

        .search-input:focus {
            border-color: #2563eb;
            background: white;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 12px;
        }

        thead {
            background: #2563eb;
            color: white;
        }

        th,
        td {
            padding: 16px;
            text-align: center;
            vertical-align: middle;
        }

        tbody tr {
            border-bottom: 1px solid #e2e8f0;
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f8fafc;
        }

        .action {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .btn-edit {
            background: #facc15;
            color: black;
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-edit:hover {
            background: #eab308;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-delete:hover {
            background: #dc2626;
        }
        
        .pagination {
            margin-top: 30px;
        }

        .pagination .page-link {
            border: none;
            margin: 0 4px;
            border-radius: 10px;
            color: #2563eb;
            padding: 10px 16px;
            font-weight: 600;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .pagination .page-link:hover {
            background: #2563eb;
            color: white;
        }

        .pagination .active .page-link {
            background: #2563eb;
            color: white;
        }
        .pagination-wrapper nav > div:first-child {
            display: none;
        }

        .pagination-wrapper nav > div:last-child {
            width: 100%;
            display: flex;
            flex-direction: column-reverse;
            align-items: center;
            gap: 16px;
        }
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            .top-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .search-input {
                width: 100%;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            .header {
                flex-direction: column;
                align-items: stretch;
            }

            .btn-tambah {
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <div class="container">

        <div class="header">
            <h1 class="title">Daftar Guru</h1>

            <a href="{{ route('guru.create') }}" class="btn-tambah">
                + Tambah Guru
            </a>
        </div>

        @if(session('success'))
            <div class="success">
                {{ session('success') }}
            </div>
        @endif

        <div class="card">

            <div class="top-bar">
                <form action="{{ route('guru.index') }}" method="GET">
                    <input 
                        type="text" 
                        class="search-input"
                        name="search"
                        placeholder="Cari nama guru atau mapel..."
                        value="{{ request('search') }}"
                    >
                </form>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Mapel</th>
                        <th>Aksi</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($gurus as $index => $guru)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $guru->nama }}</td>
                        <td>{{ $guru->mapel }}</td>
                        <td>
                            <div class="action">

                                <a 
                                    href="{{ route('guru.edit', $guru->id) }}" 
                                    class="btn-edit"
                                >
                                    Edit
                                </a>

                                <form 
                                    action="{{ route('guru.destroy', $guru->id) }}"
                                    method="POST"
                                >
                                    @csrf
                                    @method('DELETE')

                                    <button 
                                        type="submit"
                                        class="btn-delete"
                                        onclick="return confirm('Yakin mau hapus?')"
                                    >
                                        Hapus
                                    </button>
                                </form>

                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

<div class="pagination-wrapper">
    {{ $gurus->links() }}
</div>

        </div>

    </div>

</body>
</html>