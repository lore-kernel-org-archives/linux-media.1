Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830831;
	b=Qz6jcIwhnpKMA4/Op2KQmHSQsiZoVtyTuH1GuJlzm9sxfGwLqyxBYtM+3Dg0Xqk+iCjj
	 6U40G9shFCsRCrs9S5rvY8C7SocI++UJrFA4AAIyqxbCwtvY8J4E99GOBglYHegYGyp/u
	 /eM+qhwgSjfjg7PH5t56r1WLAZBBesv8nHAUXvzZeOd1zU1Jzc4GVPSYEneQCDWStgtJ/
	 fl7ZCBefp2rV3BAxrvW7VBrFi4ZdpUC/7uVaHHHHcwCZhHaBgiS4xzVenit/v5K0JWmd+
	 apHMeaHIDig+YmhhlM5hFmuvQI/eLS57piYWg0No+nEXjBoMv/Fd0XjkLO1fBY2pROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
	b=uhfzx9wzvBmkpldVq91a5LYj90tadbAiJYKdwoWa+DjyaDjrLae8ntAa/w87AtweDmGb
	 z2D3gksXElaIzM9SBxTSo+YRq3LY9Q6Em2HLSXuXcl4289d1t/Gw0SRhTgoXRBpV4hK6A
	 3IQv6r4J15lEtJOJPYm9YC/J6RFQDKyAeumylJSiO4QF3QqNhdIZfRoguWKlaL3XFxCBG
	 z8cu24as9ZOsu5hxKFQPsMNYeiqNHUypTEJJAbsedCtlExZWHGO6NOVobrebogtf06JIm
	 oFcPG1xEasJbj3yS6Ge/K2K8yA9iGWlwwI2cTcQX04Ati5YJJZSOpO+NCZgmmyhdBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVVOOfOX;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EC606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVVOOfOX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2372733c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830830; x=1795435630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=yVVOOfOXn6/6KBO6iQk+6xV7teurn/1736Z6hWOzJOQG+SNL7XFOjV9r1tH5dV5q1P
         8oJjDbzC/HNxnhyQIAGm7NyvYW+dn9Pmk5SJsHx6yDE0k9t5yuLN2GXWBQPyWVMwG07m
         sSCjjbfEu6djukqxBsnwE6oX20IRdQTZ6AxZaSNNDFq12s3ujmjnZNV12iHlTleoMcsY
         8HBz9IopT9VXAO01oEDTH6I8fWss1axdfPX0wtfo5jDO85sgIjGhGUpDeXP3JWmRr8LW
         0SN6Q4TKrx23p4FyLvBeizPTzwNYuC/DoLR+5+8u6KNhIkoiBzBLXgKYCLrdXmjXX3g+
         Ya4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830830; x=1795435630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=SYhEXZWU2UWLcTGKf0EeuTMMMxN60k9vt3a2tEl+lN5vUwX56WGMid1n4tyDABejgW
         XQqpOu4I/NxTNEwKrf+kBs6kDwZ9eIA+90vjSfAdjTUOotxQufMQorhG49bp+VCUQkAJ
         JtosKMdhBdDayaOs+7WpJc3GqtNRbbGa+SQcKfGjJT1kJGarJZt1wW1ieN/b6PjKnUSq
         f8eWpoK2r5SsMZFGiO1ZG6J/zaw6zcv+aKL+b0gelVOxxyUqkMr6qkoHlfdKoYszI3yR
         0bAysdzTRcMq4oBSJODjfcxEeZ6xnRgG25G9yZOS7tRZu8DSS/9BFsdJwPw9VBeUoP6m
         8uqg==
X-Forwarded-Encrypted: i=1; AL+hErEQEOzduglyT+cZ2NQ82tstLhPNWEEwMLM6RYpK2gBwLmOr3G1/D84/EQ2lfALPVcnnSGQQsE0vMTFdxQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/AOmXRwEhoYK8Vd+AQfblHa/Iip9Hlk0Kdcx6Pz+StGQu5vDq
	RJ0FZ8V8z53rOORXH7c7AxXqqIUtjZ0HQ0tKchFYIVLlbnGjUvpR2wtW
X-Gm-Gg: AYBFou3VT+w9XgUxsCRfpIHkVKrgvitJhc3KK2vLYGPnoosCHjN9TkNqhjamnWEwLEI
	9iGAVRHn0buFzbS2l/0VT7vhzg5pw4997x0lPj/TuVXohAdnpDpC1S96/WuE1Ofmg8/J3vYSSZH
	vmlUWcj4eqXSP9bbhT4zp9rPWzYGU8qkdS1PKhygFtBjmXarWKUWgUVN17wosxMvJk5gubqMBAB
	oTIIJeu3hOixeod2blbQ43B3iKZhlL0Tt7SZPv7yWv8+KKjpFJojI3ALFYyX4gRU2uAEne2n/w/
	uEY+7Qvc0KHWBF81VAluPJzmX72StmslkgEj64Qv9XNVQtUKBG14cNvzVf1BqNaUNa+l89r0SwL
	m2AwTamvEFeRE19vlM1gakQLTcwZFUy4Owso9e2O3K2XxLQb4onY5COOYprrXP/Q3oHGj/IooqB
	TQPgkl2PgYZPHu2K1RWn3VSNvylbf8F8P9uAcgKyGiqERdtMY0m3tHznhE5Skef9h4wKugVTRB2
	xZz9c+EMFIc+VA/hIEDzm2tS+kbivOPviXR6NnKfvxCW7hjonbEKvAevMGtWI0sHD+VQQbFTtI4
	Y0xxx4cTQ0ijxwIGwirPxr8wz2KxNRZU27+HNnGbTGa+nbjnpsA71rABiZhuPf1QmSpQhGcaeHY
	=
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr8706030c88.34.1794830830054;
        Mon, 16 Nov 2026 04:07:10 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:09 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 12:06:56 +0000
Message-ID: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..d7ff06219 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -107,7 +107,6 @@ void irq_raise(
 
  \return any(VIRQ.channel[irq_ID] != 0)
  */
-bool any_virq_signal(void);
 
 /*! Enable an IRQ channel of the virtual super IRQ
 
-- 
2.43.0

