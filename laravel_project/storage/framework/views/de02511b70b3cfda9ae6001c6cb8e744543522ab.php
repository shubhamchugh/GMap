<?php $__env->startSection('styles'); ?>

    <?php if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP): ?>
    <link href="<?php echo e(asset('backend/vendor/leaflet/leaflet.css')); ?>" rel="stylesheet" />
    <?php endif; ?>

    <!-- Image Crop Css -->
    <link href="<?php echo e(asset('backend/vendor/croppie/croppie.css')); ?>" rel="stylesheet" />

    <!-- Bootstrap FD Css-->
    <link href="<?php echo e(asset('backend/vendor/bootstrap-fd/bootstrap.fd.css')); ?>" rel="stylesheet" />

    <!-- searchable selector -->
    <link href="<?php echo e(asset('backend/vendor/bootstrap-select/bootstrap-select.min.css')); ?>" rel="stylesheet" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="row justify-content-between">
        <div class="col-9">
            <h1 class="h3 mb-2 text-gray-800"><?php echo e(__('backend.item.edit-item')); ?></h1>
            <p class="mb-4"><?php echo e(__('backend.item.edit-item-desc')); ?></p>
        </div>
        <div class="col-3 text-right">
            <a href="<?php echo e(route('admin.items.index')); ?>" class="btn btn-info btn-icon-split">
                <span class="icon text-white-50">
                  <i class="fas fa-backspace"></i>
                </span>
                <span class="text"><?php echo e(__('backend.shared.back')); ?></span>
            </a>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row bg-white pt-4 pl-3 pr-3 pb-4">
        <div class="col-12">

            <div class="row mb-3">
                <div class="col-12">
                    <?php if($item_owner->isUser()): ?>
                        <div class="alert alert-warning" role="alert">
                            <?php echo e(__('products.edit-item-owner-alert', ['user_name' => $item_owner->name, 'user_email' => $item_owner->email])); ?>

                            <a href="<?php echo e(route('admin.users.edit', ['user' => $item_owner->id])); ?>" class="alert-link" target="_blank">
                                <i class="fas fa-external-link-alt"></i>
                                <?php echo e(__('products.edit-owner-alert-view-profile')); ?>

                            </a>
                        </div>
                    <?php endif; ?>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="text-lg text-gray-800"><?php echo e(__('backend.item.status')); ?>: </span>
                    <?php if($item->item_status == \App\Item::ITEM_SUBMITTED): ?>
                        <span class="text-warning"><?php echo e(__('backend.item.submitted')); ?></span>
                    <?php elseif($item->item_status == \App\Item::ITEM_PUBLISHED): ?>
                        <span class="text-success"><?php echo e(__('backend.item.published')); ?></span>
                    <?php elseif($item->item_status == \App\Item::ITEM_SUSPENDED): ?>
                        <span class="text-danger"><?php echo e(__('backend.item.suspended')); ?></span>
                    <?php endif; ?>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-12">
                    <span class="text-lg text-gray-800"><?php echo e(__('backend.item.item-link')); ?>:</span>

                    <?php if($item->item_status == \App\Item::ITEM_PUBLISHED): ?>
                        <a href="<?php echo e(route('page.item', $item->item_slug)); ?>" target="_blank"><?php echo e(route('page.item', $item->item_slug)); ?></a>
                    <?php else: ?>
                        <span><?php echo e(route('page.item', $item->item_slug)); ?></span>
                    <?php endif; ?>
                    <a class="text-info pl-2" href="#" data-toggle="modal" data-target="#itemSlugModal">
                        <i class="far fa-edit"></i>
                        <?php echo e(__('item_slug.update-url')); ?>

                    </a>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-12">

                    <?php if($item->item_status == \App\Item::ITEM_PUBLISHED): ?>
                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.disapprove', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-warning">
                                <i class="far fa-times-circle"></i>
                                <?php echo e(__('backend.shared.disapprove')); ?>

                            </button>
                        </form>

                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.suspend', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-danger">
                                <i class="far fa-flag"></i>
                                <?php echo e(__('backend.shared.suspend')); ?>

                            </button>
                        </form>
                    <?php elseif($item->item_status == \App\Item::ITEM_SUBMITTED): ?>
                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.approve', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-success">
                                <i class="far fa-check-circle"></i>
                                <?php echo e(__('backend.shared.approve')); ?>

                            </button>
                        </form>

                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.suspend', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-danger">
                                <i class="far fa-flag"></i>
                                <?php echo e(__('backend.shared.suspend')); ?>

                            </button>
                        </form>
                    <?php elseif($item->item_status == \App\Item::ITEM_SUSPENDED): ?>
                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.approve', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-success">
                                <i class="far fa-check-circle"></i>
                                <?php echo e(__('backend.shared.approve')); ?>

                            </button>
                        </form>

                        <form class="float-left pr-1" action="<?php echo e(route('admin.items.disapprove', $item)); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('PUT'); ?>
                            <button type="submit" class="btn btn-sm btn-warning">
                                <i class="far fa-times-circle"></i>
                                <?php echo e(__('backend.shared.disapprove')); ?>

                            </button>
                        </form>
                    <?php endif; ?>

                    <a class="btn btn-sm btn-primary" href="<?php echo e(route('admin.items.sections.index', ['item' => $item])); ?>">
                        <i class="fas fa-bars"></i>
                        <?php echo e(__('item_section.manage-sections')); ?>

                    </a>

                    <a class="btn btn-sm btn-outline-danger" href="#" data-toggle="modal" data-target="#deleteModal">
                        <i class="far fa-trash-alt"></i>
                        <?php echo e(__('backend.item.delete-item')); ?>

                    </a>
                </div>
            </div>

            <hr/>

            <div class="row mt-4 mb-4">
                <div class="col-12">
                    <div class="row mb-3">
                        <div class="col-12">
                            <span class="text-lg text-gray-800"><?php echo e(__('backend.category.category')); ?>: </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="pr-1 pb-2 float-left">
                                    <span class="bg-info rounded text-white pl-2 pr-2 pt-1 pb-1">
                                        <?php echo e($category->category_name); ?>

                                    </span>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                            <a class="text-info pl-2 float-left" href="#" data-toggle="modal" data-target="#categoriesModal">
                                <i class="far fa-edit"></i>
                                <?php echo e(__('categories.update-cat')); ?>

                            </a>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <form method="POST" action="<?php echo e(route('admin.items.update', $item)); ?>" id="item-create-form">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('PUT'); ?>

                        <hr/>
                        <div class="form-row mb-3">
                            <div class="col-12 col-md-6 mb-3 mb-md-0">
                                <div class="form-check">
                                    <input <?php echo e((old('item_type') ? old('item_type') : $item->item_type) == \App\Item::ITEM_TYPE_REGULAR ? 'checked' : ''); ?> class="form-check-input" type="radio" name="item_type" id="item_type_regular" value="<?php echo e(\App\Item::ITEM_TYPE_REGULAR); ?>" aria-describedby="item_type_regularHelpBlock">
                                    <label class="form-check-label" for="item_type_regular">
                                        <?php echo e(__('theme_directory_hub.online-listing.regular-listing')); ?>

                                    </label>
                                    <small id="item_type_regularHelpBlock" class="form-text text-muted">
                                        <?php echo e(__('theme_directory_hub.online-listing.regular-listing-help')); ?>

                                    </small>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-check">
                                    <input <?php echo e((old('item_type') ? old('item_type') : $item->item_type) == \App\Item::ITEM_TYPE_ONLINE ? 'checked' : ''); ?> class="form-check-input" type="radio" name="item_type" id="item_type_online" value="<?php echo e(\App\Item::ITEM_TYPE_ONLINE); ?>" aria-describedby="item_type_onlineHelpBlock">
                                    <label class="form-check-label" for="item_type_online">
                                        <?php echo e(__('theme_directory_hub.online-listing.online-listing')); ?>

                                    </label>
                                    <small id="item_type_onlineHelpBlock" class="form-text text-muted">
                                        <?php echo e(__('theme_directory_hub.online-listing.online-listing-help')); ?>

                                    </small>
                                </div>
                            </div>
                        </div>

                        <hr/>
                        <div class="form-row mb-3">
                            <div class="col-md-12">
                                <span class="text-lg text-gray-800"><?php echo e(__('backend.item.general-info')); ?></span>
                                <small class="form-text text-muted">
                                </small>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <div class="col-md-3">
                                <label for="item_title" class="text-black"><?php echo e(__('backend.item.title')); ?></label>
                                <input id="item_title" type="text" class="form-control <?php $__errorArgs = ['item_title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_title" value="<?php echo e(old('item_title') ? old('item_title') : $item->item_title); ?>">
                                <?php $__errorArgs = ['item_title'];
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

                            <div class="col-md-2">
                                <label for="item_status" class="text-black"><?php echo e(__('backend.item.status')); ?></label>
                                <select class="selectpicker form-control <?php $__errorArgs = ['item_status'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_status">

                                    <option <?php echo e($item->item_status == \App\Item::ITEM_SUBMITTED ? 'selected' : ''); ?> value="<?php echo e(\App\Item::ITEM_SUBMITTED); ?>"><?php echo e(__('backend.item.submitted')); ?></option>
                                    <option <?php echo e($item->item_status == \App\Item::ITEM_PUBLISHED ? 'selected' : ''); ?> value="<?php echo e(\App\Item::ITEM_PUBLISHED); ?>"><?php echo e(__('backend.item.published')); ?></option>
                                    <option <?php echo e($item->item_status == \App\Item::ITEM_SUSPENDED ? 'selected' : ''); ?> value="<?php echo e(\App\Item::ITEM_SUSPENDED); ?>"><?php echo e(__('backend.item.suspended')); ?></option>

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

                            <div class="col-md-2">
                                <label for="item_featured" class="text-black"><?php echo e(__('backend.item.featured')); ?></label>
                                <select class="selectpicker form-control <?php $__errorArgs = ['item_featured'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_featured">

                                    <option <?php echo e($item->item_featured == \App\Item::ITEM_NOT_FEATURED ? 'selected' : ''); ?> value="<?php echo e(\App\Item::ITEM_NOT_FEATURED); ?>"><?php echo e(__('backend.shared.no')); ?></option>
                                    <option <?php echo e($item->item_featured == \App\Item::ITEM_FEATURED ? 'selected' : ''); ?> value="<?php echo e(\App\Item::ITEM_FEATURED); ?>"><?php echo e(__('backend.shared.yes')); ?></option>

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

                            <div class="col-md-5">
                                <label for="item_address" class="text-black"><?php echo e(__('backend.item.address')); ?></label>
                                <input id="item_address" type="text" class="form-control <?php $__errorArgs = ['item_address'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_address" value="<?php echo e(old('item_address') ? old('item_address') : $item->item_address); ?>">
                                <?php $__errorArgs = ['item_address'];
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

                        <div class="form-row mb-3">

                            <div class="col-md-12">
                                <div class="form-check form-check-inline">
                                    <input <?php echo e($item->item_address_hide == \App\Item::ITEM_ADDR_HIDE ? 'checked' : ''); ?> class="form-check-input" type="checkbox" id="item_address_hide" name="item_address_hide" value="<?php echo e(\App\Item::ITEM_ADDR_HIDE); ?>">
                                    <label class="form-check-label" for="item_address_hide">
                                        <?php echo e(__('backend.item.hide-address')); ?>

                                        <small class="text-muted">
                                            <?php echo e(__('backend.item.hide-address-help')); ?>

                                        </small>
                                    </label>
                                </div>
                                <?php $__errorArgs = ['item_address_hide'];
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

                        <div class="form-row mb-3">

                            <div class="col-md-3">
                                <label for="select_country_id" class="text-black"><?php echo e(__('backend.setting.country')); ?></label>
                                <select id="select_country_id" class="selectpicker form-control <?php $__errorArgs = ['country_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="country_id" data-live-search="true">
                                    <option selected value="0"><?php echo e(__('prefer_country.select-country')); ?></option>
                                    <?php $__currentLoopData = $all_countries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $all_countries_key => $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($country->id); ?>" <?php echo e((old('country_id') ? old('country_id') : $item->country_id) == $country->id ? 'selected' : ''); ?>><?php echo e($country->country_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php $__errorArgs = ['country_id'];
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

                            <div class="col-md-3">
                                <label for="select_state_id" class="text-black"><?php echo e(__('backend.state.state')); ?></label>
                                <select id="select_state_id" class="selectpicker form-control <?php $__errorArgs = ['state_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="state_id" data-live-search="true">
                                    <option selected value="0"><?php echo e(__('backend.item.select-state')); ?></option>
                                    <?php $__currentLoopData = $all_states; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $state): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option <?php echo e($item->state_id == $state->id ? 'selected' : ''); ?> value="<?php echo e($state->id); ?>"><?php echo e($state->state_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php $__errorArgs = ['state_id'];
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

                            <div class="col-md-3">
                                <label for="select_city_id" class="text-black"><?php echo e(__('backend.city.city')); ?></label>
                                <select id="select_city_id" class="selectpicker form-control <?php $__errorArgs = ['city_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="city_id" data-live-search="true">
                                    <option selected value="0"><?php echo e(__('backend.item.select-city')); ?></option>
                                    <?php $__currentLoopData = $all_cities; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $city): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option <?php echo e($item->city_id == $city->id ? 'selected' : ''); ?> value="<?php echo e($city->id); ?>"><?php echo e($city->city_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php $__errorArgs = ['city_id'];
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

                            <div class="col-md-3">
                                <label for="item_postal_code" class="text-black"><?php echo e(__('backend.item.postal-code')); ?></label>
                                <input id="item_postal_code" type="text" class="form-control <?php $__errorArgs = ['item_postal_code'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_postal_code" value="<?php echo e(old('item_postal_code') ? old('item_postal_code') : $item->item_postal_code); ?>">
                                <?php $__errorArgs = ['item_postal_code'];
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

                        <div class="form-row mb-3">

                            <div class="col-md-3">
                                <label for="item_lat" class="text-black"><?php echo e(__('backend.item.lat')); ?></label>
                                <input id="item_lat" type="text" class="form-control <?php $__errorArgs = ['item_lat'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_lat" value="<?php echo e(old('item_lat') ? old('item_lat') : $item->item_lat); ?>" aria-describedby="latHelpBlock">
                                <small id="lngHelpBlock" class="form-text text-muted">
                                    <a class="lat_lng_select_button btn btn-sm btn-primary text-white"><?php echo e(__('backend.item.select-map')); ?></a>
                                </small>
                                <?php $__errorArgs = ['item_lat'];
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

                            <div class="col-md-3">
                                <label for="item_lng" class="text-black"><?php echo e(__('backend.item.lng')); ?></label>
                                <input id="item_lng" type="text" class="form-control <?php $__errorArgs = ['item_lng'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_lng" value="<?php echo e(old('item_lng') ? old('item_lng') : $item->item_lng); ?>" aria-describedby="lngHelpBlock">
                                <small id="lngHelpBlock" class="form-text text-muted">
                                    <a class="lat_lng_select_button btn btn-sm btn-primary text-white"><?php echo e(__('backend.item.select-map')); ?></a>
                                </small>
                                <?php $__errorArgs = ['item_lng'];
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

                            <div class="col-md-3">
                                <label for="item_phone" class="text-black"><?php echo e(__('backend.item.phone')); ?></label>
                                <input id="item_phone" type="text" class="form-control <?php $__errorArgs = ['item_phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_phone" value="<?php echo e(old('item_phone') ? old('item_phone') : $item->item_phone); ?>" aria-describedby="lngHelpBlock">
                                <?php $__errorArgs = ['item_phone'];
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

                            <div class="col-md-3">
                                <label for="item_youtube_id" class="text-black"><?php echo e(__('customization.item.youtube-id')); ?></label>
                                <input id="item_youtube_id" type="text" class="form-control <?php $__errorArgs = ['item_youtube_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_youtube_id" value="<?php echo e(old('item_youtube_id') ? old('item_youtube_id') : $item->item_youtube_id); ?>">
                                <?php $__errorArgs = ['item_youtube_id'];
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

                        <div class="form-row mb-3">

                            <div class="col-md-12">
                                <label for="item_description" class="text-black"><?php echo e(__('backend.item.description')); ?></label>
                                <textarea class="form-control <?php $__errorArgs = ['item_description'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="item_description" rows="5" name="item_description"><?php echo e(old('item_description') ? old('item_description') : $item->item_description); ?></textarea>
                                <?php $__errorArgs = ['item_description'];
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

                        <!-- Start web & social media -->
                        <div class="form-row mb-3">
                            <div class="col-md-3">
                                <label for="item_website" class="text-black"><?php echo e(__('backend.item.website')); ?></label>
                                <input id="item_website" type="text" class="form-control <?php $__errorArgs = ['item_website'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_website" value="<?php echo e(old('item_website') ? old('item_website') : $item->item_website); ?>">
                                <small id="linkHelpBlock" class="form-text text-muted">
                                    <?php echo e(__('backend.shared.url-help')); ?>

                                </small>
                                <?php $__errorArgs = ['item_website'];
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

                            <div class="col-md-3">
                                <label for="item_social_facebook" class="text-black"><?php echo e(__('backend.item.facebook')); ?></label>
                                <input id="item_social_facebook" type="text" class="form-control <?php $__errorArgs = ['item_social_facebook'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_social_facebook" value="<?php echo e(old('item_social_facebook') ? old('item_social_facebook') : $item->item_social_facebook); ?>">
                                <small id="linkHelpBlock" class="form-text text-muted">
                                    <?php echo e(__('backend.shared.url-help')); ?>

                                </small>
                                <?php $__errorArgs = ['item_social_facebook'];
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

                            <div class="col-md-3">
                                <label for="item_social_twitter" class="text-black"><?php echo e(__('backend.item.twitter')); ?></label>
                                <input id="item_social_twitter" type="text" class="form-control <?php $__errorArgs = ['item_social_twitter'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_social_twitter" value="<?php echo e(old('item_social_twitter') ? old('item_social_twitter') : $item->item_social_twitter); ?>">
                                <small id="linkHelpBlock" class="form-text text-muted">
                                    <?php echo e(__('backend.shared.url-help')); ?>

                                </small>
                                <?php $__errorArgs = ['item_social_twitter'];
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

                            <div class="col-md-3">
                                <label for="item_social_linkedin" class="text-black"><?php echo e(__('backend.item.linkedin')); ?></label>
                                <input id="item_social_linkedin" type="text" class="form-control <?php $__errorArgs = ['item_social_linkedin'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="item_social_linkedin" value="<?php echo e(old('item_social_linkedin') ? old('item_social_linkedin') : $item->item_social_linkedin); ?>">
                                <small id="linkHelpBlock" class="form-text text-muted">
                                    <?php echo e(__('backend.shared.url-help')); ?>

                                </small>
                                <?php $__errorArgs = ['item_social_linkedin'];
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
                        <!-- End web & social media -->

                        <!-- Start custom field section -->
                        <div class="form-row mb-3">
                            <div class="col-md-12">
                                <span class="text-lg text-gray-800"><?php echo e(__('backend.item.custom-fields')); ?></span>
                                <small class="form-text text-muted">
                                    <?php echo e(__('backend.item.custom-field-help')); ?>

                                </small>
                            </div>
                        </div>
                        <div class="form-row">
                            <?php $__currentLoopData = $all_customFields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $all_customFields_key => $customField): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                <?php
                                $find_item_feature = $item->features()->where('custom_field_id', $customField->id)->get();
                                ?>

                                <div class="col-md-4 mb-3">
                                    <?php if($customField->custom_field_type == \App\CustomField::TYPE_TEXT): ?>
                                        <label for="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" class="text-black"><?php echo e($customField->custom_field_name); ?></label>
                                        <textarea class="form-control <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" rows="5" name="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>"><?php echo e(old(str_slug($customField->custom_field_name . $customField->id)) ? old(str_slug($customField->custom_field_name . $customField->id)) : ($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : '')); ?></textarea>
                                        <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
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
                                    <?php endif; ?>
                                    <?php if($customField->custom_field_type == \App\CustomField::TYPE_SELECT): ?>
                                        <label for="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" class="text-black"><?php echo e($customField->custom_field_name); ?></label>
                                        <select class="selectpicker form-control" name="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" id="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" data-live-search="true">

                                            <?php
                                            $single_select_custom_fields_array = explode(',', $customField->custom_field_seed_value);
                                            ?>

                                            <?php $__currentLoopData = $single_select_custom_fields_array; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $single_select_custom_fields_array_key => $custom_field_value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option <?php echo e(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : '') == trim($custom_field_value) ? 'selected' : ''); ?> value="<?php echo e($custom_field_value); ?>"><?php echo e($custom_field_value); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                        <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
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
                                    <?php endif; ?>
                                    <?php if($customField->custom_field_type == \App\CustomField::TYPE_MULTI_SELECT): ?>
                                        <label for="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" class="text-black"><?php echo e($customField->custom_field_name); ?></label>
                                        <select multiple class="selectpicker form-control" name="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>[]" id="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" data-live-search="true" data-actions-box="true">

                                            <?php
                                            $multiple_select_custom_fields_array = explode(',', $customField->custom_field_seed_value);
                                            ?>

                                            <?php $__currentLoopData = $multiple_select_custom_fields_array; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $multiple_select_custom_fields_array_key => $custom_field_value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option <?php echo e(( (($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : '') == trim($custom_field_value) ? true : false) || (strpos(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : ''), trim($custom_field_value) . ',') === 0 ? true : false) || (strpos(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : ''), ', ' . trim($custom_field_value) . ',') !== false ? true : false) || (strpos(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : ''), ',' . trim($custom_field_value) . ',') !== false ? true : false) || (strpos(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : ''), ', ' . trim($custom_field_value) ) !== false ? true : false) || (strpos(($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : ''), ',' . trim($custom_field_value) ) !== false ? true : false) ) == true ? 'selected' : ''); ?> value="<?php echo e($custom_field_value); ?>"><?php echo e($custom_field_value); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                        <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
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
                                    <?php endif; ?>
                                    <?php if($customField->custom_field_type == \App\CustomField::TYPE_LINK): ?>
                                        <label for="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" class="text-black"><?php echo e($customField->custom_field_name); ?></label>
                                        <input id="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" type="text" class="form-control <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="<?php echo e(str_slug($customField->custom_field_name . $customField->id)); ?>" value="<?php echo e(old(str_slug($customField->custom_field_name . $customField->id)) ? old(str_slug($customField->custom_field_name . $customField->id)) : ($find_item_feature->count() > 0 ? $find_item_feature->first()->item_feature_value : '')); ?>" aria-describedby="linkHelpBlock">
                                        <small id="linkHelpBlock" class="form-text text-muted">
                                            <?php echo e(__('backend.shared.url-help')); ?>

                                        </small>
                                        <?php $__errorArgs = [str_slug($customField->custom_field_name . $customField->id)];
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
                                    <?php endif; ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                        <!-- End custom field section -->

                        <div class="form-row mb-3">
                            <div class="col-md-6">
                                <span class="text-lg text-gray-800"><?php echo e(__('backend.item.feature-image')); ?></span>
                                <small class="form-text text-muted">
                                    <?php echo e(__('backend.item.feature-image-help')); ?>

                                </small>
                                <?php $__errorArgs = ['feature_image'];
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
                                <div class="row mt-3">
                                    <div class="col-8">
                                        <button id="upload_image" type="button" class="btn btn-primary btn-block mb-2"><?php echo e(__('backend.item.select-image')); ?></button>
                                        <?php if(empty($item->item_image)): ?>
                                            <img id="image_preview" src="<?php echo e(asset('backend/images/placeholder/full_item_feature_image.webp')); ?>" class="img-responsive">
                                        <?php else: ?>
                                            <img id="image_preview" src="<?php echo e(Storage::disk('public')->url('item/'. $item->item_image)); ?>" class="img-responsive">
                                        <?php endif; ?>
                                        <input id="feature_image" type="hidden" name="feature_image">
                                    </div>
                                </div>

                                <div class="row mt-1">
                                    <div class="col-8">
                                        <a class="btn btn-danger btn-block text-white" id="delete_feature_image_button">
                                            <i class="fas fa-trash-alt"></i>
                                            <?php echo e(__('role_permission.item.delete-feature-image')); ?>

                                        </a>
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-6">
                                <span class="text-lg text-gray-800"><?php echo e(__('backend.item.gallery-images')); ?></span>
                                <small class="form-text text-muted">
                                    <?php echo e(__('theme_directory_hub.listing.gallery-upload-help', ['gallery_photos_count' => $setting_item_max_gallery_photos])); ?>

                                </small>
                                <?php $__errorArgs = ['image_gallery'];
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
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button id="upload_gallery" type="button" class="btn btn-primary btn-block mb-2"><?php echo e(__('backend.item.select-images')); ?></button>
                                        <div class="row" id="selected-images">
                                            <?php $__currentLoopData = $item->galleries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $gallery): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="col-3 mb-2" id="item_image_gallery_<?php echo e($gallery->id); ?>">
                                                    <img class="item_image_gallery_img" src="<?php echo e(Storage::disk('public')->url('item/gallery/'. $gallery->item_image_gallery_name)); ?>">
                                                    <br/><button class="btn btn-danger btn-sm text-white mt-1" onclick="$(this).attr('disabled', true); deleteGallery(<?php echo e($gallery->id); ?>);"><?php echo e(__('backend.shared.delete')); ?></button>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr/>
                        <div class="form-row mb-3">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success py-2 px-4 text-white">
                                    <?php echo e(__('backend.shared.update')); ?>

                                </button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal - feature image -->
    <div class="modal fade" id="image-crop-modal" tabindex="-1" role="dialog" aria-labelledby="image-crop-modal" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('backend.item.crop-feature-image')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div id="image_demo"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="custom-file">
                                <input id="upload_image_input" type="file" class="custom-file-input">
                                <label class="custom-file-label" for="upload_image_input"><?php echo e(__('backend.item.choose-image')); ?></label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('backend.shared.cancel')); ?></button>
                    <button id="crop_image" type="button" class="btn btn-primary"><?php echo e(__('backend.item.crop-image')); ?></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Delete Listing -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('backend.shared.delete-confirm')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?php echo e(__('backend.shared.delete-message', ['record_type' => __('backend.shared.item'), 'record_name' => $item->item_title])); ?>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('backend.shared.cancel')); ?></button>
                    <form action="<?php echo e(route('admin.items.destroy', $item)); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('DELETE'); ?>
                        <button type="submit" class="btn btn-danger"><?php echo e(__('backend.shared.delete')); ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal - map -->
    <div class="modal fade" id="map-modal" tabindex="-1" role="dialog" aria-labelledby="map-modal" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('backend.item.select-map-title')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div id="map-modal-body"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span id="lat_lng_span"></span>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('backend.shared.cancel')); ?></button>
                    <button id="lat_lng_confirm" type="button" class="btn btn-primary"><?php echo e(__('backend.shared.confirm')); ?></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal categories -->
    <div class="modal fade" id="categoriesModal" tabindex="-1" role="dialog" aria-labelledby="categoriesModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('categories.update-cat')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="update-item-category-form" action="<?php echo e(route('admin.item.category.update', $item)); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('PUT'); ?>
                        <select multiple size="<?php echo e(count($all_categories)); ?>" class="selectpicker form-control" name="category[]" id="category" data-live-search="true" data-actions-box="true">
                            <?php $__currentLoopData = $all_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $a_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option <?php echo e(in_array($a_category['category_id'], $category_ids) ? 'selected' : ''); ?> value="<?php echo e($a_category['category_id']); ?>"><?php echo e($a_category['category_name']); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
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
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('backend.shared.cancel')); ?></button>
                    <button type="button" class="btn btn-success" id="update-item-category-button"><?php echo e(__('categories.update-cat')); ?></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal item slug -->
    <div class="modal fade" id="itemSlugModal" tabindex="-1" role="dialog" aria-labelledby="itemSlugModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo e(__('item_slug.update-url')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="update-item-slug-form" action="<?php echo e(route('admin.item.slug.update', ['item' => $item])); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('PUT'); ?>

                        <div class="form-row mb-3">
                            <div class="col-md-12">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><?php echo e('/'); ?></div>
                                    </div>
                                    <input type="text" class="form-control" name="item_slug" value="<?php echo e(old('item_slug') ? old('item_slug') : $item->item_slug); ?>" id="item_slug">
                                </div>
                                <small class="form-text text-muted">
                                    <?php echo e(__('item_slug.item-slug-help')); ?>

                                </small>
                                <?php $__errorArgs = ['item_slug'];
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

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('backend.shared.cancel')); ?></button>
                    <button type="button" class="btn btn-success" id="update-item-slug-button"><?php echo e(__('item_slug.update-url')); ?></button>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>

    <?php if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP): ?>
    <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="<?php echo e(asset('backend/vendor/leaflet/leaflet.js')); ?>"></script>
    <?php endif; ?>

    <!-- Image Crop Plugin Js -->
    <script src="<?php echo e(asset('backend/vendor/croppie/croppie.js')); ?>"></script>

    <!-- Bootstrap Fd Plugin Js-->
    <script src="<?php echo e(asset('backend/vendor/bootstrap-fd/bootstrap.fd.js')); ?>"></script>

    <!-- searchable selector -->
    <script src="<?php echo e(asset('backend/vendor/bootstrap-select/bootstrap-select.min.js')); ?>"></script>
    <?php echo $__env->make('backend.admin.partials.bootstrap-select-locale', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script>

        function deleteGallery(domId)
        {
            var ajax_url = '/ajax/item/gallery/delete/' + domId;

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
                    $('#item_image_gallery_' + domId).remove();
                }});
        }

        $(document).ready(function() {

            /**
             * Start listing type radio button select
             */
            <?php if((old('item_type') ? old('item_type') : $item->item_type) == \App\Item::ITEM_TYPE_ONLINE): ?>
            $( "#item_address" ).prop( "disabled", true );
            $( "#item_address_hide" ).prop( "disabled", true );
            $( "#select_country_id" ).prop( "disabled", true );
            $( "#select_state_id" ).prop( "disabled", true );
            $( "#select_city_id" ).prop( "disabled", true );
            $( "#item_postal_code" ).prop( "disabled", true );
            $( "#item_lat" ).prop( "disabled", true );
            $( "#item_lng" ).prop( "disabled", true );

            $('#select_country_id').selectpicker('refresh');
            $('#select_state_id').selectpicker('refresh');
            $('#select_city_id').selectpicker('refresh');
            <?php endif; ?>
            $('input:radio[name="item_type"]').change(
                function(){
                    if ($(this).is(':checked') && $(this).val() == '<?php echo e(\App\Item::ITEM_TYPE_REGULAR); ?>') {

                        // enable all location related input
                        $( "#item_address" ).prop( "disabled", false );
                        $( "#item_address_hide" ).prop( "disabled", false );
                        $( "#select_country_id" ).prop( "disabled", false );
                        $( "#select_state_id" ).prop( "disabled", false );
                        $( "#select_city_id" ).prop( "disabled", false );
                        $( "#item_postal_code" ).prop( "disabled", false );
                        $( "#item_lat" ).prop( "disabled", false );
                        $( "#item_lng" ).prop( "disabled", false );

                        $('#select_country_id').selectpicker('refresh');
                        $('#select_state_id').selectpicker('refresh');
                        $('#select_city_id').selectpicker('refresh');
                    }
                    else
                    {
                        // disable all location related input
                        $( "#item_address" ).prop( "disabled", true );
                        $( "#item_address_hide" ).prop( "disabled", true );
                        $( "#select_country_id" ).prop( "disabled", true );
                        $( "#select_state_id" ).prop( "disabled", true );
                        $( "#select_city_id" ).prop( "disabled", true );
                        $( "#item_postal_code" ).prop( "disabled", true );
                        $( "#item_lat" ).prop( "disabled", true );
                        $( "#item_lng" ).prop( "disabled", true );

                        $('#select_country_id').selectpicker('refresh');
                        $('#select_state_id').selectpicker('refresh');
                        $('#select_city_id').selectpicker('refresh');

                    }
                });
            /**
             * End listing type radio button select
             */

            <?php if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP): ?>
            /**
             * Start map modal
             */
            var map = L.map('map-modal-body', {
                center: [<?php echo e(empty($item->item_lat) ? $site_global_settings->setting_site_location_lat : $item->item_lat); ?>, <?php echo e(empty($item->item_lng) ? $site_global_settings->setting_site_location_lng : $item->item_lng); ?>],
                zoom: 10,
            });

            var layerGroup = L.layerGroup().addTo(map);
            L.marker([<?php echo e(empty($item->item_lat) ? $site_global_settings->setting_site_location_lat : $item->item_lat); ?>, <?php echo e(empty($item->item_lng) ? $site_global_settings->setting_site_location_lng : $item->item_lng); ?>]).addTo(layerGroup);

            var current_lat = <?php echo e(empty($item->item_lat) ? $site_global_settings->setting_site_location_lat : $item->item_lat); ?>;
            var current_lng = <?php echo e(empty($item->item_lng) ? $site_global_settings->setting_site_location_lng : $item->item_lng); ?>;

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            map.on('click', function(e) {

                // remove all the markers in one go
                layerGroup.clearLayers();
                L.marker([e.latlng.lat, e.latlng.lng]).addTo(layerGroup);

                current_lat = e.latlng.lat;
                current_lng = e.latlng.lng;

                $('#lat_lng_span').text("Lat, Lng : " + e.latlng.lat + ", " + e.latlng.lng);
            });

            $('#lat_lng_confirm').on('click', function(){

                $('#item_lat').val(current_lat);
                $('#item_lng').val(current_lng);
                $('#map-modal').modal('hide');
            });
            $('.lat_lng_select_button').on('click', function(){
                $('#map-modal').modal('show');
                setTimeout(function(){ map.invalidateSize()}, 500);
            });
            /**
             * End map modal
             */
            <?php endif; ?>

            /**
             * Start country, state, city selector
             */
            $('#select_country_id').on('change', function() {

                $('#select_state_id').html("<option selected value='0'><?php echo e(__('prefer_country.loading-wait')); ?></option>");
                $('#select_state_id').selectpicker('refresh');

                if(this.value > 0)
                {
                    var ajax_url = '/ajax/states/' + this.value;

                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    jQuery.ajax({
                        url: ajax_url,
                        method: 'get',
                        data: {
                        },
                        success: function(result){

                            $('#select_state_id').html("<option selected value='0'><?php echo e(__('backend.item.select-state')); ?></option>");
                            $.each(JSON.parse(result), function(key, value) {
                                var state_id = value.id;
                                var state_name = value.state_name;
                                $('#select_state_id').append('<option value="'+ state_id +'">' + state_name + '</option>');
                            });
                            $('#select_state_id').selectpicker('refresh');
                        }});
                }

            });


            $('#select_state_id').on('change', function() {

                $('#select_city_id').html("<option selected value='0'><?php echo e(__('prefer_country.loading-wait')); ?></option>");
                $('#select_city_id').selectpicker('refresh');

                if(this.value > 0)
                {
                    var ajax_url = '/ajax/cities/' + this.value;

                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    jQuery.ajax({
                        url: ajax_url,
                        method: 'get',
                        data: {
                        },
                        success: function(result){

                            $('#select_city_id').html("<option selected value='0'><?php echo e(__('backend.item.select-city')); ?></option>");
                            $.each(JSON.parse(result), function(key, value) {
                                var city_id = value.id;
                                var city_name = value.city_name;
                                $('#select_city_id').append('<option value="'+ city_id +'">' + city_name + '</option>');
                            });
                            $('#select_city_id').selectpicker('refresh');
                    }});
                }

            });

            <?php if(old('country_id')): ?>
                var ajax_url_initial_states = '/ajax/states/<?php echo e(old('country_id')); ?>';

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                jQuery.ajax({
                    url: ajax_url_initial_states,
                    method: 'get',
                    data: {
                    },
                    success: function(result){

                        $('#select_state_id').html("<option selected value='0'><?php echo e(__('backend.item.select-state')); ?></option>");
                        $.each(JSON.parse(result), function(key, value) {
                            var state_id = value.id;
                            var state_name = value.state_name;

                            if(state_id === <?php echo e(old('state_id')); ?>)
                            {
                                $('#select_state_id').append('<option value="'+ state_id +'" selected>' + state_name + '</option>');
                            }
                            else
                            {
                                $('#select_state_id').append('<option value="'+ state_id +'">' + state_name + '</option>');
                            }

                        });
                        $('#select_state_id').selectpicker('refresh');
                }});
            <?php endif; ?>

            <?php if(old('state_id')): ?>
                var ajax_url_initial_cities = '/ajax/cities/<?php echo e(old('state_id')); ?>';

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                jQuery.ajax({
                    url: ajax_url_initial_cities,
                    method: 'get',
                    data: {
                    },
                    success: function(result){

                        $('#select_city_id').html("<option selected value='0'><?php echo e(__('backend.item.select-city')); ?></option>");
                        $.each(JSON.parse(result), function(key, value) {
                            var city_id = value.id;
                            var city_name = value.city_name;

                            if(city_id === <?php echo e(old('city_id')); ?>)
                            {
                                $('#select_city_id').append('<option value="'+ city_id +'" selected>' + city_name + '</option>');
                            }
                            else
                            {
                                $('#select_city_id').append('<option value="'+ city_id +'">' + city_name + '</option>');
                            }
                        });
                        $('#select_city_id').selectpicker('refresh');
                }});
            <?php endif; ?>
            /**
             * End country, state, city selector
             */

            /**
             * Start image gallery uplaod
             */
            $('#upload_gallery').on('click', function(){
                window.selectedImages = [];

                $.FileDialog({
                    accept: "image/jpeg",
                }).on("files.bs.filedialog", function (event) {
                    var html = "";
                    for (var a = 0; a < event.files.length; a++) {

                        if(a == 12) {break;}
                        selectedImages.push(event.files[a]);
                        html += "<div class='col-3 mb-2' id='item_image_gallery_" + a + "'>" +
                            "<img style='max-width: 120px;' src='" + event.files[a].content + "'>" +
                            "<br/><button class='btn btn-danger btn-sm text-white mt-1' onclick='$(\"#item_image_gallery_" + a + "\").remove();'>Delete</button>" +
                            "<input type='hidden' value='" + event.files[a].content + "' name='image_gallery[]'>" +
                            "</div>";
                    }
                    document.getElementById("selected-images").innerHTML += html;
                });
            });
            /**
             * End image gallery uplaod
             */

            /**
             * Start the croppie image plugin
             */
            $image_crop = null;

            $('#upload_image').on('click', function(){

                $('#image-crop-modal').modal('show');
            });

            var window_height = $(window).height();
            var window_width = $(window).width();
            var viewport_height = 0;
            var viewport_width = 0;

            if(window_width >= 800)
            {
                viewport_width = 800;
                viewport_height = 687;
            }
            else
            {
                viewport_width = window_width * 0.8;
                viewport_height = (viewport_width * 687) / 800;
            }

            $('#upload_image_input').on('change', function(){

                if(!$image_crop)
                {
                    $image_crop = $('#image_demo').croppie({
                        enableExif: true,
                        mouseWheelZoom: false,
                        viewport: {
                            width:viewport_width,
                            height:viewport_height,
                            type:'square',
                        },
                        boundary:{
                            width:viewport_width + 5,
                            height:viewport_width + 5,
                        }
                    });

                    $('#image-crop-modal .modal-dialog').css({
                        'max-width':'100%'
                    });
                }

                var reader = new FileReader();

                reader.onload = function (event) {

                    $image_crop.croppie('bind', {
                        url: event.target.result
                    }).then(function(){
                        console.log('jQuery bind complete');
                    });

                }
                reader.readAsDataURL(this.files[0]);
            });

            $('#crop_image').on("click", function(event){

                $image_crop.croppie('result', {
                    type: 'base64',
                    size: 'viewport'
                }).then(function(response){
                    $('#feature_image').val(response);
                    $('#image_preview').attr("src", response);
                });

                $('#image-crop-modal').modal('hide')
            });
            /**
             * End the croppie image plugin
             */

            /**
             * Start category update modal form submit
             */
            $('#update-item-category-button').on('click', function(){
                $('#update-item-category-button').attr("disabled", true);
                $('#update-item-category-form').submit();
            });

            <?php $__errorArgs = ['category'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            $('#categoriesModal').modal('show');
            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
            /**
             * End category update modal form submit
             */


            /**
             * Start item slug update modal form submit
             */
            $('#update-item-slug-button').on('click', function(){
                $('#update-item-slug-button').attr("disabled", true);
                $('#update-item-slug-form').submit();
            });

            <?php $__errorArgs = ['item_slug'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            $('#itemSlugModal').modal('show');
            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
            /**
             * End item slug update modal form submit
             */

            /**
             * Start delete feature image button
             */
            $('#delete_feature_image_button').on('click', function(){

                $('#delete_feature_image_button').attr("disabled", true);

                var ajax_url = '/ajax/item/image/delete/' + '<?php echo e($item->id); ?>';

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

                        $('#image_preview').attr("src", "<?php echo e(asset('backend/images/placeholder/full_item_feature_image.webp')); ?>");
                        $('#feature_image').val("");

                        $('#delete_feature_image_button').attr("disabled", false);
                    }});
            });
            /**
             * End delete feature image button
             */
        });
    </script>

    <?php if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_GOOGLE_MAP): ?>

        <script>
            function initMap()
            {
                const myLatlng = { lat: <?php echo e(empty($item->item_lat) ? $site_global_settings->setting_site_location_lat : $item->item_lat); ?>, lng: <?php echo e(empty($item->item_lng) ? $site_global_settings->setting_site_location_lng : $item->item_lng); ?> };
                const map = new google.maps.Map(document.getElementById('map-modal-body'), {
                    zoom: 4,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                let infoWindow = new google.maps.InfoWindow({
                    content: "<?php echo e(__('google_map.select-lat-lng-on-map')); ?>",
                    position: myLatlng,
                });
                infoWindow.open(map);

                var current_lat = 0;
                var current_lng = 0;

                google.maps.event.addListener(map, 'click', function( event ){

                    // Close the current InfoWindow.
                    infoWindow.close();
                    // Create a new InfoWindow.
                    infoWindow = new google.maps.InfoWindow({
                        position: event.latLng,
                    });
                    infoWindow.setContent(
                        JSON.stringify(event.latLng.toJSON(), null, 2)
                    );
                    infoWindow.open(map);

                    current_lat = event.latLng.lat();
                    current_lng = event.latLng.lng();
                    console.log( "Latitude: "+current_lat+" "+", longitude: "+current_lng );
                    $('#lat_lng_span').text("Lat, Lng : " + current_lat + ", " + current_lng);
                });

                $('#lat_lng_confirm').on('click', function(){

                    $('#item_lat').val(current_lat);
                    $('#item_lng').val(current_lng);
                    $('#map-modal').modal('hide');
                });
                $('.lat_lng_select_button').on('click', function(){
                    $('#map-modal').modal('show');
                    //setTimeout(function(){ map.invalidateSize()}, 500);
                });
            }
        </script>

        <script async defer src="https://maps.googleapis.com/maps/api/js??v=quarterly&key=<?php echo e($site_global_settings->setting_site_map_google_api_key); ?>&callback=initMap"></script>
    <?php endif; ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/googlemap/laravel_project/resources/views/backend/admin/item/edit.blade.php ENDPATH**/ ?>