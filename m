Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425063;
	b=YAdkqABUQ+b1oUyk8p+yNjrIIBpp6cQAm6qnwYLG4Y+jzebWYn+P37/JgIajsnaI+XOV
	 50kAjwIPAzlqSQzQLK9aAtDiq9ggNGcAD+Srgxz9/Yy/tqoeOyqFZ+YJ3IH4wA7LGFMkU
	 KJYcRywxndS4ZpomjeokMBD5jZs/Q7c3pqf+6WC6RPmosEMuBjzZ1IySVs0BZ7pJVU2q3
	 JF5BiwT+l76R7eSpCTOGdWanrMZ9ScWiYdrC2MvzpC24XBa2W0yX/9TorkF5Zv/NyXznR
	 8OQg5kFW9jbbfRT5O7hywcABKKAk+LTyE/jNJC38nkqfb2URFcA/3Dbu+Di14gSP5lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GZrkVSPnOLbwhYzrPljddPiSGOm8sAR0nI/sR9X9KfM=;
	b=FpLnDbzPAe7qQDpfsKOaiJjx6Qca+pN1hWR5WFDoL/piCrC1WzvH2IEkSK/GZIzumZob
	 6MZp5eA36WgPxDDrJIZIsNI2CfKac/cDTabWLZHwhV/sp/hCGoS+b4uDWkhoq9l/9W9E5
	 T8rVIaKMi5d6rkRxm8JXdClGksCZFAcOGjtE6ffh51jF2aakTg6I1ithmUFS82MKOjdMC
	 Jb2Z20GqmyB0k9QQt4tyXbFrAl178V3nsru+XFvzY7W/OWqqqOhLY6tWYY4/Tp7iAp5VE
	 TH5Tz/6sXPeng0uW6Ci+U1VQgRh1hXUZCf4Igo5glQU5khwch3tDUKVZaH6EDEs1/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C8mJidRl;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE69606B5D8
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE69606B5D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C8mJidRl
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c467e19391so5248702b6e.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425062; x=1795029862; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZrkVSPnOLbwhYzrPljddPiSGOm8sAR0nI/sR9X9KfM=;
        b=C8mJidRloxlSfZbT6vz1c4ZNIn+miuKpjO2mPIxJ1PT/KnTuIZ3U1UGeEJKxQl3bI0
         EYvIa2/QIpzwaxDrjivW3Y73fFtq6G/Ska0GFJhtdxumBfEPZd3qejbghifrtttYw90x
         rf47GmsJUp7ipGL8m72MwqJMJpHvg5RRshIDEpbZm6nttL9298GyyRtlK2XUEDzueh6C
         //8cVyO1I6cqy0k+v2dqglVMOUdferTx8y0HlXQzJfwcs+tf/QI7NpPoeH3Fm63HlHSe
         lA4lKR+ySUQSFGM15MKxl6yKTjwAk+FRtubeC/4iTVxNKZSGc3H7e9C52oxp102WBmUb
         PkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425062; x=1795029862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZrkVSPnOLbwhYzrPljddPiSGOm8sAR0nI/sR9X9KfM=;
        b=jhB9QU/O5U8Vo0GT+DCGgfghj4ELlWrGG5a2zZkRfUcAPStvCnfiGbNWN4g17sMWCn
         lJYqq2CQsoH57jIFpnzkTOlGvTowTnzxAz/tE4IYdYx7m/BaxM6Pcmo8caCLNUDxaq+s
         +Ip5NG5IkWCGBE5oEg0SUIQjxYk2x1Hyr5Xz5u82WYXtkV/f6a/XVr/yTnL98p88swZo
         613R7bLjiB89foOF6t99GTCb3nlId6+EHSdqqWd+6pGANImFzhIniLAw8RViNSqBLxL3
         LvHg7B9BzVMSY033mxtVSdX38Ldy7/ciKwMWxK0p4nsGSJ9L1t32DzZ0g9+v2GVDOJvW
         tT5w==
