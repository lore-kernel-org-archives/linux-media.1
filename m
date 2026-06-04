Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BEB399377
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601348; cv=none; b=VL/0mQNua0gM4cV4y2A6b46i+pouxIKjrkF6q3E5QVnsGx1iuxBpUH1c4OrbMtmhsfbpysTxJfKQmUUarbRNqe7Ai+j5vNne3pf6sDTXnTljnvoHMIoKouI/y6RQxf1JmBfoUHLIsmHNlFBhRhRqx2vmbkHvvmJb2VXIh8/eYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601348; c=relaxed/simple;
	bh=DD+1DvBHIa2PD9GHPH9T6cV9e+RpfxknnwEPDqeurlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbsSvHb1Z76JdW3K9BFERlciPI3ZyftGwmDXG7iInqorahbJIQYbvLvVeiaOp/FCccIF85HkSyra2OqFE4TcQPETfY0/CoxnG30ObnoRat+QhB1ytAzN6hJIJntUSzBIz/LRyBR2IHBjzFKDRpMMfZ9qROho5x0VVdFJeucW9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etvN3fNf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etvN3fNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780601346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlYcsDX/fFbrYtcqnwAP7Gnuoxt4BlnnFKxcvfLkLbM=;
	b=etvN3fNfnLU4ACMJoo9xkjwYPEsrNLk2CgP2UizKAMQiUvVe0OLIbr4OvEA4pdQRE40k2x
	+OOn1lL+9MHBuvK3aJXFBtipJHqwXlGnGUSDSLmCsQ7tUYhTyT3LSQbEgopIW1D0uTBE79
	u2OWBCh6tuuLh25KctdbxmYn8kycd28=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-503-qx9TbXrVNYuVCuw1QEsuyw-1; Thu,
 04 Jun 2026 15:29:01 -0400
X-MC-Unique: qx9TbXrVNYuVCuw1QEsuyw-1
X-Mimecast-MFC-AGG-ID: qx9TbXrVNYuVCuw1QEsuyw_1780601338
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50A02195608E;
	Thu,  4 Jun 2026 19:28:58 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.199])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0903B763;
	Thu,  4 Jun 2026 19:28:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v18 3/4] rust: faux: Allow retrieving a bound Device
Date: Thu,  4 Jun 2026 15:24:30 -0400
Message-ID: <20260604192740.659240-4-lyude@redhat.com>
In-Reply-To: <20260604192740.659240-1-lyude@redhat.com>
References: <20260604192740.659240-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When writing up some rust code that used faux devices for unit testing, I
noticed that we never actually added the Bound device context to
faux::Registration's AsRef<device::Device> implementation. This being said:
the Registration object itself is proof that a driver is bound to the
device - so this should be safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V18:
- Add notes from Danilo to safety comment.

 rust/kernel/faux.rs | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..20ab638885354 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -25,7 +25,8 @@
 ///
 /// # Invariants
 ///
-/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - This object is proof that the object described by this `Registration` is bound to a device.
 ///
 /// [`struct faux_device`]: srctree/include/linux/device/faux.h
 pub struct Registration(NonNull<bindings::faux_device>);
@@ -59,10 +60,15 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
-        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
-        // a valid initialized `device`.
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
+        // SAFETY:
+        // - The underlying `device` in `faux_device` is guaranteed by the C API to be a valid
+        //   initialized `device`.
+        // - faux_match() always returns 1, and probe runs synchronously (PROBE_FORCE_SYNCHRONOUS).
+        // - suppress_bind_attrs = true on faux_driver prevents userspace-triggered unbind via sysfs
+        // - mem::forget(Registration) is not a problem; if the Registration is leaked, the faux
+        //   device stays bound forever.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
-- 
2.54.0

