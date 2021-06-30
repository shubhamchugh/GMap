<?php $__env->startSection('styles'); ?>
    <!-- Custom styles for this page -->
    <link href="<?php echo e(asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row justify-content-between">
        <div class="col-9">
            <h1 class="h3 mb-2 text-gray-800"><?php echo e(__('backend.custom-field.custom-field')); ?></h1>
            <p class="mb-4"><?php echo e(__('backend.custom-field.custom-field-desc')); ?></p>
        </div>
        <div class="col-3 text-right">
            <a href="<?php echo e(route('admin.custom-fields.create')); ?>" class="btn btn-info btn-icon-split">
                <span class="icon text-white-50">
                  <i class="fas fa-plus"></i>
                </span>
                <span class="text"><?php echo e(__('backend.custom-field.add-custom-field')); ?></span>
            </a>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row bg-white pt-4 pl-3 pr-3 pb-4">
        <div class="col-12">

            <div class="row mb-4">
                <div class="col-12">
                    <div class="row mb-2">
                        <div class="col-12"><span class="text-lg"><?php echo e(__('backend.shared.data-filter')); ?></span></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-12">
                            <form class="form-inline" action="<?php echo e(route('admin.custom-fields.index')); ?>" method="GET">
                                <div class="form-group mr-2">
                                    <select class="custom-select" name="category">
                                        <option value="0"><?php echo e(__('backend.custom-field.select-category')); ?></option>
                                        <?php $__currentLoopData = $all_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($category['category_id']); ?>" <?php echo e($category['category_id'] == $category_id ? 'selected' : ''); ?>><?php echo e($category['category_name']); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary mr-2"><?php echo e(__('backend.shared.update')); ?></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th><?php echo e(__('backend.custom-field.id')); ?></th>
                                <th><?php echo e(__('backend.custom-field.name')); ?></th>
                                <th><?php echo e(__('backend.custom-field.type')); ?></th>
                                <th><?php echo e(__('backend.custom-field.seed-value')); ?></th>
                                <th><?php echo e(__('backend.custom-field.order')); ?></th>
                                <th><?php echo e(__('backend.category.category')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th><?php echo e(__('backend.custom-field.id')); ?></th>
                                <th><?php echo e(__('backend.custom-field.name')); ?></th>
                                <th><?php echo e(__('backend.custom-field.type')); ?></th>
                                <th><?php echo e(__('backend.custom-field.seed-value')); ?></th>
                                <th><?php echo e(__('backend.custom-field.order')); ?></th>
                                <th><?php echo e(__('backend.category.category')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <?php $__currentLoopData = $all_custom_fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $custom_field): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($custom_field->id); ?></td>
                                    <td><?php echo e($custom_field->custom_field_name); ?></td>
                                    <td>
                                        <?php if($custom_field->custom_field_type == \App\CustomField::TYPE_TEXT): ?>
                                            <?php echo e(__('backend.custom-field.text')); ?>

                                        <?php elseif($custom_field->custom_field_type == \App\CustomField::TYPE_SELECT): ?>
                                            <?php echo e(__('backend.custom-field.select')); ?>

                                        <?php elseif($custom_field->custom_field_type == \App\CustomField::TYPE_MULTI_SELECT): ?>
                                            <?php echo e(__('backend.custom-field.multi-select')); ?>

                                        <?php elseif($custom_field->custom_field_type == \App\CustomField::TYPE_LINK): ?>
                                            <?php echo e(__('backend.custom-field.link')); ?>

                                        <?php endif; ?>
                                    </td>
                                    <td><?php echo e($custom_field->custom_field_seed_value); ?></td>
                                    <td><?php echo e($custom_field->custom_field_order); ?></td>
                                    <td>
                                        <?php
                                            $custom_field_categories = $custom_field->allCategories()->get();
                                        ?>

                                        <?php $__currentLoopData = $custom_field_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $custom_field_categories_key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <?php if($custom_field_categories->count() == $custom_field_categories_key + 1): ?>
                                                <?php echo e($category->category_name); ?>

                                            <?php else: ?>
                                                <?php echo e($category->category_name . ", "); ?>

                                            <?php endif; ?>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </td>
                                    <td>
                                        <a href="<?php echo e(route('admin.custom-fields.edit', $custom_field->id)); ?>" class="btn btn-primary btn-circle">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <!-- Page level plugins -->
    <script src="<?php echo e(asset('backend/vendor/datatables/jquery.dataTables.min.js')); ?>"></script>
    <script src="<?php echo e(asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')); ?>"></script>
    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/googlemap/laravel_project/resources/views/backend/admin/custom-field/index.blade.php ENDPATH**/ ?>