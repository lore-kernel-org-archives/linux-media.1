Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322AD31985D
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196126; cv=none; b=gu/sfJCxnGRrEpblWNzorzb3ZnmpqGu1yQ5bRMtwIOalpbzw+GKMr/Eu/AYcFmSpQcgK604kFUYywcfurDzZ7ldrZiYWabmKRdWlZdBRgLfTlKXUBwWOblUiVP4yRxU+Lj7PFeKnAGLK+25atuErT4NEEYW/pLNQ/zp1kRD0VX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196126; c=relaxed/simple;
	bh=q7/gntLY9fvlAGsuKuXVIOM7kRF/4gu70b4aKjQIsN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awVAN6X4S/vzh9ABItBEJ2wsjdWOSNh5m/J5xx+HZSzdxf2oK0CTGu431vNupk7oKpB578osYCKyU+MQVWairxIFjgMa5EtlHAZmgVf0WhRNg1/pQbIwq75X+ffwsAef/KVzo14rssY/EaPLH+fbDl9FfwBQVcUJjt8t1rCQpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZb0hjvv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZb0hjvv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso1668515ad.2
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196124; x=1783800924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaaoSkHvJdv9eatCdqTi68MzaogKvZcfcaq7QX+kzVA=;
        b=YZb0hjvvWiYvth6N21ZazRBr8Nw6ElzI1q/h/u/abp1bEvXLRJQIGQ1vocm4n4hg0Z
         UElSIfvnYPJQ6RmxV0zqvp5uoa0BeQIgOokhcafPf9/dDkzCqEj9JnpIuiRW57GxY5xX
         D2Q40v80JwRznXxPSahfFe2dRu9Zzo8JapnFyEbalfElBjgR18xjwSEcYgGwcVPmiwwz
         VzYae1JrfqtUKef1th20dm7hz1Fvl5/9qoqmaDoPG3KkAZntWd61TsxJxlApX25nF6H3
         pxVuJVaoP49oZQFeESnEi2QE7f67zfHRyOvjdOP1DuOAkm+/5WIyJYkyifZtm9v6acPG
         Px7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196124; x=1783800924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaaoSkHvJdv9eatCdqTi68MzaogKvZcfcaq7QX+kzVA=;
        b=IOXbwmsKN4yuQEBbH+3PyUHAhWIQpwHX+RR1PsCuQRcHKE7f37NDS6S76Q7Kg4qe/8
         jhtx9TlNZS463KsMfpznctcHxObv39gH3e5WONwf50Y/ha0SuOMWVSrDuIgMigXKVk9I
         xZdAu3755hTusLoKDfvhL2XU6jYoqpE1lVx2puBbNOqC3OjluMw7P3f6lbw+WBAtydqL
         UWEgHYivxNaZKMnR1qiIfBHK2n3wVxZJv772KmDSrkaTdz0VN1ciablLeow5tDy0XAJZ
         jqLQJeKHy3Z0qoX2aqlmRN6CgnVEvmlDpNbTLcS1DpUTnQUwX7oLvb05HVzAnLeycAnB
         VHyg==
X-Gm-Message-State: AOJu0YxBa9JH27m+h+AT4ZaVFh6fQkpJbu9oOa8GjgUBQYqSDj1PknvU
	jgQ4SLC3VHZtD07stM8m8a9ztVrAXRhuOk8OIxmikU+yUJCzenQLoh1E40e07EhQ
X-Gm-Gg: AfdE7ckh6tW8xl39WgF0v2LBGjc4oZlcunCsnYPJsnuXTlcoh2Kwyegg16KWrvAge9h
	j5dwk9SiuPtyoj2oTHM+aoV+BPgVOWhPJ7eKQvR+AKeYLSy5o8KL8U99fijR0Kr1POtmdjZ/c/V
	v1EZ9s4StCNX0DdCrCeJk2vcaSYqdk/j2+veShYgVa767qWTP425aDMaes4LltL6Z4S1z9tRL6K
	9UOKB7Kv4kkOahfntfHKvd8bqfcSZC5lgc7ibicbzQmJLMXOWuPLmOSFxeEKWG1qcJv2D9H0Rrl
	xnlD7cU2mGPdmwDxI/iQ1FeNMu0DexBzuPFpDvhrV11IDhsZOEwIy+2U4Uy/o9+FF7lUd/sNZj3
	jphE4pCUHRzuvsue8otw6f6ybRscwmRZ2WGjHFrxsbxr0lQ3l1REpeU/dfFbZYobWh5VZzNScXh
	tBLmEF6WqSiwb+KFSBEsWaJ7aR753O5cEydv5RYmN5asU=
X-Received: by 2002:a05:6a21:7d04:b0:3bf:49c8:f77 with SMTP id adf61e73a8af0-3c03e1ff1e3mr4503213637.9.1783196124363;
        Sat, 04 Jul 2026 13:15:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:24 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:09 +0530
Message-ID: <20260704201506.82524-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated error_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b56503..61558a71ee358 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

