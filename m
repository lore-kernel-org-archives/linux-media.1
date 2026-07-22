Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4A36197A
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736515; cv=none; b=fssiRxwURI0nI3dwRv7sAiXqrBwt0omkzuUBRjfYAgOz3LDXtvfldrWi+pM1XTWGpdTA4dorRDPvsqXgu04mmCDjnOEwW+MzT1xnph+OTdPqk6PpPHxMpsJSK7MIuvj5i5VF2HfvZ95ntGl+jGrbvhmkAn4qvzxflNBqw6cyiaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736515; c=relaxed/simple;
	bh=dBDV3Nz2W+SaK9NOSESL8fUFa+cz4Y8LfqqEjxW+iH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mb3odhX2H6jonDo7EiYlT8oSja1q0uwFBc7ytyoZt67ljY2RGAxXU+l1QnNcBy3LBNEInB7bU5bTejUjT3Buu72KAGcKdSAdsXhnBAbQ4liGPgo96nu23nAgQ87z0/qDg2/yrVvZok+fPICtpXhdAk+hFB+3Op1YaXhchRIsBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZysZUd5l; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZysZUd5l"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so8253954a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736514; x=1785341314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgrQnMgwlgoUFEsEQmGeH4aaMMul+JyM5frck2aQVIE=;
        b=ZysZUd5lRT5rs3BMEVLcmbT1MKVTDaWzdJZiI1mExKmg9bmojRDKhNMYtB8GgqIt4f
         dIS0moaKJDEb4XNy3RzgrwjAm5ISGJHZ887jH+lUUprsnbTgWdVBHsHmTUCFO35SxoK6
         yGXpykL8qp9AxLOptWloTeo1wa45gPejuBFgs1q4BlwNV1z5w+xm/3jHxPAgwo5FPLfQ
         codyjoXLbslHPF4mHEqpny4jogHIadwfKoR681MND5q+WQn8X1vn7o4jFvjU+e88SgPn
         MiJ9N1IdR2xB/3AJHC2plSHfzzWaubO1SaHUtt5mMGLWfYvbt8GhEwOAFWyC+BjnPk2W
         oHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736514; x=1785341314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgrQnMgwlgoUFEsEQmGeH4aaMMul+JyM5frck2aQVIE=;
        b=fgUg9ogyhaGgEwkLTN7nmODyIwzWK4ZnXTetQi5E/+wg3r4OfDKF7o8ANxboVI/m5A
         WcrMo0g0NV6r2Fxg+JgeQfJzIjfseMT3K7rtToDOdVtZY3JfFbzNvzV1JuqY6lsZ6CTo
         of6JzrIh4hOctihnrdC9mHienAKvqS34KRqpCVzINQBh8L1IrEOa0u0XrCd+qdFh4e3M
         hn6fZGTLH7BqD56lVi0Ugeba3ceR29nQM4INUwlZUEdyBuD2WF8FYA2OnISmA+eRPnVo
         RBq2aQ6Hn6+o31fRP/oGSpBq0xwoV5Uf6mkBTvtFtguW39A6nDdK4bTom6zv7sz8D2kU
         jNeg==
X-Forwarded-Encrypted: i=1; AHgh+RrpUXt9ivoKrtyNlU7OuvcSyenBmW4xibrEuFI8Vis3rentKhtfoDeGT4MvA719Fm0oyLGuw+Fd42VABw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPt7ORN+HPi1DUK2r2eO9S8JMjAvbAMm4726KAI3wBIvL/Pd6
	FXbv6sakr+ZawxHlii+K9lhIPKqJxBSj6N2RnsgsJNqf2rs+s9D92re1
