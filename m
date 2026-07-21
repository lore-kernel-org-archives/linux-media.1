Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCAA3BB12E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622095; cv=none; b=oTl7mnlpP/oDL6swaXmBNtY7SkU8M0Qr/Jdyq9BLwF9MmdT/0q5Fy5YTWFyG+HHQp32IrzLBkBA2kKyTlZtLEWwyqe0PGOSmP5B48Fgt70xz6W3NOsPfKVntNxx+7HPEcP4wnYbOTlm9Jnearma98Cf1xIbYB4qiB37bFg7cbYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622095; c=relaxed/simple;
	bh=CGfct8PUQ7k/GTBXx1thDEW1+DW1UM9fabzaCE228PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2modKR8+DW6tNQRzToeGraFYz71V3Ftr1NnI9Q/Vnjg6luI79Dz+LyJoPxfOXiqwQb2zYPWYpFFW8nSTcXxSpsza/qAZD7//mAclZMIqZLhZhb3W9G3hgmzJ3dD0MZJt641aVVrLSrJSi6AImzFlcYqGviC1JvCXxEm3MnXFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGRRCqoT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGRRCqoT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so12645741a12.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784622091; x=1785226891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvkB7fQj9FMYGIgyusU+WdEm+X4LQCuorVOln1T7cnc=;
        b=mGRRCqoT6rITFCEGolRkfCisPHmSUO4BTmxMZMohCQcLXdESMzFrDmnP9X9box/H56
         QXde8n4M/JawrLghEmO9TRtx+pjj0Tt3+bi7cjsb2lnSy2LXj6cKZx0M348S8TY4n+V4
         Jyn5yvQCTlTxYX8ofY174NKqu5qS2+KbPUSGiyboZr1bp5Mzb/JCu8P6tsLFHdEVLQ0P
         V5n2czkAUET54ezsQUPnhRlfUeoIBefuuIe6w+9LyvWkKzJuvv8f1Fc733PlRlpbOcvG
         i9hJC/Bp3Jt5QbWMmrc0sYbSbCoUvf9GDgS9ftrEo+MBTHrS1K3Ogg2adUAZnRliULOl
         9I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622091; x=1785226891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvkB7fQj9FMYGIgyusU+WdEm+X4LQCuorVOln1T7cnc=;
        b=GAQ2x+n/HEf0gl53+aFolypA338AI5GiZHsZ+mE6rSijU3qL3Di7ZA29mnnmrNXiSX
         GJZjFKucbIoEyKtMakkNYlMIxtpvzg90M52sDjP97HzvddFebdXPiAyUs8kyGkb7HR07
         p5t49z/tr6ypbU+UM9oMyqw2wQyNFxnJvdpSC4+fOS8rogPs1rA4k5O3xNygRKa7kxCB
         WOK4cpilgT786zWoo81nzLeRoBCDbjTTxBjgUL/I2ulUCIB1cEQZcsn5/jfkUtOWb8dX
         MkUMnxydL0XJTfs3qsZyOg0T/DP/6Yp9nMBoZ5wU8mPkdCaObULZu0wUIxGnhbwMaHzE
         vpYg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+cewcnEF+b7z8LNS+z9MzZhkC7Qf0YZSIAiyO9O1p3VMzczUdl0WHSEosKjJVWvQ+S0LIl2SlteNLBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDH/r8GXI21C9YCjOdBAX9t1tDYcZEtHg4JH93SyXBzXHJG+z
	C6dT2p23W6PDCyg+5Ef5f1WvrxnatWOn+9oJCBg+RhbRANkv7FAB1s2bGbaqR1+1z3I=
X-Gm-Gg: AfdE7clzjzZ6pQRXBMyIGm5ULlxNfs4+B5bTheXoWyOXoVq3DW3KYC6X5meNf7fQddF
	xY3GwkHB18nx3Y9BkQZLH4POvOc4/XxCE+pR5NpGoSmnoc1txRLmRWqCY8jtYh+ApOoG3u5sbrh
	oA5HDbMliiPHwQ5T0wwrRP1WNEm68Oe6bMQOeYaq/sWJ0SyhKJidPipZ8HWOdxm6vtqbe0Z8TVk
	U0t+Hsk5muXGuvHNX+rg4W0tktijL5CAGyy4qRM1GtMcKa4eXBb7ox1qFu9A2GDsjmDwjr2cxbt
	XyovPnvv8bplEbcX1RzX4SRySj9fjMhRPJCV6gRKj13is3hSWDkPizX+QhbUQ4iytz1atrBrAxC
	LjP6nqzleaxf3rNYYimzdofBMKSu45NnSJeNtRPBEMNtnsuaKEsSyP63xWTkkVH6qSAMgU2DrWQ
	5Q5okLrdTm/CE6m1twJxUeCqUKUCW5Ua1SFmwTY5Lf7lnflbCsIiYCSmcIhhB5nHm+QQ==
