Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986643;
	b=E+dcg69kUzaWh70zdFTjKOYgo+gNmRGXD1OBRgunb52JrHIAaTWDrSmbJ5xCFdJAKJj3
	 5as6OmlhU3izDNqdSomFwlvkhwyDaVkr4dwv/Ksw0kNozJZvcV4VwPsqO9tuFlqur9P9P
	 zEsYoMTE/l8UnjH34xhidtfmVh+6G0V7WdGgvIrllTH/FDLcRnKqB64pceucB8+HneZUu
	 vZSTYyoAlvJXZCuiMo1b/QwSyqtIiqsbmLEkOUL9nNmsCcq1LUA/MuJY8/L/fa5pPaGAj
	 DEbp+ziPTZZhyrs3TrtQ+FwtLuWrELb+EE1FpB/UHnPZCzHmoANY9LksIhUxq8C3G/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
	b=fcvLsBl4UiJ2ec/u6vlCCrgNnxYcjoNlFgNhEB0UlZ4MT6kMl6m8GSHLgZUWznV4WZvJ
	 +Y00j/d2EP0cuEjVAoUuu0BfVrjt5w+tTNQQqkRmm7QMEol+9Iz+eFpSTfWo3QxmnjnGl
	 djwugtVZJ+k1QSlJ7tkMGbJwGssfcphm7gZT3H8oCYWxqEyT95UWfugdRrAJqCcZwSV/I
	 Lgj8ms2vBEW190VENvZVAhmjFv4dW3a18BE1bcZ88oG8EUS1VuV8+fHBxSk4lyrwhR/aO
	 l/575EVT9VKJFYf49L81Vu8/59AMnpGnabj30uzlHs6h7MGQUaCFI4IC2JApJoI6HIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cxhBtIU5;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F7606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cxhBtIU5
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1656129137.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 20:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986641; x=1793591441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
        b=cxhBtIU5tn+qytGiM+Kmu4TfoPBsXWL1lUl484rWOdnlmx6Qjrna7WQxq6S9R2tiWP
         nsDPPjv5BBxr2BOv3tX+mdQNN/soKE+uT18AaMl6Z/f7L6CyFHCLNCWUjOEMaoao/hg8
         9xXi51QNL/4BakMjUUfN1Ue+gHX7nICWrEYaaY8M2N6kIdrHkUgUuY01iONu5aTG7vUY
         T7MRCupXvrC54I2moXMHY1ipqFkA8d3boTrU4RO7k2gQca0pqLDimogEuWUzCiVfTKC8
         rKbD3qaU4pKnXGemRZl5ai5cj71yRt94FApVAakKhTMcylJXcFpKEz7Qx1iRaLULZ7na
         fI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986641; x=1793591441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2QE+OZptzDZGsYhruEEL20JBe+99WFrn4g7yRcm+wU=;
        b=JI3SHeTqeaCQ0av68e7ahGWET4tNTJPD90FNuBXheyzxuuIk2BRMXk/eYpSMk/HcG/
         +ypwuElOslFk5+bWBiBKFAAZemwvOArluX5jr65+6ZU/JQSJMdAWqp8p9B6ksibzWXGE
         iqzvJkuyDm5LBbDbo0rOuSSS632DMuJAEXNbRjGI6r1kPE+yKs25ruis3ecBoLki6pFQ
         M+iRaGsj6B8urYEQvob/UAbvRYAl2/hocD3uZIDjq6BHjdASjsmICgvhXCYbo5MUywOj
         BIyDb3V0nGa+J7cM7yjWBO86WXb8MdON1TKFne5Ehn9c+4VCrvVwKSwqo7WOMBvlzkGx
         r5CQ==
X-Gm-Message-State: AFq9FYLCqI39x+hCQ4cFE3bY95zJ+RkS3AKJvv5+iGcV8+G3gAoCY+ih
	Q0d33nylouhvsQj+kTVB43pR5HZi2imWMFimGi0NBKr4tQoA/i9MX0cs0mgMVAyg
X-Gm-Gg: AYBFou3dQeypgcI3uYhOKRysyaDej4YzydbpXIqRch+3+GkOy0Fth+7LH2LXtiuPCMc
	jXmF9YrPs96tMOHuh0x6Nl9wKjhBFo3OKhUfGQiMRbqdPRzRroU+LPOHJWBwuPhRUufT8MQQ227
	oxD2WCX08wc8mFbHU+Fsvkw+AGn9x8DPAne7wVaca+4w9ae0JXdos83tfTNeHDt7WhhsXCiHzHQ
	M7IGetFLAgE/cxaO4mM8YxGmapRLNOFylvHbdziq4CiPD34sK3NH2Rwp+qTlwdVIhrFNuXR7tbt
	thzon1vJy9/7RryKCucpPOVgaBTOlWCc6K+BFBAiIuFxSaEi/JGmfjTlUKKHx6NUGd1NyyfdKBv
	bKdkP6RsPi2aW0ZtdYx2sn4Ig8d3VJUhqzDRUPDpiLB6z2jMN8Sn5hg54yR+NtO7arR1d848BS5
	kUYwgPXdPpAlYSke360Rnf+RaJsvgjUZDEmizRMNafMydSjeiiTM6aeXk0b+l95FwgT1KyAGgp6
	Py5JJdqd7bRi+knlpJfdphc6LU9Xn3j5kjjFqc5JskTARMdVWLKwrsM1wdyNQqEvBcxQRuCP5hq
	xqaS6DJCEH+vh6q7iBOU
X-Received: by 2002:a05:6102:2b83:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7ce5cec77eamr1900572137.35.1792986641275;
        Sun, 25 Oct 2026 20:50:41 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:40 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 1/5] media: ov02c10: Drop duplicate register write
Date: Mon, 26 Oct 2026 00:50:11 -0300
Message-ID: <20261026035015.110903-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 8ffe0a07e..80edd025c 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.56.0

