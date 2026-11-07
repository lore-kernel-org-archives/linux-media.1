Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048464;
	b=Jck4nNq+U2DHSjEtyI/vohDN7d5FU3N+layduFWKGgYvrAPNUmU3Mo2K2c/DyJ5RcBXX
	 sDcnq3d5wpcwkr+OyVK00BMgAmsDlHCNy737AENp/bb9g2B0Evt4Gee/l4yGDRfQFmCH2
	 Ft3O7+gD+LKM1wSBzO8q1RX9KZ18rOFktZHEHRlo51EB7u1aWbHh4DGsz0jkzaAWBuEG1
	 Hc24ohSqjwRswKORkrYt74Z2n4qQ2OKlRecit+kPN4h4T+xYOStGsLxOetIimui+Tpk+q
	 S7r+KHDDfoiwEmfp4hblSULzV0hfFpD1XAS9Qqi/j6CvJaLQOSq7VirT1WKX6Glr25w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
	b=HxGysDYjG8rDsAIVn/MGAalKbcjja5HYCFiO2u/+RCqgkM3pXST8q572LQhMUL6QwxJR
	 YyMayXBCNjef0OyuIegDO70t0aRkPYZDO587Vhhaln6YCB5Q6j4d+MJHKei+1b1h2Ap4r
	 9fHbOFR/1DsHIeHhSn7Fb/J4+2kIlpYD+SkXCx40F9JWvhbnmurpgOBxjTPeCwviTs0r4
	 m49J9V558rUpcElKRWEPSLr7up09KAbueYQd58O57UHB+4SlhHW+I0awa/ZxNHt00NNp3
	 vKOq29ZX2hD3WmNInO5Cl1rCZ4bWtwteil4G7WWo1ZJiBYhztS2ClyxdDO+oRjWN7uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7Wlg3DU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA52606D823
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA52606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7Wlg3DU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso9920955e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048462; x=1794653262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
        b=X7Wlg3DUIcRHTVrYGzxJ2BEaIfyXqmm3nJPYTC+NuLtMcYPhGC0ng+vGEYGOBhMRiA
         snJtFNDG/G5soobH+RFH5AwHv9/y1znuzh1F6vvdyV3gGK4jyVEdZnX7ArfWiEBhVKHA
         D8UjlPO7XiNX86BFtfrdOSlHuMm6J5jWEP3Is8AdtTIEgMdZq/MiDXETWyxKI007X7LL
         9Abus2RajP/Hw2HUfdo8gsNLTWJ0ZObARhvH4TJEShkgN5K2JdZAzPOqXBD+hB5g1c9l
         RPm1ZRn99JiW4UAb9afvDAu847ki3SWcfP/UvsBgwoqQM+gEklTZy+6Oxw8KgL9cl98c
         HYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048462; x=1794653262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
        b=zyWXHeiPbNAosDeHfAtczvs/VW885lgW+glmQzp3ad/+l1xrYS3G3QUkcZZ07yme8E
         LcmwxZ1NxRaQ63Dzg2/YJ6xIDV9KIofz300e2vWETTb5Nods409ojilvCuwCdde+7lE9
         L42SkKvyYwCpj+r8QVa6tdxffGszKhoCyfnXMoegkSrb+YMGS8LrQlWY0+UdF7B/KIuO
         UIFeclqMzsXafTdcvBiETRDcdUvz1GIkH9rvPYMlOaBCY/0cVoZgSyZ4iq+w1YXaTpUU
         6XD9S/J0l/kkwkC3/WI13pGAP6evA1xlGqtMlfcZQLzOTKdP/hfpeKqSBHwVvyxDQA7x
         9KCg==
X-Forwarded-Encrypted: i=1; AKwUvBz0rlPeIZdLKHU4upE+LwTNaw/OP6pFuGSz9O3BfVqi8SOfHgpvfRXvjhWW1YEAeCzxMa4tmnwj8D+AbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3oBfItefosriRxC9xd3gePVGR5aft/xSWpLgtgkSAXQfEZQwh
	j3eOLVuJKpT3XS4IYAivpbFTC1ScDUGMB8vLdWegcJuGIBjs2TxAu5vq
X-Gm-Gg: AYBFou3bE0VOZZkbSs4dR+Gulm1YAFNayvEGQ9gJw10wSx5l7c+Ws8oVJuviZ7tM9S+
	cXYp3J3ulkmDPvJ0e3I3a50rXPqFRM6fTyiANi/XeWjtqie9II0YuwZHXS/hk/CN+NV35z4iUgI
	M1+wBLad3gJTGBPwC+X+RIclWF65BYO5L0/7vGya0pV3E7iXwfXhkVtB1YlhqfFdZ5BiaZccLXe
	bQIqgEik/OfWskSbFyVMY5GIpFEimTN00iHaUAcuHluvg/PVT8XaZT0PszJsN0qkK6+D/713d0c
	ZcYrJhpq2q/qO4vl3V1u/tq7IHL1laYptRiw2EhCv8mtgEaivfs+0U7KaakWA16dOOt00VN50cJ
	zH6oJ/K12IHQNHQGfpAkdE/GRKrce+MS70Tpf0uT7xThde168n1VuzE0hTgRos6XCI+Iy1wa7IZ
	dOdmAmZ31S6IORpwIdo0w3aEEqbRh048aa6i/JVpWw5uvQtxQCDia1KnfVxZ2aCunlhx0kSTLvb
	91YDEdEcBapg0chko04dOokAatfuLi4zJW52Rubj/L+nKwKW1FqQ6was/t5a4iUOcdszKMAT/yF
	BMNNxhNFNjExsh09FCY79OIWLBaABBtPsRN1uaP00LQeFWgSpqsCZ73RsDQs9A5kB9hdinu/dCh
	xZM7m2Sw+gagN6dNWlKQzmdk5Y10EzFiLT/fwzD0Y0Rf2dKPywMnenOUNwNw7cUaGmVEHaCdFgP
	Uv6LX8p1p4bZt3OIXN8p0VSKDvxEThl3YXzZNH
X-Received: by 2002:a05:600c:3f12:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4b6d82b2c91mr92859825e9.0.1794048462222;
        Sat, 07 Nov 2026 02:47:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:41 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: vivid: synchronize imported DMA-BUFs for CPU access
Date: Sat,  7 Nov 2026 11:47:03 +0100
Message-Id: <20261107104703.44111-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107104703.44111-1-kmehltretter@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
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

When configured to use vb2-vmalloc, vivid accesses imported DMA-BUFs with
the CPU without cache synchronization, leaving physical RAM stale after
capture.

Set uses_cpu_access on vb2-vmalloc queues to bracket the driver's CPU
access.

Fixes: c88a96b023d8 ("[media] vivid: add core driver code")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Set uses_cpu_access only when vivid uses vb2_vmalloc_memops
  (allocators[dev->inst] != 1) instead of unconditionally (Tomasz Figa).

 drivers/media/test-drivers/vivid/vivid-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index c042d92db175..f6c7460cdba7 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -919,8 +919,10 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
 		q->max_num_buffers = 32768;
 
-	if (allocators[dev->inst] != 1)
+	if (allocators[dev->inst] != 1) {
 		q->io_modes |= VB2_USERPTR;
+		q->uses_cpu_access = true;
+	}
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct vivid_buffer);
 	q->ops = ops;
-- 
2.39.5 (Apple Git-154)