X-Received: by 2002:a17:906:ef08:b0:c16:7414:4c29 with SMTP id a640c23a62f3a-c16b473acc7mr947501366b.25.1784622091388;
        Tue, 21 Jul 2026 01:21:31 -0700 (PDT)
Received: from puffmais2.c.googlers.com (185.155.90.34.bc.googleusercontent.com. [34.90.155.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b72sm564725066b.48.2026.07.21.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:21:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 21 Jul 2026 09:21:26 +0100
Subject: [PATCH v3 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-linux-drm_crtc_fix2-v3-1-afa8c71506e6@linaro.org>
References: <20260721-linux-drm_crtc_fix2-v3-0-afa8c71506e6@linaro.org>
In-Reply-To: <20260721-linux-drm_crtc_fix2-v3-0-afa8c71506e6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Sean Paul <seanpaul@chromium.org>, 
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, Simona Vetter <simona.vetter@ffwll.ch>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

In [1], sashiko reported the following issue:

=== snip ===
Looking at how these fences are managed, drm_crtc_create_fence()
creates a dma_fence without taking a reference to the drm_device or
drm_crtc. Because the sync_file framework exposes this fence to
userspace, the fence can outlive the CRTC.

The dma_fence contract requires that data accessed by dma_fence_ops
(like get_driver_name) must remain valid for an RCU grace period after
the fence is signaled. However, drm_crtc_cleanup() and the subsequent
freeing of the device do not wait for an RCU grace period via
synchronize_rcu().

If userspace calls ioctl(SYNC_IOC_FILE_INFO) concurrently with a device
hot-unplug:

CPU1 (Userspace)
sync_file_get_name()
  ops = rcu_dereference(fence->ops);
  if (!dma_fence_test_signaled_flag())
    // Preempted or delayed here

CPU2 (Driver Teardown)
Signals the fence (setting fence->ops = NULL)
Destroys and frees the CRTC without waiting for an RCU grace period

CPU1 (Resumes)
  ops->get_driver_name(fence) -> drm_crtc_fence_get_driver_name()
  crtc = fence_to_crtc(fence); // Casts to the freed CRTC
  return crtc->dev->driver->name; // Use-after-free

...

Does the CRTC or DRM device need to be kept alive for the RCU grace
period, or should the fence hold a proper reference to prevent the
use-after-free when get_driver_name() and get_timeline_name() access
the freed CRTC structure?
=== snap ===

I believe this to be a correct observation and this patch implements
the suggestion of waiting for an RCU grace period before proceeding
with destruction of the drm_crtc, so that get_driver_name() and
get_timeline_name() can still work.

Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org?part=1
Fixes: 6d6003c4b613 ("drm/fence: add fence timeline to drm_crtc")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- Philipp: update kerneldoc, add Fixes:

v2: new patch
---
 drivers/gpu/drm/drm_crtc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 63ead8ba6756..e8e80c936852 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -493,14 +493,23 @@ EXPORT_SYMBOL(__drmm_crtc_alloc_with_planes);
  * drm_crtc_cleanup - Clean up the core crtc usage
  * @crtc: CRTC to cleanup
  *
- * This function cleans up @crtc and removes it from the DRM mode setting
- * core. Note that the function does *not* free the crtc structure itself,
- * this is the responsibility of the caller.
+ * This function cleans up @crtc and removes it from the DRM mode setting core,
+ * after first waiting an RCU grace period to ensure @crtc->dev can safely be
+ * dereferenced by our dma_fence_ops.
+ *
+ * Note that the function does *not* free the crtc structure itself, this is the
+ * responsibility of the caller.
  */
 void drm_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 
+	/* Ensure our dma_fence_ops remain valid for an RCU grace period after
+	 * the fence is signaled. This is necessary because our dma_fence_ops
+	 * dereference crtc->dev.
+	 */
+	synchronize_rcu();
+
 	/* Note that the crtc_list is considered to be static; should we
 	 * remove the drm_crtc at runtime we would have to decrement all
 	 * the indices on the drm_crtc after us in the crtc_list.

-- 
2.55.0.229.g6434b31f56-goog

