<?php
function showCategories_slect($categories, $parent_id = 0, $char = '')
{
    foreach ($categories as $key => $item) {
        // Nếu là chuyên mục con thì hiển thị
        if ($item['product_id'] == $parent_id) {
            echo '<option value="' . $item->id . '">' . $char . $item->title . '</option>';

            // Xóa chuyên mục đã lặp
            unset($categories[$key]);

            // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
            showCategories_slect($categories, $item->id, $char . '---');
        }
    }
}



function showCategories($categories, $parent_id = 0, $char = '')
{
    static $t = 0;

    foreach ($categories as $key => $item) {
        
       
      
        // Nếu là chuyên mục con thì hiển thị
        if ($item['product_id'] == $parent_id) {
            // Tính toán số thứ tự của chuyên mục
$t++;
          
            echo '<tr>';
            echo '<th scope="row">' . $t . '</th>';
            echo '<td>' . $char . $item->title . '</td>';
            echo '<td>' . $item->slug . '</td>';
            echo '<td>
                <a href="' . route('Category.edit', $item->id) . '" class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-edit"></i></a>
                <a href="' . route('Category.delete', $item->id) . '" class="btn btn-danger btn-sm rounded-0 text-white delete_Page mb-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-trash"></i></a>
            </td>';
            echo '</tr>';

            // Xóa chuyên mục đã lặp
            unset($categories[$key]);

            // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
            showCategories($categories, $item->id, $char . '---');
        }
    }
}


function showCategories_post_slect($categories, $parent_id = 0, $char = '')
{
    foreach ($categories as $key => $item) {
        // Nếu là chuyên mục con thì hiển thị
        if ($item['parent_id'] == $parent_id) {
            echo '<option value="' . $item->id . '">' . $char . $item->title . '</option>';

            // Xóa chuyên mục đã lặp
            unset($categories[$key]);

            // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
            showCategories_post_slect($categories, $item->id, $char . '---');
        }
    }
}



function showCategories_post_list($categories, $parent_id = 0, $char = '')
{
    static $t = 0;

    foreach ($categories as $key => $item) {
        
       
      
        // Nếu là chuyên mục con thì hiển thị
        if ($item['parent_id'] == $parent_id) {
            // Tính toán số thứ tự của chuyên mục
$t++;
          
            echo '<tr>';
            echo '<th scope="row">' . $t . '</th>';
            echo '<td>' . $char . $item->title . '</td>';
            echo '<td>' . $item->slug . '</td>';
            echo '<td>
                <a href="' . route('Post_cat.edit', $item->id) . '" class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-edit"></i></a>
                <a href="' . route('Post_cat.delete', $item->id) . '" class="btn btn-danger btn-sm rounded-0 text-white delete_Page mb-0" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-trash"></i></a>
            </td>';
            echo '</tr>';

            // Xóa chuyên mục đã lặp
            unset($categories[$key]);

            // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
            showCategories_post_list($categories, $item->id, $char . '---');
        }
    }
}







