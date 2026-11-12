Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445839;
	b=XjxpNZsnWnr/bkgE7BF+kw6luGzpOX0uDrjE7y85y2fiv3r3aShL2k1ugevfts44OVEa
	 QNm08gKgDrGIZyUqJlRt75k2OGBpE7D6ZG1gbW6l0bGCljPntPyOv+Rpk1IJRaePwZlyl
	 0fpE6flmUNElSTVwuLi73I9sBGeCvyFBe5/OdqMAAxhvV9TSKmd3Jf1M26kHw1yq59exf
	 S5Km4MX+qWay3LxiR3+GrI3Rd+KH5praQCnChtP/CrdzEkkWp1sRlxlCsR1TG3smQ6z/f
	 m/FdGHuP2njs1aHwc8lNeNa1ETvmSNxeZ35NLQ7QIcqPoTWcFwOyOJcwHN33YHw4INg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
	b=vlB3qDgoRHyVaN8ARNQ8VXwVlJf5FbrB+nKGzKtC/BACBCjkl7COB9xa+3zfA+4eFIEi
	 odin5+JmJ4pG0OIg4Ygmc8PxKFIoyDKhVPuk1iCsYUaHDon69E+m2+IXRdkxuFKFIiIG7
	 KNf69ZtG9ebL6KKZbULMvy/yEs+yqliz4VjtQOL283M1lMhRKXiOb1s78kpeOzg23+XTb
	 G6p43Sooy+/Tyj+8kDnKOgN2aaNVDfyLapiPV5YW6L/6QdruStUQpql6oaI1SkAKkiCAz
	 RCkSUZdSoeiebR9B0jf7gfJjsKkQZY0vak9qVKH0bG1XQANb5FX35SPCzR4nN1zjIBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhiae9V;
	arc=none smtp.remote-ip=74.125.224.137
Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA8606A893
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 01:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEA8606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhiae9V
Received: by mail-yx2-f9.google.com with SMTP id 00721157ae682-8b32645bf56so12457557b3.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 17:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445838; x=1795050638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=FPhiae9VhKky2ggLWcSUiklrtrMVy4pLyo9qcbzdaN6JNm7714vgYkniAB02pDuERk
         1lVRk8xAp8AggRKi33PiQACUETWTAgQCTOR/aZCIoL1zGyhQwd27UZIBL1K2j0d+F5nN
         6iekq6nsQzAnH63Lht29vTAOi/YeBn0Asj0FFQ7BPDJpfzrQkrtIUpIHZTeZEmvlkDAq
         9DZ47/k5E5N5oUWEiXPVY7HfUquRC5xRaQoidNygGyRm/YBbGiaM0rWg98ewAa3LpD/0
         ez01sr+kmFSvEARX9Zby/jrizzeX+T667tgIZcsqVWsQgqPzveH/wXlfhQaW08b48Gp3
         XC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445838; x=1795050638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=sA+uxFu+XSJ6ix3REUW9RxDDnAv+u1iicPbkW7c/rVzL6OjF17Q9ksEmRxE994XZDY
         eQ9rJ2WbEZTRiqBAA+hQP/3gN0Q1GxFUxtJyWxQtgm346TmFyvOc14JRh0242DfLu3Gx
         //Yip7Hlkkks9YHj4VZWEXhSLw/qKLghgP1fusEYuwmgVmm656HbJ6hWao4/soJBeh+c
         ce829x02Ex0f7CwvJoIc22hEQvcvflJxDNnnj58+UZemPs1zTXSwB8QzUOJ27RfvDV+X
         0N8QhPZkSKBRpl0AZdMsc81iBwj1KCeUcdCmn3cYJRztP1KkxfpUhX8NbAQEHn40Nt/s
         L+SA==
