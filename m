Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880128;
	b=GR8i3mivOtldPvDL+K75nHok5wOWc1uTiE/RN2RCehjqP7rZb3pg09+9OdlLxCecrKzt
	 hECG+fo6QbeTVMVhR/X6hTYFaPq4qzfh2re4yejbUaP3nQ8x82W39AXJb/D/1bWk+DN8f
	 lGVXPJgeFq/Ol3a/Fx1swon/uyl6C57Ytk2pbFjzQ2Y8xBAKt6LE4iJCyYjGxwg0mBHYD
	 KNm5orU/mrvLJn3pjZ95okrYeG2XCnLoiRAef6yMN2vC49Ky8nT1l/JVRUhWFAAXJIGIB
	 WKUWW9vFNRJgXMcpWpQm/Y5wNuDJQLbCER3PIExHyGidSWBZDYBSUjkPQrr+K40glfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
	b=zjqN+hZYfEpJAjRgT0MNu/dsZ5Pd9AaRgdNEAZZr53zZQsXTeEUG/sFk7UdJVvbvfsa3
	 bo83PnbnFoP82as7FtAwwzJ4OPGV4pOc3Q/Olnzwl2G/5xVSc//VnNOaOIeozkcp8vZKb
	 02ptfF8f/HCMOLYkWFT0A41J1ekyQtmzR2hLQjra5ArdHw23MxW24MA8TA9fIPKwRzRAk
	 WGJFTPlPgQlaqQS2b+rpVdwNsN2chVTUQJlEyIBQsmMi93pTIARgjDV5gC+Cl6yJpEhgL
	 pJgku9nSlGM6LJBYnWqKMlW4A6dyM4P1vvOgyNlX7kN8bXEqb8Gps4WSKn7FxcG+Htw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKfIYDPC;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B941606A31C
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 15:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B941606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKfIYDPC
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49465892f7bso6617132f8f.1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880126; x=1796484926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=pKfIYDPCG1CqekvZklsaC+7dg20spjbGOEwXkA0yIDKykb64+/yXCAAppvkcXwlPmC
         wvUhxBDIlLUKTcybvMBEd0YhuFQ708HvgEK+cS+PczYut3pq6bO4RN4Tw4weSiSkkKnk
         ilsuLWhLYf+NX7/POoDkBWcY3BR8Yq0Z+ricI++hhsOxv5bkHOYQj7pqCf4BA5FjRGq2
         Q5reHggiCwqqzT2BdQQPfMachHtuPFXv2QLWrrNAO1UWoAiedZTz8NAK8um1sQ7QHbfA
         A0QufZBc/5Qy6P4bclYXGHqEU2Ubag6CWP00mQ519M3Ur91vJ/zRQe2FKzDywiGhXQBS
         tBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880126; x=1796484926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=YxGhLqsQ0IM5O8Y3xa4S7tdkpANfXEBbTu6zbnJ+2rdBvnVQwtkWmGY5k4QOxMI6nD
         Ll/Vty2NvrJhmt9WSEeeH5kktrJrYkLFfjGcE1JJG63NC6ZrdEWIpJz6Q4QPbgw2fHak
         v5YQrPyDpD44gpLmsgre4w9umKtPpVO1EJv1Ya8RO3kDwR3ivoCq7vL6B7aq0KEsvBzI
         B6GWQE4G25SL3RxwyUWD70JcfnOsUDlWU0rahvzDlsqWt6j84eSbEhFgxwGtzBAIzJtg
         iMw2BUrTB1pJkW9Jm6VoosEONMEGkE0f8wjxy1cy4NZcs0fgLuq3ME5C0qqzrxQ6gcRO
         0DHA==
X-Forwarded-Encrypted: i=1; AL+hErEbxbFetfl5IJPcTQ6WWmzK8tqgl/zau8Pxvsod4mRCEPdPtmISPBD9AFNS+5EJnLwSPqGwKemUV/c9Kg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/AIRoxvB22hs52kmTh42tZLZvZYzpXipkpfJ/NUHbtz/DvAlb9
	afIKybSwnsBJyMILHYnGmu+cuqM4XbWONNjUBeHDcqVzlxSQzDGLsFH1
