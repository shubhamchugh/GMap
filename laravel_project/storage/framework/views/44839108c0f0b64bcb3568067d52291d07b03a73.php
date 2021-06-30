<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row justify-content-between">
        <div class="col-9">
            <h1 class="h3 mb-2 text-gray-800"><?php echo e(__('importer_csv.import-listing-index')); ?></h1>
            <p class="mb-4"><?php echo e(__('importer_csv.import-listing-index-desc')); ?></p>
        </div>
        <div class="col-3 text-right">
        </div>
    </div>

    <!-- Content Row -->
    <div class="row bg-white pt-4 pl-3 pr-3 pb-4">
        <div class="col-12">

            <div class="row border-left-info bg-light pt-3">
                <div class="col-12">

                    <form class="" action="<?php echo e(route('admin.importer.item.data.index')); ?>" method="GET">
                        <div class="row form-group">
                            <div class="col-12">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="import_item_data_process_status[]" id="import_item_data_process_status_not_processed" value="<?php echo e(\App\ImportItemData::PROCESS_STATUS_NOT_PROCESSED); ?>" <?php echo e(in_array(\App\ImportItemData::PROCESS_STATUS_NOT_PROCESSED, $import_item_data_process_status) ? 'checked' : ''); ?>>
                                    <label class="form-check-label" for="import_item_data_process_status_not_processed"><?php echo e(__('importer_csv.import-listing-status-not-processed')); ?></label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="import_item_data_process_status[]" id="import_item_data_process_status_success_processed" value="<?php echo e(\App\ImportItemData::PROCESS_STATUS_PROCESSED_SUCCESS); ?>" <?php echo e(in_array(\App\ImportItemData::PROCESS_STATUS_PROCESSED_SUCCESS, $import_item_data_process_status) ? 'checked' : ''); ?>>
                                    <label class="form-check-label" for="import_item_data_process_status_success_processed"><?php echo e(__('importer_csv.import-listing-status-success')); ?></label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="import_item_data_process_status[]" id="import_item_data_process_status_error_processed" value="<?php echo e(\App\ImportItemData::PROCESS_STATUS_PROCESSED_ERROR); ?>" <?php echo e(in_array(\App\ImportItemData::PROCESS_STATUS_PROCESSED_ERROR, $import_item_data_process_status) ? 'checked' : ''); ?>>
                                    <label class="form-check-label" for="import_item_data_process_status_error_processed"><?php echo e(__('importer_csv.import-listing-status-error')); ?></label>
                                </div>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-12 col-md-4">
                                <select class="custom-select" name="selected_import_item_data_markup">
                                    <option value="" <?php echo e(empty($selected_import_item_data_markup) ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-markup-all')); ?></option>
                                    <?php $__currentLoopData = $all_import_item_data_markup; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $all_import_item_data_markup_key => $import_item_data_markup): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($import_item_data_markup->import_item_data_markup); ?>" <?php echo e($selected_import_item_data_markup == $import_item_data_markup->import_item_data_markup ? 'selected' : ''); ?>><?php echo e($import_item_data_markup->import_item_data_markup); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>

                            <div class="col-12 col-md-4">
                                <select class="custom-select" name="order_by">
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_NEWEST_PROCESSED); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_NEWEST_PROCESSED ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-newest-processed')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_OLDEST_PROCESSED); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_OLDEST_PROCESSED ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-oldest-processed')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_NEWEST_PARSED); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_NEWEST_PARSED ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-newest-parsed')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_OLDEST_PARSED); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_OLDEST_PARSED ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-oldest-parsed')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_TITLE_A_Z); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_TITLE_A_Z ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-title-a-z')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_TITLE_Z_A); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_TITLE_Z_A ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-title-z-a')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_CITY_A_Z); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_CITY_A_Z ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-city-a-z')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_CITY_Z_A); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_CITY_Z_A ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-city-z-a')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_STATE_A_Z); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_STATE_A_Z ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-state-a-z')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_STATE_Z_A); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_STATE_Z_A ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-state-z-a')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_COUNTRY_A_Z); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_COUNTRY_A_Z ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-country-a-z')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::ORDER_BY_ITEM_COUNTRY_Z_A); ?>" <?php echo e($order_by == \App\ImportItemData::ORDER_BY_ITEM_COUNTRY_Z_A ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-order-country-z-a')); ?></option>
                                </select>
                            </div>

                            <div class="col-12 col-md-4">
                                <select class="custom-select" name="count_per_page">
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_10); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_10 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-10')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_25); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_25 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-25')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_50); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_50 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-50')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_100); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_100 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-100')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_250); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_250 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-250')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_500); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_500 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-500')); ?></option>
                                    <option value="<?php echo e(\App\ImportItemData::COUNT_PER_PAGE_1000); ?>" <?php echo e($count_per_page == \App\ImportItemData::COUNT_PER_PAGE_1000 ? 'selected' : ''); ?>><?php echo e(__('importer_csv.import-listing-per-page-1000')); ?></option>
                                </select>
                            </div>

                        </div>

                        <div class="row form-group">
                            <div class="col-12 text-right">
                                <button type="submit" class="btn btn-primary mr-2"><?php echo e(__('backend.shared.update')); ?></button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <div class="row pt-4">
                <div class="col-12 text-right">
                    <?php echo e($all_import_item_data_count . ' ' . __('category_description.records')); ?>

                </div>
            </div>

            <hr class="mt-1">

            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th><?php echo e(__('importer_csv.select')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-markup')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-title')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-city')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-state')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-country')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-status')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th><?php echo e(__('importer_csv.select')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-markup')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-title')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-city')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-state')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-country')); ?></th>
                                <th><?php echo e(__('importer_csv.import-listing-status')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <?php $__currentLoopData = $all_import_item_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $all_import_item_data_key => $import_item_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <?php if($import_item_data->import_item_data_process_status != \App\ImportItemData::PROCESS_STATUS_PROCESSED_SUCCESS): ?>
                                                <input class="form-check-input import_item_data_checkbox" type="checkbox" id="import_item_data_checkbox_<?php echo e($import_item_data->id); ?>" value="<?php echo e($import_item_data->id); ?>">
                                            <?php endif; ?>
                                        </div>
                                    </td>
                                    <td><?php echo e($import_item_data->import_item_data_markup); ?></td>
                                    <td><?php echo e($import_item_data->import_item_data_item_title); ?></td>
                                    <td><?php echo e($import_item_data->import_item_data_city); ?></td>
                                    <td><?php echo e($import_item_data->import_item_data_state); ?></td>
                                    <td><?php echo e($import_item_data->import_item_data_country); ?></td>
                                    <td>
                                        <?php if($import_item_data->import_item_data_process_status == \App\ImportItemData::PROCESS_STATUS_NOT_PROCESSED): ?>
                                            <span class="text-warning"><?php echo e(__('importer_csv.import-listing-status-not-processed')); ?></span>
                                        <?php elseif($import_item_data->import_item_data_process_status == \App\ImportItemData::PROCESS_STATUS_PROCESSED_SUCCESS): ?>
                                            <span class="text-success"><?php echo e(__('importer_csv.import-listing-status-success')); ?></span>
                                        <?php elseif($import_item_data->import_item_data_process_status == \App\ImportItemData::PROCESS_STATUS_PROCESSED_ERROR): ?>
                                            <span class="text-danger"><?php echo e(__('importer_csv.import-listing-status-error')); ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <a target="_blank" href="<?php echo e(route('admin.importer.item.data.edit', ['import_item_data' => $import_item_data->id])); ?>" class="btn btn-sm btn-primary">
                                            <?php echo e(__('importer_csv.import-listing-detail')); ?>

                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <hr class="mb-1">

            <div class="row">
                <div class="col-12 text-right">
                    <?php echo e($all_import_item_data_count . ' ' . __('category_description.records')); ?>

                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12">
                    <button id="select_all_button" class="btn btn-sm btn-primary rounded text-white">
                        <i class="far fa-check-square"></i>
                        <?php echo e(__('importer_csv.import-listing-select-all')); ?>

                    </button>
                    <button id="un_select_all_button" class="btn btn-sm btn-primary rounded text-white">
                        <i class="far fa-square"></i>
                        <?php echo e(__('importer_csv.import-listing-un-select-all')); ?>

                    </button>
                    <button id="import_selected_button" class="btn btn-sm btn-info rounded text-white">
                        <i class="fas fa-hourglass-start"></i>
                        <?php echo e(__('importer_csv.import-listing-selected-button')); ?>

                    </button>
                    <button id="delete_selected_button" class="btn btn-sm btn-danger rounded text-white">
                        <i class="far fa-trash-alt"></i>
                        <?php echo e(__('importer_csv.import-listing-delete-selected')); ?>

                    </button>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12">
                    <span class="text-danger" id="span_delete_selected_error"></span>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12">
                    <?php echo e($all_import_item_data->appends(['import_item_data_process_status' => $import_item_data_process_status, 'order_by' => $order_by])->links()); ?>

                </div>
            </div>

            <hr>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="errorNotifyModal" tabindex="-1" role="dialog" aria-labelledby="errorNotifyModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('importer_csv.error-notify-modal-close-title')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert">
                        <span id="span_error_notify_modal"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('importer_csv.error-notify-modal-close')); ?></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Import Selected Modal -->
    <div class="modal fade" id="import_selected_modal" tabindex="-1" role="dialog" aria-labelledby="import_selected_modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('importer_csv.import-listing-selected-modal-title')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row border-left-info">
                        <div class="col-12">

                            <div class="row mb-3">
                                <div class="col-12">
                                    <span class="text-gray-800 text-lg"><?php echo e(__('importer_csv.choose-import-listing-preference-selected')); ?>:</span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12">
                                    <span id="span_import_listing_modal_error" class="text-danger"></span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12">
                                    <?php echo e(__('importer_csv.choose-import-listing-categories')); ?>:
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12">
                                    <?php $__currentLoopData = $all_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $all_categories_key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input available_category" type="checkbox" id="category_<?php echo e($category['category_id']); ?>" value="<?php echo e($category['category_id']); ?>">
                                            <label class="form-check-label" for="category_<?php echo e($category['category_id']); ?>"><?php echo e($category['category_name']); ?></label>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php $__errorArgs = ['category'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="invalid-tooltip">
                                        <strong><?php echo e($message); ?></strong>
                                    </span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12 col-md-6">
                                    <label for="user_id" class="text-black"><?php echo e(__('importer_csv.choose-import-listing-owner')); ?></label>
                                    <select id="user_id" class="custom-select <?php $__errorArgs = ['user_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="user_id">

                                        <option value="<?php echo e($admin_user->id); ?>"><?php echo e(__('products.myself')); ?></option>
                                        <option value="<?php echo e(\App\ImportItemData::IMPORT_RANDOM_USER); ?>"><?php echo e(__('theme_directory_hub.importer.random-user')); ?></option>

                                        <?php $__currentLoopData = $all_users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($user->id); ?>"><?php echo e($user->name . ' (' . $user->email . ')'); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                    <?php $__errorArgs = ['user_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="invalid-tooltip">
                                        <strong><?php echo e($message); ?></strong>
                                    </span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                                <div class="col-12 col-md-6">
                                    <label for="item_type" class="text-black"><?php echo e(__('theme_directory_hub.online-listing.listing-type')); ?></label>
                                    <select id="item_type" class="custom-select <?php $__errorArgs = ['item_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_type">

                                        <option value="<?php echo e(\App\Item::ITEM_TYPE_REGULAR); ?>"><?php echo e(__('theme_directory_hub.online-listing.regular-listing')); ?></option>
                                        <option value="<?php echo e(\App\Item::ITEM_TYPE_ONLINE); ?>"><?php echo e(__('theme_directory_hub.online-listing.online-listing')); ?></option>

                                    </select>
                                    <?php $__errorArgs = ['item_type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="invalid-tooltip">
                                        <strong><?php echo e($message); ?></strong>
                                    </span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                            </div>

                            <div class="row mb-3">
                                <div class="col-12 col-md-6">
                                    <label for="item_status" class="text-black"><?php echo e(__('importer_csv.choose-import-listing-status')); ?></label>
                                    <select id="item_status" class="custom-select <?php $__errorArgs = ['item_status'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_status">
                                        <option value="<?php echo e(\App\Item::ITEM_SUBMITTED); ?>"><?php echo e(__('backend.item.submitted')); ?></option>
                                        <option value="<?php echo e(\App\Item::ITEM_PUBLISHED); ?>"><?php echo e(__('backend.item.published')); ?></option>
                                        <option value="<?php echo e(\App\Item::ITEM_SUSPENDED); ?>"><?php echo e(__('backend.item.suspended')); ?></option>
                                    </select>
                                    <?php $__errorArgs = ['item_status'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="invalid-tooltip">
                                        <strong><?php echo e($message); ?></strong>
                                    </span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="item_featured" class="text-black"><?php echo e(__('importer_csv.choose-import-listing-featured')); ?></label>
                                    <select id="item_featured" class="custom-select <?php $__errorArgs = ['item_featured'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_featured">
                                        <option value="<?php echo e(\App\Item::ITEM_NOT_FEATURED); ?>"><?php echo e(__('backend.shared.no')); ?></option>
                                        <option value="<?php echo e(\App\Item::ITEM_FEATURED); ?>"><?php echo e(__('backend.shared.yes')); ?></option>
                                    </select>
                                    <?php $__errorArgs = ['item_featured'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="invalid-tooltip">
                                        <strong><?php echo e($message); ?></strong>
                                    </span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12 text-right">
                                    <button class="btn btn-info text-white" id="start_import_selected_button">
                                        <?php echo e(__('importer_csv.import-listing-selected-button')); ?>

                                    </button>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <div class="progress">
                                        <div id="div_import_progress_bar" class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-center">

                                    <div class="alert alert-info" role="alert">
                                        <span id="import_listing_selected_total_count">0</span>
                                        <span><?php echo e(__('importer_csv.import-listing-selected-total')); ?></span>
                                        (
                                        <span class="text-success" id="import_listing_selected_success_count">0</span>
                                        <span class="text-success"><?php echo e(__('importer_csv.import-listing-selected-success')); ?></span>
                                        /
                                        <span class="text-danger" id="import_listing_selected_error_count">0</span>
                                        <span class="text-danger"><?php echo e(__('importer_csv.import-listing-selected-error')); ?></span>
                                        )
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('importer_csv.error-notify-modal-close')); ?></button>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <script>

        $(document).ready(function() {

            /**
             * Start select all button
             */
            $('#select_all_button').on('click', function () {

                $(".import_item_data_checkbox").each(function (index) {
                    $(this).prop('checked', true);
                });

            });
            /**
             * End select all button
             */

            /**
             * Start un-select all button
             */
            $('#un_select_all_button').on('click', function () {

                $(".import_item_data_checkbox").each(function (index) {
                    $(this).prop('checked', false);
                });

            });
            /**
             * End un-select all button
             */

            /**
             * Start import selected button
             */
            $('#import_selected_button').on('click', function () {

                var selected_import_listing_count = $(".import_item_data_checkbox:checked").length;

                if(selected_import_listing_count === 0)
                {
                    $("#span_error_notify_modal").text('<?php echo e(__('importer_csv.alert.import-process-no-listing-selected')); ?>');
                    $("#errorNotifyModal").modal('show');
                }
                else
                {
                    $("#import_listing_selected_total_count").text(selected_import_listing_count);
                    $("#import_selected_modal").modal('show');
                }
            });
            /**
             * End import selected button
             */

            /**
             * Start delete selected button
             */
            $('#delete_selected_button').on('click', function () {

                var selected_import_listing_count = $(".import_item_data_checkbox:checked").length;

                if(selected_import_listing_count === 0)
                {
                    $("#span_error_notify_modal").text('<?php echo e(__('importer_csv.alert.delete-import-listing-process-no-listing-selected')); ?>');
                    $("#errorNotifyModal").modal('show');
                }
                else
                {
                    $("#select_all_button").attr("disabled", true);
                    $("#un_select_all_button").attr("disabled", true);
                    $("#import_selected_button").attr("disabled", true);
                    $("#delete_selected_button").attr("disabled", true);
                    $("#delete_selected_button").text("<?php echo e(__('importer_csv.import-listing-delete-progress')); ?>");

                    var delete_selected_import_listing_progress = 0;


                    $(".import_item_data_checkbox:checked").each(function (index) {

                        var selected_import_listing_elm = $(this);

                        setTimeout(function() {

                            var selected_import_listing_id = selected_import_listing_elm.val();

                            var ajax_url = '/admin/importer/item/data/' + selected_import_listing_id + '/destroy-ajax';

                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                }
                            });
                            jQuery.ajax({
                                url: ajax_url,
                                method: 'post',
                                data: {
                                },
                                success: function(result){
                                    console.log(result);

                                    delete_selected_import_listing_progress += 1;

                                    $("#delete_selected_button").text("<?php echo e(__('importer_csv.import-listing-delete-progress')); ?>" + " " + delete_selected_import_listing_progress + " " + "<?php echo e(__('importer_csv.import-listing-delete-progress-deleted')); ?>");

                                    if(delete_selected_import_listing_progress === selected_import_listing_count)
                                    {
                                        $("#delete_selected_button").text("<?php echo e(__('importer_csv.import-listing-delete-complete')); ?>");
                                        location.reload();
                                    }

                                },
                                error: function(xhr){
                                    console.log("an error occured: " + xhr.status + " " + xhr.statusText);

                                    $("#span_delete_selected_error").text("<?php echo e(__('importer_csv.import-listing-delete-error')); ?>");
                                }
                            }); // end ajax

                        }, 2000); // end setTimeout

                    }); // end .import_item_data_checkbox:checked loop
                }
            });
            /**
             * End delete selected button
             */

            $('#start_import_selected_button').on('click', function () {

                /**
                 * Start selected listing import process
                 */
                $("#start_import_selected_button").attr("disabled", true);

                var selected_import_listing_count = $(".import_item_data_checkbox:checked").length;
                var success_import_listing_count = 0;
                var error_import_listing_count = 0;
                var selected_import_listing_progress = 0;

                $("#import_listing_selected_total_count").text(selected_import_listing_count);

                var selected_categories = [];

                $(".available_category:checked").each(function (index) {
                    selected_categories.push($(this).val());
                });

                if(selected_categories.length === 0)
                {
                    $("#span_import_listing_modal_error").text('<?php echo e(__('importer_csv.alert.import-process-no-categories-selected')); ?>');
                    $("#start_import_selected_button").attr("disabled", false);
                    return false;
                }
                else
                {
                    $('#start_import_selected_button').text('<?php echo e(__('importer_csv.import-listing-import-button-progress')); ?>');
                    $('#div_import_progress_bar').text('<?php echo e(__('importer_csv.alert.import-listing-process-in-progress')); ?>');
                    $("#span_import_listing_modal_error").text('');
                }

                var selected_user_id = $("#user_id").val();
                var selected_item_type = $("#item_type").val();
                var selected_item_status = $("#item_status").val();
                var selected_item_featured = $("#item_featured").val();

                $(".import_item_data_checkbox:checked").each(function (index) {

                    var selected_import_listing_elm = $(this);

                    setTimeout(function() {

                        var selected_import_listing_id = selected_import_listing_elm.val();

                        var ajax_url = '/admin/importer/item/data/' + selected_import_listing_id + '/import-ajax';

                        $.ajaxSetup({
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            }
                        });
                        jQuery.ajax({
                            url: ajax_url,
                            method: 'post',
                            data: {
                                'user_id' : selected_user_id,
                                'category' : selected_categories,
                                'item_type' : selected_item_type,
                                'item_status' : selected_item_status,
                                'item_featured' : selected_item_featured,
                            },
                            success: function(result){

                                selected_import_listing_progress += 1;

                                if(result.status == <?php echo e(\App\ImportItemData::PROCESS_STATUS_PROCESSED_SUCCESS); ?>)
                                {
                                    success_import_listing_count += 1;
                                }
                                if(result.status == <?php echo e(\App\ImportItemData::PROCESS_STATUS_PROCESSED_ERROR); ?>)
                                {
                                    error_import_listing_count += 1;
                                }

                                $("#import_listing_selected_success_count").text(success_import_listing_count);
                                $("#import_listing_selected_error_count").text(error_import_listing_count);

                                var progress_percentage = selected_import_listing_progress/selected_import_listing_count * 100;

                                $('#div_import_progress_bar').attr("aria-valuenow", progress_percentage);
                                $('#div_import_progress_bar').attr("style", "width: " + progress_percentage + "%;");

                                if(selected_import_listing_progress === selected_import_listing_count)
                                {
                                    $('#start_import_selected_button').text('<?php echo e(__('importer_csv.import-listing-import-button-complete')); ?>');
                                    $('#div_import_progress_bar').text('<?php echo e(__('importer_csv.alert.import-process-completed')); ?>');
                                }

                            },
                            error: function(xhr){
                                console.log("an error occured: " + xhr.status + " " + xhr.statusText);

                                $("#span_import_listing_modal_error").text("<?php echo e(__('importer_csv.import-listing-import-button-error')); ?>");
                            }
                        }); // end ajax

                    }, 2000); // end setTimeout

                }); // end .import_item_data_checkbox:checked each
                /**
                 * End selected listing import process
                 */

            }); // end import_selected button click event

        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/googlemap/laravel_project/resources/views/backend/admin/importer/item/index.blade.php ENDPATH**/ ?>