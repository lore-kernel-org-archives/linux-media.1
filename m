Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524349;
	b=C3Ldtbm2UOLz7T/DKR6cedQN3pqNdaHYcqafEPeA/wWhsCoIE0/85n/GDRDsRxCASE1P
	 DJv//GfPqDdbRA3Y8auEaPZlNxXar+N472LLgAZvnGFPjqlpWxuHy+M2D8Spsa+D+ZErD
	 QtVzjSMmQgJ/fFgQ0guqrmEURpvxz3P1UVVxclnoxmUQJGmOTfNzdOSeUJ4lq2NBdlMjz
	 gkvmd7gW43xHPjsxD/71KpNeJEbharIH5vbHKHmO3lDocw3NpqdpIXWwH+YRa3ABZ4X+8
	 Wz2PJUZ2Zk0Ucqq7Il7Ib7Victl91yqT3jDYPt5F70X4gGwCgA3jtZztPHRm3RO3laQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524349;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
	b=0MhgItk3VkWRRUkVSWHOwugA8fr6WjVPsGfJvwb1/roZ7fSSejNux1CR1xyoGg9l4jwd
	 4Fvzu3X6Tl6m4QfHFUIh2/WEQ4IOLn6jJ3yeDkJWFUxEeG5P/wlia9pOFBKyeujaAElbT
	 D+1JA9zyEKtbYpLcxyB6eewvSm3IbYAYxKGpFerdCzVCnHpTQdBRJRe4uwArww5Bcmq8v
	 D7Zr2Bbb/Bq7dMQ9xKO2yE8CUb+B3eIolHt0KglFpglIxq45rvIq5dAz4ydzUHkp/s0aK
	 FXzWCRpkM6eJhVKxlxgfAZ/Hkje+TLOq2Cqgjj9UjiGc6pVTkV+u9mLvlwyOHPUAy3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB303606A33E
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 22:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB303606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b308fca7c3so3619957b3.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524348; x=1795129148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
        b=F4pc0Ian5n0txKA46r0aamQ8m81jT6Wjvj0sEk19b/645TqrXUkUn2a7tOfmv0HNhr
         JorcaYkBgWcKvc/FoqsiczA+IIxSkxlFeQ9ot/Zj/ynr5k30DRc9eF/ypsbZu8Sag8Us
         PHxtQLzhcI5bOjrVaA/oDKDj98rXW2XrcZ0Tgtni7F9lli1DUS2IQsWOKa1+hhn3e6jQ
         KxL3Iopm9OZYxvutkkHpB1qgty6isfINwk/J/+Uz1+QX7zpSKcJke3xhPV6Y+bFx/+y5
         AQr6OQICddggErv8TDt/a54TwcBG4KanHRNtSSNObr9SYaCv1LG7Kk6GG9glo+woGrIG
         /HRg==
X-Forwarded-Encrypted: i=1; AL+hErHdGmm9D3RZvPNC//t+5fJn9MPszX4aLdJuYzw4NQf7nwXC8SIcHLXSHJkwCWTVmzF0SXwck8ablgMODg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8h8eO1T0VV+pcGiaspqzPbqacTO2pVuLdQ/lT1M56KG/gwShkc
	f7eROtCRcuTpthfEx/I54zb5iHJ+88Qp8UTTqKDavCOxneu3kwAp0XH/
X-Gm-Gg: AYBFou2gQbH+abCANJq65YehbsbpHY6DFflfEFt+A1biUyVVBiYUhuIQ3pyUsMi/HmD
	SlYCURq5I0IeA4L0R/igGEE/tZf72QY2PeEc8bom+qiWGR5HpEMXzTqUTtqM4m2O+0c0X0rSaah
	0Fl/SvQ/wFNz+XwpVVisrFStZvw/1Q1yr68JXKt0ZYGa+6uuk6N21d8yo8cin7Rz988PytW+T9M
	izy1ai4WC9KKhIKrY3eAnfwSzvpIG4aVILW8aJdDYUazJmrPQUUK2EbG0z/4fxT/D+eYjMYn/Hj
	1sdPgzCfFt4zioNudCA3HyfnPjZAT/v2Ite5F0iLq27+9Xug1tE+E+qPWvIGKLiwpbmbCQo9Pkl
	2gj32b7WpdBOjM22KkzU1bealnDevT46zUyipvr+gaX6ol6Yqjyy5ZzvLG57MVFjMALqnegADhc
	9JQRs/m86TyotTwmaRAUwbb8AM7arolFzzZOpa7VrMcv3XU36bPTXBlvQES3DCZu8AaeiLS+MLa
	8zB9p9+4HGYip2OvtCxVe031JEw0jBJ0dq9MjOxavK5FiMlCQuFdwH9H810XNTWriqOOL0KnO88
	0qey9PwqCB8pz5pHUO+i67Ri9qgEhxk0o2n1Ob+QJi0HK2CWNOebb1dIuZzVTF2Ypzh/LPS7fOs
	NO1TYLoZE8ESYlcLZJ0aYSSRuM0XsIBolykW3NswuLK47cCUlZ/Yjq4T4/N8vydTvQNziZ0awpC
	cEEGPXo0oISD+sCKhTOAtkWbp0
X-Received: by 2002:a05:690c:c189:b0:8b3:5f41:3c3c with SMTP id 00721157ae682-8b4aa233286mr6243907b3.17.1794524348062;
        Thu, 12 Nov 2026 14:59:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:07 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 17:58:51 -0500
Subject: [PATCH RFC 01/13] drm/gem-shmem: Map pages for the DMA device
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-powervr-sgx-v1-1-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
To: dri-devel@lists.freedesktop.org, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
 Gabriel Gama <operatingsystemsdepression@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

A DRM device whose DMA goes through another device sets it with
drm_dev_set_dma_dev(). The DMA helper allocates and maps for that
device, and PRIME imports attach with it, but the shmem helper still
maps and unmaps its pages for drm_device.dev, and
drm_gem_shmem_prime_import_no_map() still attaches with it. On such a
device that is a struct device without DMA ops or a DMA mask.

Map and unmap shmem pages, and attach in
drm_gem_shmem_prime_import_no_map(), for drm_dev_dma_dev(), as the DMA
helper and drm_prime do. Nothing changes for drivers that don't set a
DMA device. Of those that do and use the shmem helpers (gud, udl,
gm12u320, appletbdrm), none maps an object's pages through
drm_gem_shmem_get_pages_sgt() or imports with
drm_gem_shmem_prime_import_no_map().

The first user is powervr_sgx, later in this series: behind gma500 its
DRM device is an auxiliary device, and its DMA goes through the GPU's
PCI function.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a3..4bce0a716 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -175,7 +175,7 @@ void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(shmem->base.dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -535,7 +535,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -854,7 +854,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev), sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
 		goto err_free_sgt;
 
@@ -964,7 +964,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 		return obj;
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, drm_dev_dma_dev(dev));
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 

-- 
2.50.1

