Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586731;
	b=31/LVi/bgJvclrrdAK4Fmpn8BvRR9IIkZ7Nd97AtHyKkQyP473UG9UET4qu/lBLiyh/F
	 l4Knnxq0EWUVv1hSlsoj3XXlkkGj0Y7BLR/Pn5qZTcXpcfXegulaY0fsofp9P+bwj4s++
	 AviEAimNK9MWssm4X7/aTD6JSVMXfXDstFw3UW1sGmcKs5wAyk4Qg5g44k1Vfs3xRYJQU
	 H5FY4WH9IDDUhJwW4GUH6/HnXH2ufSnR+yBni/mluR4Ool4EggpqNq31+ZUY91SZwM45S
	 yQLCCGeLAxIBN1HhDidhauY8IOy9BdeVl9UizRFfpGZNYCjKAhaefrsQAsUw6bpQLtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
	b=i5gAbqtpL1tgTLskNpVILwCtpkR0wYQ1GeDYWV/2m3E/gZI1cmT3dWbxLsz8qb5T/jEJ
	 zTrcxOkkOhhAm0H1qFeAtpGEGVvH2AMfhbqJW7hyUybC3B/S8hLcbo/feLswf/pT/omG5
	 AsA1QeFC9yH2xuS+vr/9dUA4t/ApJz57NUL5j95KZlJukfvfRlB2WHLMLM2N8CWuRlfRG
	 4dTeVobSiFQeMCO1fTBLKkJmT5Hj0UfW/ewNXS+hGowebTADQmb1axpkVvhpyfeikGgfH
	 q/a9yEnLFQaX3yg71R138vU8P6kHA0oYUHFu4jk5IIaSgczvHOhu/85k/GYRrHlwYiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456B6070FD1
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6456B6070FD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so294889366b.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586730; x=1795191530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=M9UjRtUD4pPPLVx2rlfKtPnYulHOmQSBlzv65hZNd5XJrP8uTSeIG482GQPfDk2hI7
         hOaz8LyLCg+QxHlOolUeh0iqb+6iSi3cV/qtjXjXepsA7nflo5i6k4xzG6Y2p7yay+dK
         umAZt5M7Kq7R8GyhiDHbQFd60NUsxnASXTPBR0SFhakXg7GxXJseLT33OIDoFf/DapK+
         gvcGIO7iugM78r3VU+QwMPYwEBBCSpNdnizDlMF5THvTY+DWpuvTqjJKsCepIWre8yBt
         AoKrHK2cMdqTBtSQYRo2Ca+b1+AdFUx+IjKahNuJV+3QDeWAzd2TeBOTh98kGKp4wmRi
         OVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586730; x=1795191530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=B/SQHPMi94GgKTkZHt12o6lgLY+bYIBBeVoL0zN9owDtPJqra+gAcdn/NbtAQYyFvz
         WUOgU1hrVh8YrGaKspqudZrvb7lin3U7Lx5WJ8+ycJ1AaBzXYvRFFxlR5VjbYcKxxJWu
         ge1PcGIQ6EYWvShtBLKDcdJTssq9KQKtd9QMtFyFF2qrs6NK5cFgMuO4f8WAfPJLSH5p
         TRbJfXR8boiHOS4VCsaFn4eVjdqs/kTQP40E/DTnkZeeKRQesHEppoFkeyIVlB0C1bd9
         S/Y7HeJv0oMKoduIf6cb99817EdAtrqXIt5URl1GoxQSAcK1tyB/Vs6knFSbmYbKZuyb
         6ApQ==
X-Gm-Message-State: APuU4Z9hyKdTrXUllXNfAJFYVKAJBjZZgm0v1MK37qFg1vgdQ3gasDgb
	SqnYxv2Amq93PyAGdxmDU39Wg5QtaMSwRITAFDOHGor4PQGG9cTrEuzP
X-Gm-Gg: AYBFou3Fp8xfEl1lRdKTcf3RKPPvxE84hBh9U7tcLxCvDA6iJEsyiAFzy9TKMWfRHKd
	eNDcbMSqmTIAdBRVo0synfejeBEjQgSTpxvRoD0QxZX9m4EU8hhlZ+USRVjhmGKWVIh79jTHiEV
	WnIH4F6FbYRPZQOyi9s0oJuJz3Y+8xMeQ4ipymWD/Xrcl7veFJRqMwbOqJ7yMJ67vQedjNMKUjf
	t68Flu8/Xm3KBtbPH7JsllabReKnqx96/fjeF66TQO0P2FbsO+ghBFIPj3aV797gaRiGJbI8NZo
	r1rrMEtNha6D0++LIIiow7Es04YAW30DG7YIvPy7wPTHF+NNff2kztDpkHLroPR9C9Rrq/TVqsB
	L/eSQPfLiJKLn3+/beqFmJmvLcQhCdbzY0n0w1T5Ezku8xi9zI7zZc3jNo9QSfQBF883AfFpUfL
	vPNWtYGfL6PXPTu7/0B8Tuv68kZLuA0bEfyEsSXAvHQtvxWi+4v57rMlGWpkoVWdhb+mp8ywEa1
	vfqsgTIUBYeihgPvxCjxVJ1U1XeuIHtNctZssGyjPbo2t5U6BQeJN0KAT2TLyBglVTrZ5fgtVU/
	3aqLfLH000LR5AHfuvB0fCxVaX8AAtvPd/gmbeVruK0F5x2DcLky9CkdgSmcRscslIk0/wE5MUY
	g0M0Lbuyi4w==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr252539966b.42.1794586729694;
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to check subdev type
Date: Fri, 13 Nov 2026 18:18:14 +0200
Message-ID: <20261113161819.36847-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() function relies on pad flags
to terminate the search for the initial sensor. This causes it to iterate
through devices that should be bypassed—for example, the pixel array (PA)
of the mt9m114, where the internal image signal processor (IFP) should be
the initial source instead. Switch to checking entity->function for a
sensor or ISP to terminate the search.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index a96ef26af89eb..5c649e3162fe3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 	entity = &subdev->entity;
 
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
+	while (entity->function != MEDIA_ENT_F_PROC_VIDEO_ISP &&
+	       entity->function != MEDIA_ENT_F_CAM_SENSOR) {
 		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-		pad = &entity->pads[0];
 		subdev = media_entity_to_v4l2_subdev(entity);
 	}
 
-- 
2.53.0

