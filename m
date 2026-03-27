Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07675392C56
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649313; cv=none; b=cTOUShn9KQH6xYDInC5hX1snPpL+pOfsNP+HX6EMXJ55sOkxd6YDZNOwZBjqEP0ljaiRD7UijJnvPePsI02roHdmCgbY9SGoruixPvJb3Ph9pXHQzEpxmWNXRhG44GIt2kKJCp3JtGRw7RKfJnCuYJ8bCHRpUAEbtJ9mDnIlntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649313; c=relaxed/simple;
	bh=y7QLw4N/eBmkrDs+SIblTxamZe3O+tVRFBOtJpVy3c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W057EDzL4iTh9QIrUokeWIrP8UCdqWJOb55/cu1zftQEOo3z13kg1YWG5AhKimD0CDSfzabIqG6a1CCvtpHm3/p0DQi2+9WkGJINU8lLug/jBOKej0DTTn/UPoBYifRVBch1cUMSNZRebbpmEURuRSqVaMGwxDNmUFp2qh2x4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8CkY1MQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8CkY1MQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so1190450f8f.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649310; x=1775254110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=Q8CkY1MQI7neLX92YWteY6fGS6WK4MmDfj5WZ3WrBfz7Z734+sK3rh9Ho8t7wWiOPw
         Kg4+51Umr0QD6GIEIZ/46XbHwlzSYBTO9J40gzdbuKhcS/e6KhmhJe87W0hzTIdR+Ofl
         McMWrLCd/Uns16UinfS9K7XVO+L87hkTzrMy5fhzr5yZwX4Tee3LjN95UUcmZvvSZTPc
         ln20Y4t10ejcdbPd06m1n3M2RnepY79qqyB83Z5fwzPNqICjhZTWUozct5zB8MwMCe0J
         qPsF044v6gJ6evmLOTe2qwEbJc2NeZSM9Q81VTlCw98g0/k9F75J39EAQGhvbsfim1BK
         04Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649310; x=1775254110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=d0qmCBX4u0uv9Rw+yBzUMEdQ32NAuU1DYlAj9Nc5K5lJvw9KEyjfcSpiBQHq+BcouW
         8HUAqQ39CFTWaoDyCM679ymIKjOEqOQvvwHZSm+XGCCv/O6TUH8NaBR6lgUCZ+4MzBzc
         I5x8ucQaVQNfX4YY/QEDtTs9Uy/fcFF/f1Sji9pJ/lFHo6z5z5QajA3QUzlElQEnxbHO
         Lt8FlEXFakzfblxfrKs3MUvwluULGiDFjcSErtEsk25wKU/FAl2k8bxpj2R0BdppcSdZ
         DWaOQYD6+FMGLwDBSVaEhPcgfR5xgZuQdKZCNNxnMWsayuoX4lJ754AwGV5osBrqFRX6
         bhig==
X-Forwarded-Encrypted: i=1; AJvYcCVeCKkNKbIusvJKeAJBa63wktkYkBshW15yX3fsfOTALAfnf3NTaTyAZf9optbduEA3ZRwNcu3wgd3pNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTBaUh9ZvQsQzHpTAEOevILVNwXGoi/nuOG5TNImD43H6jFJ3
	jcQcorunh+9zX6CN6BUeMRXQrXxXOD5k6Uubq9YkUutbXOFzUnF/yxLi
X-Gm-Gg: ATEYQzw6VbV/vzh23/k2rcASqQQQo97da3TZzQGSyfd316A9uomIdkF3xlBpmarN4a+
	VBPHz6DuzRb91Azc+yKdCLdc3MSWR73bp1oORAYOuPGyo6FkKC9ESYVbxS1O1tloCDWoiDa+yit
	RDyiK6C5RUJeROuEHCDVKFqgLlRTjR0yoOmeyqC65QdYgl5utgM+R7+xKydPjOhcgwtcCpOd0Za
	mxDZ/728mCZTuQK8DBy8CAD8og/Dvnf2i+yW5Q/eXlV1Gx22krQhZ7TE5RHuAHuulj+AuOwo+02
	RYtbUIGs7bqxdDeDYpA5FAl8uicKZi3eUJKsXAzJOJ9bJIOJBNSC+o+LylhO6+YivZs1Gspi1TW
	9XRxPi/r0mTQw1NzHia7Teo0rBH3y78VQGc0GxlubwGKgA4LGBg0PwWIfSpXH09oyhizH5uoSLd
	SZoTsZq94xBZYteRxR/FgkH3Ew4VkX0GCPtqMK9aPzAq+WjV1lUZeROgWZRR81yjOedFWEXSjTI
	CPM0lCq9nnj
X-Received: by 2002:adf:f14a:0:b0:43c:f257:c6fc with SMTP id ffacd0b85a97d-43cf257c851mr576318f8f.10.1774649310249;
        Fri, 27 Mar 2026 15:08:30 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4b9sm898900f8f.20.2026.03.27.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:08:29 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
Date: Fri, 27 Mar 2026 22:08:27 +0000
Message-ID: <20260327220827.266556-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aspeed_video_init() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. When aspeed_video_setup_video()
subsequently fails in aspeed_video_probe(), the error path frees the
JPEG buffer and unprepares the clocks but does not release the reserved
memory association, leaking the rmem_assigned_device entry on the global
list.

The normal remove path already calls of_reserved_mem_device_release()
correctly; only the probe error path was missing it.

Add the missing of_reserved_mem_device_release() call to the
aspeed_video_setup_video() failure cleanup.

Fixes: d2b4387f3bdf ("media: aspeed: Add Aspeed Video Engine driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 41cb96f60110..a292275f6b7b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2343,6 +2343,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
+		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
-- 
2.53.0

