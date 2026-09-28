Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398038F233
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573961; cv=none; b=co9xvyFTzOXYUOzgUGW7uLNsbIIMNQpWfj0hoUFlj5oAVRUcq+P92Cfq7jBz2rmzQ+Uw2KIZYYJC7TRqh2Qaq6sZ1m8FuJ9uUpv7wmHUMunxNPMpsdGA4kQQYyb5yHgQ/a7hEJINeJ7oP9QE9uGu1ie/fDRXySdu/QXZJBGsaaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573961; c=relaxed/simple;
	bh=qDHuxNQTwiK4vLrjxltnQ7pSPnmhxpgaO7APWc3qf9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uvbtbty5baKTL6Xwwc/a/EUjmYl+OwdN8gmChp7qJmtea0+zB0sIsrS5poFhDQDSGNUed8mdBotMlyy6KO7Ogo2YOMpMi+FQ4MAeOOsTcuiYmHeZ3zsgBcQA/eWHYLf/ib7i3hfqzy535w8uBYe9O/INd1IrpgT5FFS1tBSfj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS5Xtrc/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS5Xtrc/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b51649c7eso53386b3a.2
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573954; x=1791178754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=JS5Xtrc/fcTbE1IGkEwrugUcgBX5LGRv/ArjsCtzu7PLZEfGPh7hklWpYVfxTQm0C4
         +psv5gvNUVP7Fr206QLvIhuwpsCw40+ZrgBansxXc6j/k5GJ8IqVZUmI0liZpASU+Hzp
         GAHHf9QdHUgaAA+PrzOHIl+l0yS8EAOLRK3ltLGf7SU+CmWcFQKPJB5mbzkrcs5MURIz
         4ysu4axdfSSo808d3X42Fzeq3Q+rzvsmG/DQwLQEBCNQ3gkyhuQTohQvKrz/+iDoM9EV
         SoHT+VUDUqCOCsKiwRq5GcABx6DwWsSESVFpNB3lrVWDhh+ARDF+u7RwsZ3VaSHOPSWy
         O7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573954; x=1791178754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=OgK0y4TihZu3/Kvs8OY1fYOKP757AZSr4jnK7oi/ukZo8LSsXVmwiE6AlTu45fJOWv
         HLl/rwbAGOnaAZMelSk7N72Phr8WP3lT9soUNPZhHXmq/SBGVdDXfqVIVADskXLMSMbs
         VSPFkD2OGhHqB4EL7nd8c3zLESJAwsXB5whPVtonVifO1oRKI8dqXRn/INSyEE8K7ucg
         guZC9i5g6vBEPwNKxB9ocRihcZ74j41e7gZekxBq/qQdcAtWQzWWYnBnoQBb7gG3NjLW
         VVP86kqxqC+lajuupSrTfPjCmQ0PIlTa5QmM8kZLSgJ2iaBoVJL2Cfd+bThC9s8Z1x2p
         msLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5dLkLP/rIe13xOR8uXEqxVZPNDwi8H65RqwG+TQgRaQ0mS1i29NJ0BZ0H1ssHl9hqI3AReCO5N+Vsvw==@vger.kernel.org
X-Gm-Message-State: AFuF++n/HlGaP1R9XxFVp4N5B2Y82HM7LDxNlh5E6p0wTcaCQxkDUusT
	vA7JPJAPTH++XFF2Pd2P9f5KV+CqjU3XcnmHSY3yTf3glwzegqbg3NU6
X-Gm-Gg: AYBFou2JYD0aNGrXDzXhNcTInvVfwQEqwzVHsMdOQTOzf+iEdkzN+7v89H+lk+aiXTJ
	Q+8RHoeGAmUv10dy/kyMLilmz09NicdFHpAw/zWoA0BKiUGigw67B6O/woB/MSyRii5RuLv/W1Z
	QckSQxfoe1+tVYJ+Xizo0RdLOFtHyYJTfHcU03yExc0q+kLkDudMINgu+0xkqWTKTAn5S/87guX
	xd+WZLhPcFLEH5kIQ8UlFcUZyLmPU1jmzKQkihN5Z1kncDrQYiDbxEBQea0jczALUsW/e+wc6L0
	0utcUlPue0mjdwK4oyJ4DEhMX3fa/EzayC33/Tupk3gbJq08eE93ToVe9ZLw8/oaDj3QgmXs4vd
	ZP4DgRKlaIb6DrOFS4chPeTd5emrwqTuIW8XbIcvyFoY/MCK3XAqKTUAF0scrwQfWvUL+tnNbAv
	qc8srr4zTQsC7hor7qG4A+EL67wDTNUIkgnFn8TbCX2ADFcUHoe95pIQmwjNrsTa0tnYYkIKiUE
	7rAOl8aryxpxw==
X-Received: by 2002:a05:6a21:1645:b0:3c3:2dc0:7cbd with SMTP id adf61e73a8af0-3de22b356bbmr12488753637.1.1790573954396;
        Sun, 27 Sep 2026 22:39:14 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87febb82357sm3591121b3a.61.2026.09.27.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:39:13 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v1 1/2] iommu: export iommu_get_dma_domain()
Date: Mon, 28 Sep 2026 13:38:50 +0800
Message-ID: <20260928053901.7270-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928053901.7270-1-liujianfeng1994@gmail.com>
References: <20260928053901.7270-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm/msm needs to recover the physical address behind a DMA address of
imported dma-bufs: with CONFIG_DMABUF_DEBUG=y the attachment sg_table
it hands to importers carries no struct page, and msm has to translate
sg_dma_address() back to a physical address through the attaching
device's DMA-API domain to map such buffers into its own pagetables
(see the follow-up drm/msm patch).

Export the helper so modularized drivers can use it.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/iommu/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9af..330f9a79248bd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2327,6 +2327,7 @@ struct iommu_domain *iommu_get_dma_domain(struct device *dev)
 {
 	return dev->iommu_group->default_domain;
 }
+EXPORT_SYMBOL_GPL(iommu_get_dma_domain);
 
 static void *iommu_make_pasid_array_entry(struct iommu_domain *domain,
 					  struct iommu_attach_handle *handle)
-- 
2.47.3