X-Gm-Gg: AZFdTZfPSCeS924OpKIYwJxki87e3e1SI9BBvGEv2j49vPpTLeVMcMZWxPpvPw9dClz
	RDL/XYKy4CVUQS5Y5V+Bam3Aojt32NP3EKuonTOvnt9LJexODR46663Q5NvmSMnMrmqE6OVLwdH
	gPNJC3Hh7P5L8Jo5RLCpNz+E/KM5Ky5494xxBkx8DE7iccb4ljnJW5dxcOw3s9kDXp+d4bwiWNn
	N6UPwyCcQeSXI2x0A1mhjlCVm5X1P+Y7zcyvbXSnigr3Ezu/Vx6C3QYMXncpW5/QvAz3BCM+0TU
	6hcKNOwWfuT+woM67ETtlHKBxS5wifSSd1pKvjBywJzxSYblKLcLNoPaHq030HRlwaXMYUJyuor
	yVcU0IWjIKpK92YMltwWp7Qcts8BtQgT8u2dptkazKh59doqg5Ud58wSj3AETqYwo1q1rFIMMio
	aYc5UV4HYmzhaSnzZJskQh6yGDJ4ekw2uKrhFU6J232KlMr8VzBg6LK6OYWlJCA0H9uRpZF3pUb
	Y0RV26Ig17yd2il/E3GhwzFrpN5/g/v9Qa+VY8PdNhqu32FfTPZ9/Vnu77W49E/c6NpjgdFNL0d
	gFl6zZheznLK6deff+t2rGp5Yxl3rB6jdiE/bZLE
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr584305435e9.30.1795880126455;
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:35:00 +0100
Subject: [PATCH 4/4] media: tegra-vde: Drop warm restart workaround
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
Message-Id: <20261128-t20-soft-reset-v1-4-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=hFtT0U2Rwf+oq2641JSfqN8CqbYI8bYr/DwXrJChJgA=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl61MTeKt/Iwu07XrJh103vSX9VZ3R9GsO4quqvGWL
 32/1zB1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgInMdmL4Hyj/7K4PQ9Ha64fl
 eF5M+83SvFvhoG9F5T2N1ycnihwPnM/I8Lrvy9Nfjpq1ITNNNnkcuNFn8OqkWt7MD1P3TZxx6FD
 IGmYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The VDE driver powers the VDE power partition on from its shutdown
callback, and leaves it powered on in remove, because the Tegra20 boot
ROM hangs on a warm reset if the partition is power-gated or clamped.
The PMC driver now powers the partition on right before restarting on
Tegra20, which also covers emergency restarts and doesn't depend on the
VDE driver being loaded.

Drop the shutdown callback, and power the hardware down on remove,
unless user space has forbidden runtime PM through power/control.

Tegra30, Tegra114 and Tegra124 aren't affected by the boot ROM issue, so
they no longer get the partition powered on before a restart.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index 878a5b37846c..6546959e4069 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -394,22 +394,10 @@ static void tegra_vde_remove(struct platform_device *pdev)
 	tegra_vde_v4l2_deinit(vde);
 	tegra_vde_free_bo(vde->secure_bo);
 
-	/*
-	 * As it increments RPM usage_count even on errors, we don't need to
-	 * check the returned code here.
-	 */
-	pm_runtime_get_sync(dev);
-
+	pm_runtime_suspend(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-	/*
-	 * Balance RPM state, the VDE power domain is left ON and hardware
-	 * is clock-gated. It's safe to reboot machine now.
-	 */
-	pm_runtime_put_noidle(dev);
-	clk_disable_unprepare(vde->clk);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
@@ -417,15 +405,6 @@ static void tegra_vde_remove(struct platform_device *pdev)
 		      gen_pool_size(vde->iram_pool));
 }
 
-static void tegra_vde_shutdown(struct platform_device *pdev)
-{
-	/*
-	 * On some devices bootloader isn't ready to a power-gated VDE on
-	 * a warm-reboot, machine will hang in that case.
-	 */
-	pm_runtime_get_sync(&pdev->dev);
-}
-
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
@@ -543,7 +522,6 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
 	.remove		= tegra_vde_remove,
-	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
 		.of_match_table = tegra_vde_of_match,

-- 
2.56.1

