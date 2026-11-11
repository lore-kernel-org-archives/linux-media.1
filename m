Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425059;
	b=UdVZoM/IJH+aciVmuJtDoCbShhOCDyQycq82CSFyQoL+1QVdKTTwJ42lvjeynKPsaGVs
	 fm0tWjP/WszLWhrEn/WAXng8p+cgf3ZxpHt+EEq6Pr5SYetjLScYsG5pJW3Hz8ewdYoHw
	 2yfHTRawYToNN53rv80Scy6W4vlDvbSVjh3XOk9ienE/GYMtmMOOaIBS1Pq0rVRd3BdAW
	 GQCQEP5IJOebxmUAXAcUIhPBcaim0DpWt1bMCrCawsOJmDWAZMZ/Wk8boTlATKTqYjJG1
	 K50Jg/w2y/vMnH2zUvcId5ABhIyYFyzWkMDGrNrhQVuz4EMfEQeyuqPBZ/XpQNG5adg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
	b=JfvspYZPz8cGWPrlURVZNzwAQCWps4H7RK6OnfulgjuD2XUGNRsAfIbcWnysViiBfuDJ
	 CUAXL6KlW2TiXftfRO6i4bDaEsvEM1F9S17Ky1gdk5Y6Q1VgIp4WyRarsg0SnV/wt6kN9
	 wkSZwNDfRFxHSDurks50Z1d/s3EMm8IDMGv/LkpwO86NDgVhPgmS6Njd2a4wFFn99cvXo
	 iy1fzyENn6rtbdD4QdMHv4EK+hriqG+KuiyPIPJArsj4ewi7xasDnolubRCSOdAkxAWDn
	 c7GrFXGYDJ2yw2mQeQmKuq+D/MZQgL8YNuily52VFMfOWawifP9KrGp7/vmMr71JP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFEB606A32D
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFEB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbf700ddccso2545493b6e.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425057; x=1795029857; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=KqDGXT6sHwxeuWqo8YplC2Ceb9xg+9zSmZThwIsQvt2GedE/QEV6pbzsu3tpPxAEbt
         fqrdrqCJioAudnnhcPnpgu0LgJI1yN61YRZkFlgh4B3aZFjxfmiidRDIVL7fvLq1UVOq
         MvK9Ou3hPvxDpyg1iPrWSuO1kPKdk0MItTwB21eYhGOAu83p8l1FwjdL7G2xpl4EsPRv
         oNbOIZ5tZGO8pwExlshG31m5aRc7+6TLjfnGqIU9fzQQDPhc4iNA6o2m803h4jOHtL40
         QrV/hM01WPvp0ygNA8B2ZzQdG4Z+6lH1t9q3hekvBRIuhrUpss2kHVS6P250crF7pp9M
         vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425057; x=1795029857;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=UwfGiMKrnaZNcaTZ6aLaeYELC6prXZAvBDUSjj0fuKgurR2kcYlgY3N7Tyv0vAhdMl
         cQS95TYW7/alkk9XqS2IsJOpo8pqHoZTiXc7PnPMhPMzhOW+jBaFSi7KO+wHfQOY9JWo
         HZ3Dl6fdLHSS4LHlY1LjRFG4EFwtX72nXo4HP+kZNJvd+Sd0laxBZxZQSn2scdW/MesL
         yOcgx2iGW8NJdWV+Gs9Ckz/SdaEKy4EZW/sY/H/SOva2wo1tlkHkm7kFtNep5TFnziK+
         fZ8lXIAfHLqqUGaqYVvi48MlhG+W3P1VBx0pdcerW0lUP3xX7AzI+I6QwzrYFE9+OAY3
         vQUw==
