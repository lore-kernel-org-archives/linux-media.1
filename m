Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425065;
	b=M8rdbDc6nFgFVtb5jxGd3XdiYoQtdeRYpYMx9csUNMROVvs9zFusVcTqEYGTdSX4DWId
	 /4Wl3mnlEgt9+GZ1Wc1hBhhTgTpnH5er7vggnmUcHkbGM7iVgc7qrrQv2sjbJOnHZHh8O
	 qz4DzA1kFpgC9SP1QNMpl0HevZX7mhQY1l+WbocHv4rItDzUrRRKEIsV7Gr8oFGZaqq54
	 W3Ha6hT1VkZzua8px5oeP1RITSLpSSlGiXBujmMArmL9syvDnYgE4q+a64JIHXJW9x5VB
	 S418hoP25z0wShsHP0Nxc9XdLVWE6UQqK0kpq8PoRvA/e5j84TG2ungcR3W1X0eJnhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=S4+DQ/5hS2/5UfXO0mi1ZgFeMRsr05x8y1FYZlBsi/k=;
	b=L+tCvsDxmktP3H3b1JAz+vx/nTLT/aVjnoexLgsD7ohx0CVKGXJQHtvsfu2/f9NNvxuw
	 boBoc/iX19lIqYd0k+fG5JpzyweaosZfwszjNPAhzDAN6xnAOGO52X3RCBYLhExHuw1u/
	 GbD8JU5nMQrHKzOCI+LLnYnJR9ghBUFWX+AhheZ1cqCAh44Pv02+1brLOIf+nSvUnn3ZA
	 tBpmn9tC1rx6bu/3vTtGrhQP05A5dDQXlcRKHLE7rBRAvnIRhRRNxltWHQlCnVKvEssmt
	 YEo7RKPrygz6oDycR+vULqcKqKM6WPzsxVRcYLn4nfVyd36LIzzBSgBOa61T4GTTLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="lM/CPmgi";
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90812606F381
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90812606F381
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lM/CPmgi
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83c2311eb1dso5148435a34.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425063; x=1795029863; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4+DQ/5hS2/5UfXO0mi1ZgFeMRsr05x8y1FYZlBsi/k=;
        b=lM/CPmgi2MxnhCIljbY1J6j5HJCMMekv0//LIx4rqPP+rmTASzEwn/BZTlI+Fvfwof
         f5lzQB0rVXFPhPx5zlOmCXnEZsPPgqwyajdOHm2HucaXGcohS4WqmpNnnr0r28fxAkpE
         lg/UcKD+gr2bXmw6OtsYfNTumii+2oGuZptwjhXEy2C8uOHAWNG0YYDFtvZLbBscAarT
         KRjZxsb4x9C8/ukL2U6mxnyYxFXQQR0ZKVLlW4ebshXJs56UjXEXgV5bCqzi520CgmbZ
         ytScVeEa8/BkQ5DOx6FUZPGNcU6+g53Tsl0ljpXVfOyoViGc3s7rFDA5dCAACnp88HpA
         e5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425063; x=1795029863;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4+DQ/5hS2/5UfXO0mi1ZgFeMRsr05x8y1FYZlBsi/k=;
        b=Xn68LOMyxWNhuS05PSpIKf0T+HQuGb4t8bRA6tgyhccpXEpLYPKXxjIxOIh+mJJAlv
         pIAWIjrvc7n/4eh5sLqTyVrDHqOXITG+npJ4Xf/1A6AD0NKJ23+mN+FFtT/2PLxytjzs
         0gbmgfSHHatWL75xu+w6M0mV8dH/7MZz8wrHZEE4QEzPUgBXRMd6Dmdf4uI9M9pF8o+H
         tzuYNv6ozD8MPmdiDZGozSPNzOFCrnI1oXx1tBTPIl5W7hMfw11i634m66M3W+ARULKp
         lM2bnITKYvYNi/ItnTI1hOl9tTQge+00o2EUagtK7uD4uy6awwTA61odbVjSxH9YUNUe
         1fzA==
