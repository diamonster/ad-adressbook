<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Адресная книга "Рога и Копыта"</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>
  <style type="text/css">
    div.container {
        width: 95%;
      }
    div#addressbook_filter {
        float: left;
        text-align: left;
      }
  </style>
  <script>
    $(document).ready(function() {
        var table = $('#addressbook').DataTable( {
          paging: false,
          fixedHeader: {
             header: true,
             footer: false
           },
          language: {
             info: "Показано _END_ записей",
             infoFiltered: "(отфильтровано из _MAX_ записей)",
             search: "Поиск: "
           }
        } );
    } );
  </script>
</head>
 
<body>
  <div class="container">
    <div class="table-responsive">
        <table class="display" id="addressbook" cellspacing="0" width="100%">
          <thead>
            <tr><th>ФИО</th><th>Телефон</th><th>добавочный</th><th>e-mail</th><th>Должность</th><th>Отдел</th><th>Кабинет</th></tr>
          </thead>
          <tbody>
__content__
          </tbody>
        </table>
    </div>
  </div>
</body>
</html>
