Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363013CEBBD
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438432; cv=none; b=fbQm8TxQK5+WrBW5CM6eRBE/q4pJr4x9jAraLsqZ3EGf1Xvww/5ZBc1YOmlzBhjOrAfZTHtJWg2HRNYwVOEEwFnUAmTiNdGm/9W1bW0UXUlPELQAyZbBTI0VENNshdfiy7fWsYN2iMJHgQQhZ4V+Wc5BqAOmlXaLIUbO4q+AUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438432; c=relaxed/simple;
	bh=XQuSQ137DUmjJs4vhjNv/rFoQoHzrImIZp2orhXaMrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLxgXEIc/80aiy7qLnsjWN7yJWkQpVNbjuE+Kv1FkWSNQZB7x8ypnzkbx5Tcz+4Pzj0qtgldpm6BStppGyjFoLphr8l9QsdxeCFn9m3cNLzmGl00h4/TMtS7dCdIC8wdcloWVWebm/fTA8PZ6Ln29/8oWnx7HLuLg6e4h0haXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArpeM/M8; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArpeM/M8"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90cc64570deso5299496d6.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438428; x=1790043228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sW7+JeYuhnmm8ntFAHs80fMLHHnC3GGrA2lFtY4r8iw=;
        b=ArpeM/M85b8EZF6euTPV6Rxx4QF4QCU6Dtggcr3tLBTgOhody2jmtYEoF7hi+fOWXJ
         u1eusydnC/22oU21g9N/EcnkxR5ySZHVyMfuDMpBx66cYJECE4aRO1YNjVVl1osDBNSd
         QEBo1EnO0mY6db/OOnn8wRGgX5je24CKPARNn2jDLp6zcg1GrKcMqdQh/sEQJXTtyzum
         taoFIqWDsy7UI4HdeacGNxZgzJS3P2guvSE/iV4jKUvcEfARurTHd/ShaN3paXvK3eqQ
         8Q3yoXBNWS3I1naaEGVmY5480qCjgG/V660zPB/qQ6RqJbIyd1RdnNweQAny/sjTEV0k
         JRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438428; x=1790043228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sW7+JeYuhnmm8ntFAHs80fMLHHnC3GGrA2lFtY4r8iw=;
        b=y4/T0cbaEHjzEvn35dg1yaIXedxvtR5tU6zQAenEtKESuXD7A9GBHBS3FakDfhdot8
         SmlWlACG8NBPRcv8D6OY2VFvkXUWTz6g2EsLEff4j+k1b5y+EXHFI1t4HSomQyz0LEew
         7vzKT2T7dMM8QsMx3IkQIJvDJEgwMoctOBY92dCaWq4vP2FUcjp3V1MbsmNoUgl8YB5E
         HLGst4v8HSddkwbYD6q6Dgsy6uhId1qz7XEu/pGtuJ3aozSDoHJiJOhaoTUTYv5AoAvw
         VfKIzNcNYsE9o/0rDAXi1iss1JEpCrXYL1nToWoO77hKp/x9EVS1ZGslFmTyo1nGSNqF
         87xg==
X-Gm-Message-State: AFuF++lCiS4lHiaZhS5GKwE/pDQcEC/tiiUx98I2fQChz734aiJKk528
	1mhSdKjZwWnFY3Zd1LDyko7qST84tbNbKM/ZbysmzPSMxcP7HXpxb5E=
X-Gm-Gg: AYBFou2qLdGnZOjfQmoz8dMP08y0+Twj+Lck1tsdZFm2/+0FIfHJ/PdWITjn31FMXl0
	OtQAm2USurRVcnM0TUt4fbjkVzmT6ZwCDlfGTq8IWHU7O3lb4m0xrKl4rF2naiEy4381c9DZkub
	oGLx1vkyFctd7mSHM9x52+cRq5LmmkdHwirRdKbKsK3WcOG/6Y6HYW/KOIO0XJ290CliGpESEIa
	vCjUX4js0doLk4Zrw4rlbfUQJbF0na60Bu6l0IkYht5NvG/TDD6BsDz0plMZsk3hyndSOYx04aB
	p8OCYo0b+sX16FKd/5JISsrIafMsqT//y0ErjGJEhkrCTm1lzgAIVxBRlCf94T212CtNkT8lm/z
	FE/G2BZ8rxXryqR9Wa0rEFqqTPfDXsdZzz9SLGij1I+4PIfkj6fEQ2t6c8lmYo4YqkvcecOWrT/
	N6/my0Hc2CaPXdlQoon8+FCF9oyP8FogFdmdi5+uMHPgeXrR2S/00EdCMXKzJ9z+XkEKHc8gG7+
	ZXbErEJ4gfB34JMuPw7rh3FnCdpZH3irMbeixYSakSs0fVWWHXsa8fg02E0xb3tf9hgSdujPrwr
	p3inBFOMUFb0P5D8WHGKZYKI4T43iMTngl85mZL0R0D+PEpyewstKJsYddC2UIU4
X-Received: by 2002:a05:6214:311c:b0:910:3923:cc6c with SMTP id 6a1803df08f44-912343f288dmr28143126d6.21.1789438428254;
        Mon, 14 Sep 2026 19:13:48 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9122cf9ba03sm34230136d6.32.2026.09.14.19.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:13:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: radio-maxiradio: balance PCI device enable on cleanup
Date: Mon, 14 Sep 2026 22:13:39 -0400
Message-ID: <20260915021339.94468-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tuner initialization failure and remove paths omit the matching
pci_disable_device() after a successful pci_enable_device(). Disable
the device on both paths, after the final hardware access on removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -159,10 +159,12 @@
 	dev->io = pci_resource_start(pdev, 0);
 	if (snd_tea575x_init(&dev->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-maxiradio: Unable to detect TEA575x tuner\n");
-		goto err_out_free_region;
+		goto err_disable_device;
 	}
 	return 0;
 
+err_disable_device:
+	pci_disable_device(pdev);
 err_out_free_region:
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 err_hdl:
@@ -180,6 +182,7 @@
 	snd_tea575x_exit(&dev->tea);
 	/* Turn off power */
 	outb(0, dev->io);
+	pci_disable_device(pdev);
 	v4l2_device_unregister(v4l2_dev);
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	kfree(dev);
