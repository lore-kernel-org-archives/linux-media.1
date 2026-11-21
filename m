Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267976;
	b=TeoB7P3x+FzMjnU8gKBbw3ipOE/EHNwkD9Nx1WwrVrPiSv8pPbq8SnL0rGroU3XxZ7sf
	 CBuKL+ubngGzrpGxwy+duGggRkP2P8E5qeJxHAGIaosdAtlJ669TNHI3vEbQylB6V/6rH
	 Kd9dUgmJrkWJbQgmhpm7XahP9kErOwRN8nqBSYty//Tmg/rbSN8PcxeSZBOnAvEfDdpKL
	 JQ+CqPKSrQ2fC1AR/VO1su4r88Q+pvoB8ZMunfVUgRYOeG7v5lIxcvtt0CeJDS1uYefrk
	 xJoMVKxUOoids1YnoV8ADViTYBNRP2aIcWUrs0ApfEKDAQnh+sIWrRaYzGqo+75d1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
	b=rHNzp63qtkluUSMs0wX/VTnDqSkp7AS99zROssrwjeLvKq+9fp8xsX9pHBrn1xMaZOT8
	 G2TZOxUZE2bQGISWV0HPoVNWzeW7xo++nHktB0Inkk8hOgTS1XzS1Nhr1vfgtBTmY0U8K
	 3R5NdZfLgJkRNJY8NuP5cNUenQbH/6L+HRR+Li/cyyUowtRDejPi179B2QSa12kQ1pbY8
	 E7DVT8nrUhs8TJ+cPg6NdAN5p6mwCAGIucualz3pU5c8tcM4rtXRwrEasGWW6A2/MxKBx
	 w8M2/f/ht4feA0b1Y2TftsngOwj0FlOUL/n7qVvAttDOK5gtWAPfXz54zvc9m9BNlJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epp9LbF3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C7606A6A6
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612C7606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epp9LbF3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15743105e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267975; x=1795872775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=epp9LbF3MGxPn/LkJ1X8nf7p3j7pUc0fmmllGahYu01SqwRSXrjKl9gq8hCP1fUlwZ
         NqDYv6ImgisD5PS6cxJSvCeVXcdwWAOq7k9G9M6ZBrxynhvxSTmCbkVV0Fs9VXrySSTu
         mFMLhhPqYlP888Jj0vGEMchrph1qDhZbMm5XoqbnyXuuN2/zsb09wSm3XkwsCDpjmgRH
         CblPpEF0wlC8l2oPA90YdjMuHYJs2VPE6TtL4T93AId9MCHP8NooTfJpuseZDZt+/9P9
         Spe++gV/NH9M4SUu5T5MjoorqhkXafmVLP6BPJ/g2FZUnmzNR2KD3iRhgR8uukQOp0j8
         fwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267975; x=1795872775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=zmDIUqgkBc3O4ds3fTbyAsiSC9/seXM61td+ryf8V7hDCIVSYMqY/Mj/J9tJyX5KLK
         g/GzNeaI44CnnaTyw8VJ0o+Xs9aiJrqw1tEgxLi8eKhIRqk6x6MzT3lLuYO/SprXtg6r
         kCl57E+0M0QYW+VXgCcg3X+mByYbwhHTeAvQ/ih4gJzr+uq3chbP0eRh610zCkyMip6n
         1jhHBAn+wYVG6m8WDZ8HQ8LHXiuyy/mDwiPwn5FBpNUof/Xm8G4asm7vJn8UHPOjs6yv
         Yf/OTGWkNRATxkPJzJh+1Gi0fp8WtM/IKBKlONCkfKBFzBwlJbrW15mMp5H23GmVFhK3
         CHVQ==
X-Gm-Message-State: APuU4Z8tM0NKg6hUZCyJZ8qBfL4F9PdXt36HChFb11KTtc9T0ZGN9ccQ
	gPpjFmv/stpn7sfwqcwz+qglklNSgHkRXYHzV/EArLVZ5eBeKrBpf31vu02jJQ==
X-Gm-Gg: AZFdTZdekAqkAqW5pWB923h1N3r94wBPHNGEvlrE866DLqpIoSWo2F8bEgZvjkKNUhz
	jf7HxbLnwLazQ7xXmmAaR4271llXMlLumTjv8hNVrWgMi01gWmAEiP5QS/iCJ7Rq3N+j2HA3ccM
	bMKI3hct+2NQEOZmruGBtcqVleSws7vav9oz1XdEXH7a3Z9SRx10imiPggnpVd8bOGa6Cid5wWX
	gxJJ3Q9XZZgGUsKNkJT7IIAALEPzr1c1D5JODVWluOaykXFAnQyGFHOCH7Z+0ZQakk9RJFtldxX
	xJCobokX90TxtpT2RneQcY2BW5z5fTLPccIyrFuZDOcteoeN9xRSxaQHqVGCzIyOaXXK/7c8L5Z
	qQBNXpabWPTe+T4oKyAWpAX8SoJuxt9HII8QMxfAhj7C2+crSoQ8y+3vBGq83RbbkOYJ0ymfeGB
	LaQnHg6aWEBHy8x45/O9Q8Y+Z81utWxN3QZXVjsU5iJMcLvlPOy4XlKdTIJdPW2medu3v1TjWUN
	ykHJ+4p7/hcwlL/CYmbm2iTkuVaIqhB7QW0z9MmKjJoeuhbwFv1ByPdIiTEIE88tcSqLPYUuOmm
	pAdwq2dY0tEh3F610t1H8ft7hEVyQld70+gtUMjoem57hFBR7dTlBP79Mc35Dc81nucyo/OLRaj
	xoAF8yrhcn4sz
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr132851145e9.0.1795267974678;
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 04/14] media: ov2740: Add OVTI2740 ACPI ID
Date: Sat, 21 Nov 2026 14:31:34 +0100
Message-ID: <1c093a6c4acfa46ea1c4b159ea0d5eb2f3085f14.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b7c0f2890..7d786d09f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 
-- 
2.53.0


