Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F1486436
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394070; cv=none; b=qY2gYqfmLTnbc0Z33cOm+WlSgR+mGopajijPolcASkT347wi/b0rSosEd05K3vDHVe02gFDZ2DQV+gECkSUAAzXjenERrolgQ9YXnOn1vXvLa+yS0zxrUOS4sA5iI65tdPcMvXOHQ6QK+KATZYc1F+AQDyZdI3MnIOVA7H3WwuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394070; c=relaxed/simple;
	bh=KMY1czFApm5yxluf0IMsZNo+1011rLzhUbYuQmO4Nxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uF13uuQrtU4pe+iwgRQJq/v0tx7AvIsHixKmOdtK3yboW1RO0/afWJGy59ZSiPIUy9uNPI1C56eXSdRBW9ATcyWj2oBwQIFuEM5QqHgrG8GEFA8joL9Fg5ZpPk/zUlsLU2c73j0fBazUDtCimQNl0VjfenRTN3l7Eg/AohcKDik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbvvkNb7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbvvkNb7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so21833785e9.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394067; x=1792998867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvlgYQm3dB8aOMy4KbGGHq81fZ8P+nSRZxAdejOQGxE=;
        b=nbvvkNb7Zz3njb/cC/R+prTfNxCv7tND0+aMP2D9WBmtZTn1GDyOeUI6cW2Dq63o7d
         wp4ee9ZlFg7BDfbFgpGjnPkEmDO4jr4Tjpx6+DxjcWyD4E0yoII/XgMsoBdAHsyKmK0U
         WaZ/KdsGRYP9IOnmEUGzw3pN7vjUSFj6Du8yq4TdY2wPUVZ4waAdHWwFtvqphRpj7S+J
         stX+svpRBZS39RfhJIbkSvHFxQIbfn5dKPkw2n51uSQrY0CmBFvfvrZy1f50mV80YGiU
         36KelPIcELWws/4L5K6w0WQXmBJ7l8HWfgn7TMEclwG4brzdy0AkHAuKcyXJoccidcf6
         E0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394067; x=1792998867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvlgYQm3dB8aOMy4KbGGHq81fZ8P+nSRZxAdejOQGxE=;
        b=Vhe76txhszlZ5P8Kk6MRPU8MTWLNlmTwoJZmfKpn4ATqEuuMyr+bmvShWgi09H9gaz
         zUlxUhFktddDt3BzvWsDtokt2wBRiLmt8abD9mykh4xbnaDq9z51EKsSsA0GV9B8/ok2
         cDUwNcaE4llpRLJGl+n8sIqM8UEaEH3JhVvsc0mmFT8FHCzt7fSNcQ1DONTwGL2FNefo
         +0+7DYxBU9N3iR6ZYUpFfkvDeaG1s2E/zlnmX/TBsQyKq72sYzdhHrU2vwLD4WRX64Kf
         StbEJuNaVtCd/52GzVAWG/3RKci1RcjWfMhHJGJ17H1euW0YRj0asJSjt54VWT3aFN7w
         s/lQ==
X-Gm-Message-State: AFq9FYLju4CXTear12Fevpm83CI6ISkhWOBOpcC6awLE455XddXkCf4L
	0OedN0KBVwBqBTjhqyL1m75DVmsxf1j7fN7k2quRZqTjLmgBxAFUZ4A+yYdtuCf/
X-Gm-Gg: AYBFou2TqwHKsEWcS1/TnidUvMk0FZvsv/39ff19aYlT4caod8fcuUB8YUvHXDe2ODx
	ZPV2fYCWt1eN5nuyMFTj/QasVFIHOiplbTaoDz/3Gml9o+0qmYbUScCr6BDw36YN+LadrllVlzv
	JC92T21Zsyzk5Q13OM4a6XJDrOR4ZzVYtsQuQEYVLnkkWJaW8b1G9tDiLlTCe44pAVK016irVJO
	lsbAkUSNQ6d5+KGSGZl9w9GuYC5/7Xvus8tcWZVEBQ5/AsBvLFNhmcF8/wJjrCS+XkGFrnlx2s5
	7cAMb4rzDtNRtCHOX7h11wmWAE43TI3Clah3lh/Vq2XsFigEu2oRVE/JMpQaUvg+GLw4JwanKsu
	yr+rYKgy6YMmCzhK1AmxIYQy7fwmtyUGAi3GyXkUVjOyFv915u9fCBRF7a1rqHOrhQEj6UH2Bfe
	vUuRXgk6sHABD5NLvNKMyHProsEdZb1EulaCH2YknVUilAIMmMOV8IGkVSmMWE9qbyvqhQeUmKP
	yd0iwzAy8Ao/cEdALcJJe6OJmYiMU1DgL5ObMuWj6lre+reBv2K1gUDCyXwj9FjtDqEFvL/8f64
	tXaCaPzdh1e5PK4LtSXafVUage3toZ03CwDYGAjKkySXZcT2XNvHum4mx+BfDCq726elXdGdPI2
	5
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr147552565e9.13.1792394067002;
        Mon, 19 Oct 2026 00:14:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 4/4] media: vivid: synchronize imported DMA-BUFs for CPU access
Date: Mon, 19 Oct 2026 09:14:11 +0200
Message-Id: <c12681c1d39c45ce554d31eb03e3452ad55b0e43.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vivid accesses imported DMA-BUFs with the CPU without cache
synchronization, leaving physical RAM stale after capture.

Set uses_cpu_access to bracket the driver's CPU access.

On a Pi 400, stale frames fell from 25/96 to 0/96 with this change.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 62cfb5feb2cf5..e3aa1fc3bcf75 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -925,6 +925,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->ops = ops;
 	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
 						  &vb2_vmalloc_memops;
+	q->uses_cpu_access = true;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_reqbufs_allocation = min_reqbufs_allocation;
 	q->lock = &dev->mutex;
-- 
2.47.3

