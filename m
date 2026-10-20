Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478319;
	b=RCEwTe/9p1td+BZLtqDH7lnkI6KG76VlUlLZZi5wmQEf93NBjIK/bZtMMIR9IFuOtb17
	 uetLfqMWGpundGFohu1CCJHKkFbqa9qICDQ39tHfnayDRf1KG60AnCBp/tlhej93i9Iom
	 cg/pHVclLMHQZAPHPoXa804YabZd+We3EtrnjpqrtTK2c6TXUXmKFC+BGiu0oEDAENzTy
	 TilkA27qOJljOvEmmQw5bh7Khx8otFO5ChG2iAGVBR8QFbuNdqkv93iZVAdSvMjsPIwiy
	 KBNGd3CHp3Wy4yjAttsdtPQBUH74gwnTrzGpuPECoO6ZsOcMD2vL9y1J7Y5ynU+yPqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
	b=Uyd5uaG99KUjNvFVEserv9Ruhp/rCL5DXZltPfOzuA/B/LZ35MzdUjn8iAR2RiHvqTIL
	 88Nj3Vu0Zwd6vH29yFMF43F7c8s5tvuWuZoN+moMGlG9Sl8PhtHLUPDNyRm1UIoUARHE7
	 HyUcm+PaKYuraJYbrnKT6SU6TPhhsuqpN+ADvsAG13/AbbpTcl6bWGshRysmtVk4DHFKw
	 etAN776skJCbEsyyH6etrVz4kZKDoLm05Tw4EX8d2LIJlZvRkPaDan966gsQaTBovJL3P
	 +Z53DpsmSPjfOy/W2XGX3uT22AZpnw5dUmZxiC0CBNvmL5mARo88ALPIzDQ76sDpzZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E2606A324
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2393102f8f.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478317; x=1793083117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=pS8kdSPy43DQfSfmrUcM5VFUf9OlClZrNUXcN/e0h1+S0RUX2sJz9PZGM8U2PqYoxN
         9QJz98WzW2TzxAZWvsrUMvE9tepekQQ7ZAxQ1+qc/cOBlAYOoY2ZQ+4CoMikujb4+HRD
         eyaRErWZkTvXVCC4HPqasa2prlH18HUfnW+HkDsiOOsp27uSuvYXvNwseErMTWfctodc
         9ylpmG+wzgYJkeJGgJ84SKnQTIddTyG37odV9XIG4ay3yatBFwB6T+OKjTbKYyeK4fkF
         agtB6573z9ImSvuxQSEmwlalfrhwTVlSvgP6hd/4MEfj9aiKEkw1+DoHkyCph9ZQ37gb
         Gvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478317; x=1793083117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=L3FGXbw8OQiLje8YMMvvdJNtBsR+Pu3checpcRVyRJIxSkqMHKfJGIU6RmrqU9HwVP
         2NEBmBTAa/gt5dYnlI6O7PzOoszrUnxI2IMW52SNn679lVThymZuDvad9E/PTFchb6/k
         OlHUXHQrArkhEaeXnGEoSGEKPDEiGG4yF6eovyrZido96/zB7RFTB3q5F1ltL2bfIdQJ
         i3MrnCkvZ/kT6dAKFguffu6j0vZbIZdQRevDCUPFcAzgXEV42IgpqKWeu93NsQtVN0iT
         iJjGZ7ORBy9E+n1rjKCKrv6aXKsN46r2JojZaP6W81zcxFe0eaMYL+9dI7NAP4xKScKw
         GSvg==
X-Forwarded-Encrypted: i=1; AKwUvBwhrUt13XCNcxd+6kDeNRHP3XO8mrK/2H5QyH6LKpokrzYJj5BRZ9szOzoaKGEb1YAcrZwj5sHSYtjEuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2L9ETeLiCUA0KXNnquLYEzD1hHZHdOpWRft3X9c8huy2ge2Ah
	akx8fHd4LmXG0Sxnnc7pkmzP9QxFRXxQyCRIDhucXiWTzDiPfYu6V24B
X-Gm-Gg: AYBFou1bzVvilEZcM/4zTEbbaXGPMfedaRNo1OKF+2CvkC8fKg72uCipHEKN8uXLysi
	OjRuyu+YDLcqivDpnPscr7NkaqwKglgDXXW5ryDUDULARahVvJAlVq7uaPjXNIZWTpC8/n9zJk/
	u7NRBhmGcOrcW4iqT/4GMEggekGlMlKqY0wmPDAnc12IIhWBdlP/G1mTW/63j+/kFoEn++6krVo
	cIkn4qOM8lzzN8uPWqX/Q9Oj67lZQqKQOOtVDfGAL5azMyK/PsEv3chnBrPU4vSWBM4zCWTN1+E
	Xy5wIr1TJBItqrsvLgvmL3O83XDU4DGbAGkNzrxoUR1dipjMf07xK+5KFo2rlJ3jygEEoiWa8OW
	7ExP1YwOOKX6LmrMTeCAqZsx3jwXkKjS032vAB2/UVjv2cPtEvbyFF9nDyAtXIdgWUlWKObsD2I
	Aa3LYtJr6Xgc/+xOe4o4Wzuy5s7XGSgAWLU548axnXqTp+D0TZm3sN1klCO9cMiUkBLL0ba5qOt
	PnlG97EQe5gI9Mr082lcEt7P+y0vLsWExS8lwNcMtHzJRc+YId/omSgnsBzb0paTsN2X7VFpK32
	J1n/NP1xLL2BydjWdFXTIWewp4lunwkPigt01jVpTMR0dzzlpyZMWxM77CmLYvj7aL/hoEYYqP8
	kqg==
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e0d27c1f4mr17275309f8f.2.1792478316869;
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 5/6] iommufd: Unpin the DMA-buf while holding resv
Date: Tue, 20 Oct 2026 08:37:44 +0200
Message-Id: <3ca8c42d7a597658329e77a8af92aa294f0dc4e1.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iopt_release_pages() calls dma_buf_unpin() after releasing the DMA-buf
reservation lock. The unpin interface requires the reservation to be
held while it invokes the exporter callback.

Move the unpin into the reservation critical section used to release
the PAL physical list.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 59ee68a1a..85004a936 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1678,9 +1678,8 @@ void iopt_release_pages(struct kref *kref)
 					       pages->dmabuf.exp_phys);
 			pages->dmabuf.exp_phys = NULL;
 		}
-		dma_resv_unlock(dmabuf->resv);
-
 		dma_buf_unpin(pages->dmabuf.attach);
+		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
-- 
2.39.5 (Apple Git-154)

