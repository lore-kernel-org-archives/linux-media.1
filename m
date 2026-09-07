Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67A3CFF5C
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767590; cv=none; b=kmaQsgGzdAUcL/AHbSmTD2F8v6F7U5MMIKDIw44fBWEkiNKu7FqLvRh6a52aaTnpKRYwF8jGLY4Hsa3ISBQvIjIrqTtf0nYvDqJU+wDC8D6xR5q1o3eE3PQ+RNnE8vR41FKcPSvrmkT7dz/0ogyJwztZvS7mh0xZuOoHDzien7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767590; c=relaxed/simple;
	bh=8xX4xD5K8txlJzZzy3xE60HFJ1/eyfY0yVprq5JvpsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YTCqI6kSPrEn6pkUOzS/o9ytEvlQHzFsGA1mFtckHzwXb/vVoTUT2ILC2PzZ7jFQ7ad7RJZT7bbpGU8qH2/VXzVt6l6TWB3+fVJOGTBd9jE26o3kRST8XZkdDMssL45XZwSe58H/1tl4zIwFW1FbGcsohqV77yL9ooj/AigM/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep1Tx18j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep1Tx18j"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso23338915e9.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767586; x=1789372386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWm7EBXqtORA9y3VkC/oQd5/rS2zUBKOaOuWn3r0D+g=;
        b=ep1Tx18jyIQPuEw0cQvZ2oukB+zqkafC8tXbTcETS1G6khgPISddG83yOZrQkg7JDl
         1novmlb5MWM/0NWKXZABckTuALgUHzLoQzpw+knGslzU/zOa4qRo9aEUgXwxxo2G7/N6
         0XtCbt6VMjoovgLMf7ejhhubVFDU3FEGPoKS5cX9wnoZc0h7tzeI6H+RowGvuRVSFM2j
         OngLXlLKpRfuZ6ok4kvi+soTyU4qByLLerVrlidGLSy8tss6PShsyL4CCshCiY/qWQKe
         W4U0DqzRUGH8gSjwJZMDO0kQKCuvhNJ8QA3835TsaGWou6zZ4nfH1g1t4OxcJQy7SFWq
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767586; x=1789372386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWm7EBXqtORA9y3VkC/oQd5/rS2zUBKOaOuWn3r0D+g=;
        b=V27jFo3MHWsKLEC0M5p4VlIK1iTJOKctbSmn7A3d7zUmwTCr//W9MAUu6Q7LvMngNl
         3eslfCalYSm9jwrxaDi1ysu7WZWtsRCaV/EFB9Gb6DOLzba6S1R1qlZU3i0iZ0Qj3NBK
         X6XDkmAPWGRPZve4fIuLLcMhZJXoQXyjQh8/GvWlDfXvR1xTlax2XqtJ4LfTX35a10RC
         wY5rp1gTLSeD12xyrJSTEWeykCTeqUtiilNr66Zibw1PPQb/rx7O6lDHT7q2dv/3FXpB
         Tq0lHJIhQvAS8IxqbFtjsS/FmChtB0uer/iUDw6S4Y802b+z+JnCLyo/uNDZRYjazJ+A
         Ph1Q==
X-Gm-Message-State: AFuF++mlr2OC10HznZnFDKG7y8DmybgKwUVwh0xwGvjQIlRx0slVPNkI
	AFtcyjgx/GPZrHVwAu0mMh8+AO5m+lPTqrU2U4s8eDZ7ZGz25cKeRtPyyBFvog==
X-Gm-Gg: AYBFou1ORDLeTIkMPoETrGlqRu3oam+KzRCb9th/BazL+S2kzUUtC4AvEDCDI4+eb2H
	pXEmUoyFTptQhOJnfcMw4LNAJjaYeHErhdjGJcbYMIFAPCO/pXmjuL/e0TRl/7z5b93q7mFYn0X
	4rDQTvyIsfllYTuNO06M9JD//QnE+Hwaakv6shiroXTTXYXkZ+idu9bTzQ8FSb7vNcQhm3ijyml
	gRQfhE+Sl86cWoU5pbFtzO3X1pZrmMxIMtxU1OzKLN8TFu0dLGrP9qlLbAQQW24mUDWWxLbS4Lu
	kXr7DbcIpXTvAbPNS7jgu3R9bg7eA3Qqia0AXeV76xoXuzVsBChiiJh2jRpH55AYyJcm9jdFqi0
	pGqtmUnxBCO1SUjbaUuoQ/BsG97RqnkL4jK4GwWQnzrPESTOXWUpL3agP1B6cW+GT6HuOMBPHdC
	oJAIK53Ihkp/hANbGF7j1W/K8GhNY35BO/oSj6/9/n04cmi5QUzy48oGIkkmStIhS+eytvNQ6CA
	pdihWw0mqVfgKL5q6zH32TlEtqCU4MdC7cRgfh8XCdZDsU=
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr411193075e9.2.1788767585604;
        Mon, 07 Sep 2026 00:53:05 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm168377745e9.1.2026.09.07.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:53:05 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 07 Sep 2026 09:52:45 +0200
Subject: [PATCH] media: synopsys: hdmirx: Remove redundant dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAExtnmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3eK8guL4jJTczKIKXfNEY4Pk5GRTs0QTSyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBTN6fBbwAAAA==
X-Change-ID: 20260907-snps_hdmirx-7a30ccc56a49
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767584; l=1228;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8xX4xD5K8txlJzZzy3xE60HFJ1/eyfY0yVprq5JvpsE=;
 b=hgTm6Y51CD9FAcrGJmyN5tMTgy6Mf3aon2rY7fbe7pVWabcFvJdMBlZcx/ANLnHPglvXUOfPS
 UknZVY669m+AZRFG7zeDvPD8F7iEvqWiBO7523gnxTyI+PZeDY/lf6r
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The devm_request_threaded_irq() function now automatically logs detailed
error messages on failure. This eliminates the need for driver-specific
dev_err_probe() calls that print generic messages.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..b456138c381a 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2595,10 +2595,8 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
 	ret = devm_request_threaded_irq(dev, irq, NULL, hdmirx_dma_irq_handler,
 					IRQF_ONESHOT, "rk_hdmirx-dma",
 					hdmirx_dev);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to request dma irq\n");
+	if (ret)
 		return ret;
-	}
 
 	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
 	if (irq < 0) {

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-snps_hdmirx-7a30ccc56a49

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

