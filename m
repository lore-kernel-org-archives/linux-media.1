Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466586;
	b=zekzqs45L+x0AFE/BhTHsC3H/WlnmZUKpkjNYUyMmYCBIlF0XuL30oh4X+Mu/htSjUP1
	 p+ZXi64XjkzVwpGR1wYTioY+OR1lsutoCqQ6N5YvuhFhrG7Cz15cv7sWe3JeOIRtIJGNA
	 V+NzjE0vAQQYE3DoteOq3yxGCn2ZQRgfbndy6lzE3k7qYNL/oz9xMCsdf7TG+eupS0VYv
	 VlwKdE3+47Hw9j9f0SUkuQhObVA7AueBBGcbwQyYQjdhpBUaeaSO7dSEggAGXbTbvQitq
	 HNFmbRyz4la0v3Z7X7WULs4Y3lDkJrsGCy8eukL3T0DkyBJJtWIK126Fhb/ITCRQJtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
	b=bX1F9iJybUcm6Md6azZE5jBDHyum/OFsu+1ZpcQqhy7Pi7p2sgUeY6oRE3rREdVukhos
	 v9BgBcv5K/JYcfLBkHMkn34x8kATqn8UN3o5F7E58herSUW/uCVxzhghZpGw9WCTj23lC
	 mZn1VjDrmI+gNyOqAmNVeUAoB1+6yhlWqgI/2YiN9ROlXlQu9oyAiWH8T0dloFWumQqkP
	 t/vkkjl78mwbkUpOWqhQ7xI8iupqQq2xZCTBSxzJdogF7dRGDtAnFxwR4LE0YBWWFbArC
	 28l+KQYbhnHxIGI+QjZ0ANKlGradZAgmOtkfzpapRS6VPoEkqm4JY8ZWH2vOvuErgyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z/TJ3Xhf";
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A660A260E
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754A660A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/TJ3Xhf
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5569551d19dso6466711cf.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466585; x=1795071385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=z/TJ3XhfSGoUPqhZUqv/zZmJ9HOGxzJ00XDyo9zsrUC4geZxxRviNE1Gku/8HoBFlu
         5srUqj87jFT+sAfQ76XHxWgzOMQNmmWzG39wodzkCZPLwPE40EgYuIwHvRsrp8HheZPf
         DdxXzAyjs8Tu200PkN/XLnzdYqgaUHMA6TPzQAiLrW2s7ITyDnu3+NubVY4PAV/KBWEM
         Xas2jOtk6DrhPj2Hh5PUN1pa2FoAeEHaTjSREcFqcX7PuvINg+b0ni1KBeMeuLTjCEdE
         0VmlletuSyAAiecrQWVDCD7ib4zQsK8DYTdP19WgRgCvg2VKi5J79FtmMxHxsLydvoXc
         o13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466585; x=1795071385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=mRb7PTYBOlKXT9aY5pXNOSJYeKHz71i9X52f2bUGENfnyHMUedt6dhY6vOf2PXnIeo
         IHqBDy9n71HTQAcal/60/2RcAEJloc+wN252ASK1134ynjPV2eYag01yLm1IMy2HPFkW
         nE46zrVkd26QZ8ZYHtgU2M/7KK+96CfG5EO8PCCJ77b/oN+2DeS29ti3SdBDtFJS/GQi
         kMQuhrQOMkM6dh894xOAiMWIOOg/IUayKAChARXjISRiuqRsWXyhF2cVVxIwV1okv3nZ
         3Vhl3r7bkjnr0NA7Ezt9iemBLZp8sIQI50h3jjbZTxyYw3zXY9Q9J/sSWTmUvan6RMqU
         4mKA==
X-Forwarded-Encrypted: i=1; AL+hErEY29DSFnn0BGIE7wmGuifsw3FX/6zijG0HzbG6JB1sfuy5IMSEksZj+WzmCGLk5tGbPubW5L1Ub4ALrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vBhD3STyOVwzP8a4GETx/oOBY/8vT1oQNCG2MXwwldLUtyXp2
	qOE3q+Kh1GRObB4VGRv9YplJ0vnPlZwG8gG86YVlDQfcJDx1HAqWchc=
X-Gm-Gg: AYBFou0uSQa0QMy2Q2yW93m44oQ0Aa2ZxvqL2Y/B5zVo1og50+aUsGRE5P2JSdZuD9J
	b7Gkcbzo6qWtx5R46I2BwGY/+R+/o8qnK9T6MF+cPDnW1sczFxozLBc+0oqaELNbwyFSsuoQ9Vt
	XtWgzNjEPS0y1GzKlCHyXXQzJ0iQqd5WxQ9ukFLdvGqR+jx4fM3wNKsvqkCbkx3Rk3alssMUSCb
	1D3M0ottnJPjPlyzcyaCZOdQi6eDId/+sogMbQ4U5YCo8001pC5/LRbnXqT/0AxY9FJSPlIoFIU
	r+3LyB94CsJ0kgul71qvHOEqvW6Pm45t2gLr9FV31mPlLb4o6wdq5RhRr1QWG9GBzkmLbpAruws
	QC9cmkon+pO8P3vPUX5YPoG/9evFqSAAyldIjEjUgtVE6DUNMsV35GIG4mi9K/Okhe4AKC8ptC4
	5TZF3SBOFBkdBkBep9eqYSoFyjHBLR6d/GDr2WCqzbVJemogpgpTYF6o5e4JHhzZYNiNVYuVlJA
	qUBhdXAWXUCDlweQmm/lm+K+rx7E1jAaDfw/CmNIhUFnz8+lBzkatYNexCD6G0a57Az+RrB5XW3
	7cdQ3cpXDlCWZZXGSQwaRPjkRHwMrQ1adk0UMaLWex4gyKeBlYymNVeYdf5ZUrGQGzvw/8Akbaa
	Q+nCTuUN0Nc5IAzFSihN5m47HKO8ENp+NB3A2T2jNYeAr9yQpvcPnF+5M2ecix4O9lbLYMZjuyb
	4KbIJt9ntit+f4drIBsQYqBlpZwDWWwc4r0maQ0Eiv8dY5YBzDguExDg==
X-Received: by 2002:a05:622a:1dc7:b0:54f:7f40:799d with SMTP id d75a77b69052e-55956e5ebd8mr31073631cf.31.1794466585518;
        Wed, 11 Nov 2026 22:56:25 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef054f382sm64827376d6.43.2026.11.11.22.56.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: sunxi-cir: Disable the interrupt before stopping the hardware
Date: Thu, 12 Nov 2026 01:56:23 -0500
Message-ID: <20261112065623.34296-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains registered after sunxi_ir_hw_exit() stops
the hardware and rc_free_device() frees the rc device. A running handler
can therefore access the FIFO with clocks gated or pass a freed rc
device to the raw event code.

Call disable_irq() after rc_unregister_device() and before
sunxi_ir_hw_exit() to wait for the handler before stopping the hardware
and freeing the rc device.

For backports to kernels where rc_unregister_device() frees the rc
device, disable the IRQ before unregistering it.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260729153104.3F6641F00AC4@smtp.kernel.org/
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index e97bd9e03c1f..9d22ad7aa94b 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,6 +374,7 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
+	disable_irq(ir->irq);
 	sunxi_ir_hw_exit(&pdev->dev);
 	rc_free_device(ir->rc);
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

