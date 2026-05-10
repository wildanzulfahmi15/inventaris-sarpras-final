<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Data Guru</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            width: 100%;
            max-width: 500px;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .title {
            text-align: center;
            margin-bottom: 30px;
            color: #1e293b;
            font-size: 32px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #334155;
        }

        .input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 12px;
            outline: none;
            transition: 0.3s;
            font-size: 15px;
            background: #f8fafc;
        }

        .input:focus {
            border-color: #2563eb;
            background: white;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        .back {
            display: inline-block;
            margin-top: 18px;
            text-decoration: none;
            color: #2563eb;
            font-weight: 600;
            transition: 0.3s;
        }

        .back:hover {
            color: #1d4ed8;
        }
    </style>
</head>
<body>

    <div class="card">

        <h1 class="title">Tambah Data Guru</h1>

        <form 
            action="{{ route('guru.store') }}"
            method="POST"
        >

            @csrf
            @method("POST")

            <div class="form-group">
                <label>Nama Guru</label>

                <input 
                    type="text" 
                    name="nama"
                    class="input"
                    placeholder="Masukkan nama guru"
                >
                @error('nama')
                    <small style="color:red;">
                        {{ $message }}
                    </small>
                @enderror
            </div>

            <div class="form-group">
                <label>Mata Pelajaran</label>

                <input 
                    type="text" 
                    name="mapel"
                    class="input"
                    placeholder="Masukkan mata pelajaran"
                >
            </div>

            <button type="submit" class="btn">
                Tambah Data
            </button>

        </form>

        <a href="{{ route('guru.index') }}" class="back">
            ← Kembali
        </a>

    </div>

</body>
</html>