X-Forwarded-Encrypted: i=1; AL+hErEpsSXgUjY8je2Fu9fE+/OmTy2RYZljYIjG7bP56XHlexlsowtnq5P9y7sQQG3MJCzZMcUK3o8bKDmu5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VB36kU7G7aQF+YYmJKEohnXPg9WCSmXN8ZuYARQDRpxCuP236
	9ZRgAXuSKuFNTnWHj2MmVJbMNvMhZrPb53u+lUUdrc8CL5znwEvOF3DJ580lgOb50tNs66DafLo
	8yzG11CxECuXDLQ==
X-Received: from ilbec1.prod.google.com ([2002:a05:6e02:4701:b0:527:120b:a51d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:191f:b0:53f:3c0e:c74b with SMTP id 5614622812f47-56b93447ed4mr3152606b6e.9.1794425061950;
 Wed, 11 Nov 2026 11:24:21 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:09 +0000
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
Message-ID: <20261111192411.4133780-6-dmatlack@google.com>
Subject: [RFC PATCH 5/7] vfio: selftests: Add iommu_map_file() helper
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

Add iommu_map_file() and __iommu_map_file() to map a file descriptor
(such as a memfd or VFIO PCI dma-buf) into an iommufd IOAS via
IOMMU_IOAS_MAP_FILE. Also skip regions without a host virtual address in
__iommu_hva2iova(), since file-backed DMA mappings do not require one.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          |  9 ++++++
 tools/testing/selftests/vfio/lib/iommu.c      | 29 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..2b39c49e66da 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -42,6 +42,15 @@ static inline void iommu_map(struct iommu *iommu, struct dma_region *region)
 	VFIO_ASSERT_EQ(__iommu_map(iommu, region), 0);
 }
 
+int __iommu_map_file(struct iommu *iommu, int fd, u64 file_offset,
+		     struct dma_region *region);
+
+static inline void iommu_map_file(struct iommu *iommu, int fd, u64 file_offset,
+				  struct dma_region *region)
+{
+	VFIO_ASSERT_EQ(__iommu_map_file(iommu, fd, file_offset, region), 0);
+}
+
 int __iommu_unmap(struct iommu *iommu, struct dma_region *region, u64 *unmapped);
 
 static inline void iommu_unmap(struct iommu *iommu, struct dma_region *region)
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index b6f3c5c84e01..ba602685f892 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -71,6 +71,9 @@ int __iommu_hva2iova(struct iommu *iommu, void *vaddr, iova_t *iova)
 	struct dma_region *region;
 
 	list_for_each_entry(region, &iommu->dma_regions, link) {
+		if (!region->vaddr)
+			continue;
+
 		if (vaddr < region->vaddr)
 			continue;
 
@@ -149,6 +152,32 @@ int __iommu_map(struct iommu *iommu, struct dma_region *region)
 	return 0;
 }
 
+int __iommu_map_file(struct iommu *iommu, int fd, u64 file_offset,
+		     struct dma_region *region)
+{
+	struct iommu_ioas_map_file args = {
+		.size = sizeof(args),
+		.flags = IOMMU_IOAS_MAP_READABLE |
+			 IOMMU_IOAS_MAP_WRITEABLE |
+			 IOMMU_IOAS_MAP_FIXED_IOVA,
+		.ioas_id = iommu->ioas_id,
+		.fd = fd,
+		.start = file_offset,
+		.length = region->size,
+		.iova = region->iova,
+	};
+
+	if (!iommu->iommufd)
+		return -EOPNOTSUPP;
+
+	if (ioctl(iommu->iommufd, IOMMU_IOAS_MAP_FILE, &args))
+		return -errno;
+
+	list_add(&region->link, &iommu->dma_regions);
+
+	return 0;
+}
+
 static int __vfio_iommu_unmap(int fd, u64 iova, u64 size, u32 flags, u64 *unmapped)
 {
 	struct vfio_iommu_type1_dma_unmap args = {
-- 
2.56.0.567.gdb80ae8cd5-goog