X-Forwarded-Encrypted: i=1; AL+hErFZ6B8xpaRDHIux6WFbHjABQsx77u9+GayKqMPtxnsrNt02zZv/DL6w5zyFaVC8b5c3rvETLAbngQwrBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82VJ7Ef6HVdimzFqRvxH5lVVhe/1juP/DJTiUN8jAfhPVNAFl5
	HUQm1pU49etBIRQwbOuFy5UmH2dV3nGHdyUHgILK0SjqZ7tUDNy6Co/NvoXM24poimVBLOjQFAn
	tM20sa8FlvJx9hQ==
X-Received: from ilbdx27-n1.prod.google.com ([2002:a05:6e02:421b:10b0:53d:3ab5:58fa])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1382:b0:567:f784:f939 with SMTP id 5614622812f47-56b9791019amr2605655b6e.51.1794425056843;
 Wed, 11 Nov 2026 11:24:16 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:05 +0000
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
Message-ID: <20261111192411.4133780-2-dmatlack@google.com>
Subject: [RFC PATCH 1/7] vfio: selftests: Add vfio_pci_find_mem_bar() helper
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

From: Mina Almasry <almasrymina@google.com>

Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
a BAR) of at least min_size bytes that behaves like ordinary memory and
can be safely read and written without device-specific side effects.

Detection is backed by a table of known devices, starting with QEMU's
pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
membar-backed=on.

Suggested-by: David Matlack <dmatlack@google.com>
Cc: David Matlack <dmatlack@google.com>
Cc: Matt Evans <matt@ozlabs.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     | 10 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 67 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 007adc322c1e..19d458adba1a 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -15,6 +15,13 @@ struct vfio_pci_bar {
 	void *vaddr;
 };
 
+struct vfio_pci_mem_bar {
+	struct vfio_pci_bar *bar;
+	void *vaddr;
+	u64 offset;
+	u64 size;
+};
+
 struct vfio_pci_device {
 	const char *bdf;
 	int fd;
@@ -162,6 +169,9 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
 }
 
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar);
+
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..d5308fe61490 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -19,6 +19,7 @@
 #include <linux/log2.h>
 #include <linux/mman.h>
 #include <linux/overflow.h>
+#include <linux/pci_ids.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/vfio.h>
@@ -245,6 +246,72 @@ static void vfio_pci_bar_unmap_all(struct vfio_pci_device *device)
 	}
 }
 
+#define PCI_DEVICE_ID_REDHAT_TEST	0x0005
+
+struct vfio_pci_mem_bar_desc {
+	u16 vendor_id;
+	u16 device_id;
+	u8 bar_index;
+	u64 offset;
+	u64 size;
+};
+
+static const struct vfio_pci_mem_bar_desc mem_bar_descs[] = {
+	/* QEMU pci-testdev with membar=<size>,membar-backed=on */
+	{
+		.vendor_id = PCI_VENDOR_ID_REDHAT,
+		.device_id = PCI_DEVICE_ID_REDHAT_TEST,
+		.bar_index = 2,
+	},
+};
+
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar)
+{
+	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
+				  VFIO_REGION_INFO_FLAG_READ |
+				  VFIO_REGION_INFO_FLAG_WRITE;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(mem_bar_descs); i++) {
+		const struct vfio_pci_mem_bar_desc *desc = &mem_bar_descs[i];
+		struct vfio_pci_bar *bar;
+		u64 size;
+
+		if (!vfio_pci_device_match(device, desc->vendor_id,
+					   desc->device_id))
+			continue;
+
+		VFIO_ASSERT_LT(desc->bar_index, PCI_STD_NUM_BARS);
+		bar = &device->bars[desc->bar_index];
+
+		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
+			continue;
+
+		VFIO_ASSERT_NOT_NULL(bar->vaddr);
+
+		if (bar->info.size <= desc->offset)
+			continue;
+
+		size = bar->info.size - desc->offset;
+		if (desc->size)
+			size = min(size, desc->size);
+
+		if (size < min_size)
+			continue;
+
+		*mem_bar = (struct vfio_pci_mem_bar){
+			.bar = bar,
+			.vaddr = bar->vaddr + desc->offset,
+			.offset = desc->offset,
+			.size = size,
+		};
+		return true;
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

