Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BE371CED
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695830; cv=none; b=ZEr14LOgd0R+TD9qVtyAgi9D4A/jiw23C7kgHkStY7OvQtjpl6lwoyk/3I35oB7LTRs97kB7mGnZT1kb1GdJSoi8Yvtmfb574ph/5xJ0twJxI0dBWSufrRR3GYg4dELOMMJrRuswAWWP0PECV3ULP9qNiXB8RbLy6omYD+qel7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695830; c=relaxed/simple;
	bh=yL3TycTJXsCqPKAGWgsWC/cvzljhsXBJ8YKdz//PIZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=he+2gHnZEbFj3Y6pG3GeAXB8Df18AAzHEA6djs3+yvExVcL7DAa9MjKYyiXOAm5MyQtoRE+Mlwz385rsPajRgRJn41yc2ONe0kFsZZE3j0/A19uEW25pFUTQmYQTWwAS31O+EIY1aO+c7rxSU75S/BWmzOVWlSZmzeXdUbeD7XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQWKa89X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQWKa89X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
	b=eQWKa89XpFk7m1GFHckd7Xc2sH87OEGQAqpKojAU6/xnPDZqIpalv/yx10JpOhN6+NUnuT
	VvX/3J61KDU+QBPy+134XKKlr2o9xwkoVRDjxhjq7koU1Sgr86VGpS0edKecNCCW7q465c
	Wz+INvyHmacON//ob0luiu22qOVwmQw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-o20v4gqpPPKn-CQ1Ojo1cA-1; Mon,
 16 Mar 2026 17:17:03 -0400
X-MC-Unique: o20v4gqpPPKn-CQ1Ojo1cA-1
X-Mimecast-MFC-AGG-ID: o20v4gqpPPKn-CQ1Ojo1cA_1773695820
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A2D719560AB;
	Mon, 16 Mar 2026 21:17:00 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA9F11800594;
	Mon, 16 Mar 2026 21:16:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com,
	Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: [PATCH v9 2/7] rust: drm: gem: Add raw_dma_resv() function
Date: Mon, 16 Mar 2026 17:16:10 -0400
Message-ID: <20260316211646.650074-3-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
References: <20260316211646.650074-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

For retrieving a pointer to the struct dma_resv for a given GEM object. We
also introduce it in a new trait, BaseObjectPrivate, which we automatically
implement for all gem objects and don't expose to users outside of the
crate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jananu.net>
---
 rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 94e7c2a7293d0..bcec62155c02d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -197,6 +197,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
 
 impl<T: IntoGEMObject> BaseObject for T {}
 
+/// Crate-private base operations shared by all GEM object classes.
+#[expect(unused)]
+pub(crate) trait BaseObjectPrivate: IntoGEMObject {
+    /// Return a pointer to this object's dma_resv.
+    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `as_gem_obj()` always returns a valid pointer to the base DRM gem object
+        unsafe { (*self.as_raw()).resv }
+    }
+}
+
+impl<T: IntoGEMObject> BaseObjectPrivate for T {}
+
 /// A base GEM object.
 ///
 /// # Invariants
-- 
2.53.0

