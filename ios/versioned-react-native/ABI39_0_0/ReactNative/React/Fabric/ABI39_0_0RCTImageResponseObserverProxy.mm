/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI39_0_0RCTImageResponseObserverProxy.h"

#import <ABI39_0_0React/ABI39_0_0RCTUtils.h>
#import <ABI39_0_0React/imagemanager/ImageResponse.h>
#import <ABI39_0_0React/imagemanager/ImageResponseObserver.h>
#import <ABI39_0_0React/utils/ManagedObjectWrapper.h>

namespace ABI39_0_0facebook {
namespace ABI39_0_0React {

ABI39_0_0RCTImageResponseObserverProxy::ABI39_0_0RCTImageResponseObserverProxy(id<ABI39_0_0RCTImageResponseDelegate> delegate)
    : delegate_(delegate)
{
}

void ABI39_0_0RCTImageResponseObserverProxy::didReceiveImage(ImageResponse const &imageResponse) const
{
  UIImage *image = (UIImage *)unwrapManagedObject(imageResponse.getImage());
  id<ABI39_0_0RCTImageResponseDelegate> delegate = delegate_;
  auto this_ = this;
  ABI39_0_0RCTExecuteOnMainQueue(^{
    [delegate didReceiveImage:image fromObserver:this_];
  });
}

void ABI39_0_0RCTImageResponseObserverProxy::didReceiveProgress(float progress) const
{
  auto this_ = this;
  id<ABI39_0_0RCTImageResponseDelegate> delegate = delegate_;
  ABI39_0_0RCTExecuteOnMainQueue(^{
    [delegate didReceiveProgress:progress fromObserver:this_];
  });
}

void ABI39_0_0RCTImageResponseObserverProxy::didReceiveFailure() const
{
  auto this_ = this;
  id<ABI39_0_0RCTImageResponseDelegate> delegate = delegate_;
  ABI39_0_0RCTExecuteOnMainQueue(^{
    [delegate didReceiveFailureFromObserver:this_];
  });
}

} // namespace ABI39_0_0React
} // namespace ABI39_0_0facebook
