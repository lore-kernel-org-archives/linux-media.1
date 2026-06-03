Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECD39A4BA
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516347; cv=none; b=clz0RQLK/7VLHPCtK8jJp6aYZU0kpjFBozz5Yna/wsBbkIE/KFhIHk3mzVvIciahJqQZOuZpn1KQdpC55MmUDMTeMx+taeNM0zHQnJmt+gNw0DzxN+vsHfiH5F87ZTrZbcbnv+Ce69X+ZncKMhFAzI78GAGGKN+aMcZMWfeEWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516347; c=relaxed/simple;
	bh=5dOvv0WLnpRp7nMo9jkMzo4N0jRTl5O2s1c8Y7EYNSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpFj+tfWGYBYVDJ6Go/71YIHrmVN//l+e3HoauujSCwU5Qcb9IadYIoplhggeIlu5rs7kdkch5FnlOXQdCS+hfKgQ+p7+rVRHGWFvSpWGDTLnzQMObRGP7/qTKz7yEkqtxOn7TkTGCxvJ/HqQ2KFIvnznYapKPqxFAohc4RcaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y2jP61uJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y2jP61uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vC0884TFGI8xcRTHrhisOj99/ctfzN8aXTcnfaQWb7c=;
	b=Y2jP61uJHlo4Xzj5+qEo3cGTRKZpxM+2VbNVp0uFbNho2RdYpRaUGt0PBZeNhxw11oGyz+
	2+KPgtLgGNSru0106vxOmDzeg5apJ+vIwVBnGLeRB/bePGauTlOpYFhqvpK0Eo4HIbvcKC
	3gerHjlq37E+V8kLgyfyfYfv04/53fA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-GFspQ-wiNgKsCPGLsbKKkw-1; Wed,
 03 Jun 2026 15:52:21 -0400
X-MC-Unique: GFspQ-wiNgKsCPGLsbKKkw-1
X-Mimecast-MFC-AGG-ID: GFspQ-wiNgKsCPGLsbKKkw_1780516338
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2A5719560AA;
	Wed,  3 Jun 2026 19:52:17 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2697E180049F;
	Wed,  3 Jun 2026 19:52:13 +0000 (UTC)
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
Subject: [PATCH v17 0/6] Rust bindings for gem shmem
Date: Wed,  3 Jun 2026 15:42:29 -0400
Message-ID: <20260603195210.693856-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Patch-series wide changes since V15:
* Fix some major rebasing errors I somehow didn't notice :(
* Drop the dependency on LazyInit, use the trick that Alice suggested
  instead.
* Fix dependency ordering so that Tyr can get the vmap stuff first
  without the other bits.
Patch-series wide changes since V16:
* Fix ordering one more time (SetOnce::reset() doesn't need to come
  before adding vmap functions)
* Rebase against the latest DeviceContext changes from me that got
  pushed.

Lyude Paul (6):
  rust: drm: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: sync: Add SetOnce::reset()
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 518 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |   7 +-
 rust/kernel/sync/set_once.rs |  60 +++-
 3 files changed, 563 insertions(+), 22 deletions(-)


base-commit: 723bd79ca9e492cc91850094a2892bde0345c51a
-- 
2.54.0