X-Gm-Gg: AR+sD13Lpcv/TbVFR/U/zoEYpk2mPelLc94MoQvY+AGALpzbzoqU3BaUSnyP908DPqF
	m1/wRsjhibHjgngzk/oseLWM8G7o9FoMvTX8tSDK48+MY88LQulzGfLNcpcesMpCt0/p1DZDbaa
	exDZStjbL5yTyVkcWjQBW58bk9a4H4Gx/O3BF6hZuVs1vf5KyhYgmHvg2zCxYv4tw8j2WzcpHsE
	3UzWvOdFtWhmRCNn4tDdG5Pr4u4Qbqljy07b694wj8HrT17vBfW62eeR0kvpA5w6jvM/vedwNM4
	eBo9k9F4NrloL/1SPtkxGLrC1aTpBusHDdRr8YBEeZ/lbwWqdNc7ddJoHPulLFLFV/lYyl4fRO5
	e4bhK9ZGRLrPG6TjdRYQl1V5A+BhomB+AmfnIXogt9u4oVb/xjDe+jNu3QFT2KETRWnlquRims7
	7Gzjaw3MZHRp4ZcfHhH8SXZReiWp1XgJ5uuZwdSaCHrUbJmQbATPJHyaSj7S+8s5T1Ln8RTQY=
X-Received: by 2002:a05:6a00:451c:b0:842:6004:3fda with SMTP id d2e1a72fcca58-84c292e057dmr23852827b3a.25.1784736513793;
        Wed, 22 Jul 2026 09:08:33 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.136.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a64e3sm1639440b3a.42.2026.07.22.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:08:33 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcamplbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: hantro: disable runtime PM before hardware teardown
Date: Wed, 22 Jul 2026 16:08:19 +0000
Message-ID: <20260722160820.2401-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the Hantro driver may trigger an SError on RK3588:
	SError Interrupt on CPU6, code 0x00000000be000011 -- SError
	...
	do_serror+0x5c/0x74
	el1h_64_error_handler+0x34/0x50
	el1h_64_error+0x6c/0x70
	regmap_mmio_read32le+0x10/0x20 (P)
	_regmap_bus_reg_read+0x6c/0xb4
	_regmap_read+0x60/0xdc
	regmap_read+0x4c/0x80
	rockchip_pd_power+0xe4/0x600
	rockchip_pd_power_off+0x1c/0x60
	_genpd_power_off+0x98/0x198
	genpd_power_off.part.0+0x178/0x288
	genpd_runtime_suspend+0x210/0x300
	__rpm_callback+0x48/0x1e0
	rpm_callback+0x74/0x80
	rpm_suspend+0x10c/0x580
	rpm_idle+0x134/0x1b8
	update_autosuspend+0x30/0xc4
	__pm_runtime_use_autosuspend+0x48/0x64
	hantro_remove+0x8c/0xa8 [hantro_vpu]
	...

hantro_remove() currently asserts the device resets before disabling
runtime PM.

Calling pm_runtime_dont_use_autosuspend() causes an idle device to be
runtime-suspended immediately. At that point the Hantro hardware has
already been torn down, while the generic power-domain genpd code
still performs the power-off sequence. genpd regmap_mmio_read causes panic
subsequently because the reset lines were asserted.

Disable runtime PM before asserting the reset lines so that no runtime-PM
transition can race with hardware teardown.

Apply the same ordering to the probe error paths as well.

Fixes: ea71631b7129 ("media: hantro: add support for reset lines")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..bbeec5ae509a 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1212,7 +1212,7 @@ static int hantro_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		goto err_rst_assert;
+		goto err_pm_disable_assert_reset;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
@@ -1266,8 +1266,11 @@ static int hantro_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-err_rst_assert:
+err_pm_disable_assert_reset:
+	pm_runtime_dont_use_autosuspend(vpu->dev);
+	pm_runtime_disable(vpu->dev);
 	reset_control_assert(vpu->resets);
+	return ret;
 err_pm_disable:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
@@ -1287,9 +1290,9 @@ static void hantro_remove(struct platform_device *pdev)
 	v4l2_m2m_put(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-	reset_control_assert(vpu->resets);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
+	reset_control_assert(vpu->resets);
 }
 
 #ifdef CONFIG_PM

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