X-Forwarded-Encrypted: i=1; AL+hErF4LKBikFuJjMWC4DYIy6JMQZouEqb1QswBGAJBQIrhvDMXhWBTjE/VblqyF+1BQbi5XDiNZMdwDdp0PQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iNqdHP6bEVmbqMxVWSmLFCxHLYmttgmShAgTfA/BlzTMKj8Sr
	R0Loqg/X4Cg0LW2PMe06Dfcwk2Hv8zsyIO/TRsALJ8nkUEAbgd19HzmXnL2kcDRYXqldcDNR+uD
	/BMo8TIJIjMg96w==
X-Received: from jabll4.prod.google.com ([2002:a05:6638:9804:b0:61f:e4cd:8716])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:318a:b0:4af:5d69:1cb4 with SMTP id 5614622812f47-56b96ad0615mr3028788b6e.15.1794425063307;
 Wed, 11 Nov 2026 11:24:23 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:10 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-7-dmatlack@google.com>
Subject: [RFC PATCH 6/7] vfio: selftests: Add vfio_pci_find_p2p_pair() helper
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add vfio_pci_find_p2p_pair() to locate an initiator device with memcpy
driver support and a distinct target device with a memory BAR of at
least min_bar_size bytes from an array of VFIO PCI devices.

Factor out vfio_pci_has_p2p_path() as the central place to validate PCI
topology and P2P DMA reachability between the two devices in the future.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  8 ++++
 .../selftests/vfio/lib/vfio_pci_device.c      | 48 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index fd130f680a2d..9bda93712859 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -42,6 +42,12 @@ struct vfio_pci_device {
 	struct vfio_pci_driver driver;
 };
 
+struct vfio_pci_p2p_pair {
+	struct vfio_pci_device *initiator;
+	struct vfio_pci_device *target;
+	struct vfio_pci_mem_bar mem_bar;
+};
+
 #define dev_info(_dev, _fmt, ...) printf("%s: " _fmt, (_dev)->bdf, ##__VA_ARGS__)
 #define dev_err(_dev, _fmt, ...) fprintf(stderr, "%s: " _fmt, (_dev)->bdf, ##__VA_ARGS__)
 
@@ -171,6 +177,8 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 
 bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 			   struct vfio_pci_mem_bar *mem_bar);
+bool vfio_pci_find_p2p_pair(struct vfio_pci_device **devices, int nr_devices,
+			    u64 min_bar_size, struct vfio_pci_p2p_pair *pair);
 
 int __vfio_pci_dmabuf_create(struct vfio_pci_device *device, u32 region_index,
 			     u64 offset, u64 length, u32 open_flags);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index eca6eb13d7f0..16fc98ed170b 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -378,6 +378,54 @@ bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 	return false;
 }
 
+static bool vfio_pci_has_p2p_path(struct vfio_pci_device *initiator,
+				  struct vfio_pci_device *target)
+{
+	/*
+	 * TODO: Check PCI topology / ACS / host bridge support to verify that
+	 * P2P DMA transactions from @initiator can reach @target.
+	 */
+	return initiator != target;
+}
+
+bool vfio_pci_find_p2p_pair(struct vfio_pci_device **devices, int nr_devices,
+			    u64 min_bar_size, struct vfio_pci_p2p_pair *pair)
+{
+	struct vfio_pci_mem_bar mem_bar;
+	int i, j;
+
+	for (i = 0; i < nr_devices; i++) {
+		struct vfio_pci_device *initiator = devices[i];
+		const struct vfio_pci_driver_ops *ops = initiator->driver.ops;
+
+		if (!ops || !ops->memcpy_start || !ops->memcpy_wait)
+			continue;
+
+		for (j = 0; j < nr_devices; j++) {
+			struct vfio_pci_device *target = devices[j];
+
+			if (i == j)
+				continue;
+
+			if (!vfio_pci_has_p2p_path(initiator, target))
+				continue;
+
+			if (!vfio_pci_find_mem_bar(target, min_bar_size,
+						   &mem_bar))
+				continue;
+
+			*pair = (struct vfio_pci_p2p_pair){
+				.initiator = initiator,
+				.target = target,
+				.mem_bar = mem_bar,
+			};
+			return true;
+		}
+	}
+
+	return false;
+}
+
 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 			    size_t config, size_t size, void *data)
 {
-- 
2.56.0.567.gdb80ae8cd5-goog

