<?php $__env->startSection('styles'); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row justify-content-between">
        <div class="col-9">
            <h1 class="h3 mb-2 text-gray-800"><?php echo e(__('backend.city.city')); ?></h1>
            <p class="mb-4"><?php echo e(__('backend.city.city-desc')); ?></p>
        </div>
        <div class="col-3 text-right">
            <a href="<?php echo e(route('admin.cities.create')); ?>" class="btn btn-info btn-icon-split">
                <span class="icon text-white-50">
                  <i class="fas fa-plus"></i>
                </span>
                <span class="text"><?php echo e(__('backend.city.add-city')); ?></span>
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
                            <form class="form-inline" action="<?php echo e(route('admin.cities.index')); ?>" method="GET">
                                <div class="form-group mr-2">
                                    <select class="custom-select" name="state">
                                        <option value="0"><?php echo e(__('backend.city.select-state-city')); ?></option>
                                        <?php $__currentLoopData = $all_states; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $state): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($state->id); ?>" <?php echo e($state->id == $state_id ? 'selected' : ''); ?>><?php echo e($state->state_name . ', ' . $state->country->country_name); ?></option>
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
                                <th><?php echo e(__('backend.city.id')); ?></th>
                                <th><?php echo e(__('backend.city.name')); ?></th>
                                <th><?php echo e(__('backend.city.slug')); ?></th>
                                <th><?php echo e(__('backend.city.country')); ?></th>
                                <th><?php echo e(__('backend.city.state')); ?></th>
                                <th><?php echo e(__('backend.city.lat')); ?></th>
                                <th><?php echo e(__('backend.city.lng')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th><?php echo e(__('backend.city.id')); ?></th>
                                <th><?php echo e(__('backend.city.name')); ?></th>
                                <th><?php echo e(__('backend.city.slug')); ?></th>
                                <th><?php echo e(__('backend.city.country')); ?></th>
                                <th><?php echo e(__('backend.city.state')); ?></th>
                                <th><?php echo e(__('backend.city.lat')); ?></th>
                                <th><?php echo e(__('backend.city.lng')); ?></th>
                                <th><?php echo e(__('backend.shared.action')); ?></th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <?php if(count($all_cities)): ?>
                                <?php $__currentLoopData = $all_cities; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $city): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($city->id); ?></td>
                                        <td><?php echo e($city->city_name); ?></td>
                                        <td><?php echo e($city->city_slug); ?></td>
                                        <td><?php echo e($city->state->country->country_name); ?></td>
                                        <td><?php echo e($city->state->state_name); ?></td>
                                        <td><?php echo e($city->city_lat); ?></td>
                                        <td><?php echo e($city->city_lng); ?></td>
                                        <td>
                                            <a href="<?php echo e(route('admin.cities.edit', $city->id)); ?>" class="btn btn-primary btn-circle">
                                                <i class="fas fa-cog"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php else: ?>
                                <tr><th><?php echo e(__('backend.city.no-data')); ?></th></tr>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>

                    <?php if($state_id > 0): ?>
                        <?php echo e($all_cities->appends(['state' => $state_id])->links()); ?>

                    <?php else: ?>
                        <?php echo e($all_cities->links()); ?>

                    <?php endif; ?>

                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/googlemap/laravel_project/resources/views/backend/admin/city/index.blade.php ENDPATH**/ ?>