X-Forwarded-Encrypted: i=1; AL+hErHVWWlBLQAdRjWL3SIFH2QlqCxGOHZys50BNrCCeeuf2pqXx3yjInn1AHkeOIibZo7ioaZmvAAofx0F9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+J37J9Qfah2c9Fre8ghz8jFK4yCbmGw4UlYcNh9toeKd9XQWx/
	1JgZXLcHrm1R0ljtgif2K6Nu4uiS1rtF/JoAVI4Ip8gCXUNi/XlI5Zen
X-Gm-Gg: AYBFou2qUQR3Yy7N2+9xGirz5Bpx0ql2cVP1lJldlaH66q+ugLccuR3fpi59k2SEszg
	sN4QDL5mc7LhwesCqDXOBCw97d55suTitkrEhgIAG0g7/lIXOLn5SslD4ZAjFKKtMj6gx5qrCLu
	vf8E9eanDEsCQGaMIoAlBbwgIJYkpUXSUEmKVjUdrItO8PPTCIbMn5H0Jq+im5og2ZSep2MoVJ/
	MZDaUaeOSF1c33bxFKksEow4jzfCAOUCSGLTyX+2SRLuCQxaYeJUrXqDFqGKobXcn7igjMMUwmj
	MYT761lbDBlIDinAeOhqSFh06TG+IBOJ68xVCMi0GK/U2/bpBewQRstrUbSlYA/cFFA82PWIHC9
	A5CPq4HuvFYXpqAbE42NyuYB2aT8IpPmuHveYZkvebAOmkU15wNcbalQ9JFIt+uHQz988Hl54Ba
	V681OqKn788HXXCUameNFgx8eyL3xQRgbRdaO6oPdQ7wnOZpI2m3E00o/xl16N2a/FD9KfDEC13
	zzQIukPIblG2+iBbU0PjfLQ3/K0yQrKflWed3E4HseyWYIXjQ6HAFVKMaIUwjf+3MuSo63TwkjI
	8xVesk5qdFbEKI5h16oxaAJOurYwH0u/oyYvC0lWsQ==
X-Received: by 2002:a05:690c:39c:b0:8a9:cdd:faa with SMTP id 00721157ae682-8b3a81dc415mr23588437b3.93.1794445837938;
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
Received: from athenadria-developer.attlocal.net ([2600:1700:1350:96b0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm2591300d50.15.2026.11.11.17.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Subject: [PATCH] staging: media: atomisp: Remove unneeded return statements in irq.c
Date: Wed, 11 Nov 2026 19:10:25 -0600
Message-ID: <20261112011025.101375-1-hmjm081106@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Remove the bare return statements at the end of void functions, along
with the blank lines before them. They have no effect and checkpatch.pl
warns about them:

  WARNING: void function return statements are not generally useful

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea386361a..6ca8fcd61b36 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -60,7 +60,6 @@ void irq_clear_all(
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
-	return;
 }
 
 /*
@@ -104,8 +103,6 @@ void irq_enable_channel(
 		      _HRT_IRQ_CONTROLLER_MASK_REG_IDX, mask);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 void irq_enable_pulse(
@@ -120,7 +117,6 @@ void irq_enable_pulse(
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
-	return;
 }
 
 void irq_disable_channel(
@@ -150,8 +146,6 @@ void irq_disable_channel(
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, me);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status irq_get_channel_id(
@@ -212,7 +206,6 @@ void irq_raise(
 			    (unsigned int)addr, 1);
 	gp_device_reg_store(GP_DEVICE0_ID,
 			    (unsigned int)addr, 0);
-	return;
 }
 
 bool any_virq_signal(void)
@@ -251,7 +244,6 @@ void cnd_virq_enable_channel(
 			irq_disable_channel(IRQ0_ID, IRQ_NESTING_ID[ID]);
 		}
 	}
-	return;
 }
 
 void virq_clear_all(void)
@@ -260,8 +252,6 @@ void virq_clear_all(void)
 
 	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status
@@ -302,8 +292,6 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-
-	return;
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
-- 
2.56.0

