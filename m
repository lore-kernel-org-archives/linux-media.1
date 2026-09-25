Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEB4915B5
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344036; cv=none; b=WHXNXNTauHjGIggIUCEtuBV/JPLHYdFfu6BeOr7mo5BCyO0Pv4gGpEJbFXza0Qf8tAZReAfBdPTQpvA5g/l8k268MMmyjEN4oO5m3Th91JoM7VYc5f90MyvJq/Ew7Ro1oERLaHO53DkeuR94zVijq49UhVSTh9ONRlbMXRD7Emg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344036; c=relaxed/simple;
	bh=k/YjhEtT8EG60IOpEjHDyljw3SOClRNq2Ltj1RsTnic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=X7sOxsruXyXlc8dezbSnsBS4GNNgaAZP5k2pasVAbNACahMTHm/jE825IwFz611tFlomr/Vbpj9BwRHc+XE2lScJIFPjTFRAWjgodjHhdwjTfYncxWRtX3LmLe/0fGeP4qP9/lX1sIp+Mf8E9Oib2ZbfynsUhvwdoEWYLpjtXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8oyklmA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8oyklmA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so721051f8f.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344033; x=1790948833; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmiAhRrTIS8WV9DUN1ukzA91bDwl3D8cOW54R2E2MTs=;
        b=p8oyklmAMfr+C9iHmUTy4xWTQpJ9Crym6OrTz3JsqOPbdh5AmAImGKez6q1bZnrBJS
         VOYP0ArBcdYKuXFbyRC7lRkMtHY5FLjdn+tjGmJsp5QVLnqmDFJV2LrPwioTEq5Ajyu4
         I4JgzJSfrLflDXbHCzpoTMJdJUFf3a4DQ9mQ35V3lbPtszSKf8ySGc7vGgMa3SOQGnjB
         RI5VKcYQavAnrlbPcSSjecmQJEDl9KV4EUl07hQazUcT0ee0Eb8OKKxo0xI8t819tGmH
         ZD3w60wNDgANmolYUZnpAi3wUvHtUf6Y2+SaTNMYqNgFtMYSvFYEAy3xcc0wHwjAgoCf
         khJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344033; x=1790948833;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmiAhRrTIS8WV9DUN1ukzA91bDwl3D8cOW54R2E2MTs=;
        b=mcMlhBsUQWiFjxfPGBX4KGZWZz75MBzw/ZjJdJgCo4KNJavDq/CSuUe6sZWUoSdMFr
         Xtz+QHqCODIFYdiwFV+l6OoJL67QL182PaEAH+UAo3gFAwU66GTciiQaMY7CSksd6tVV
         bAdiQ29LarS35fDHRqTiOVMMKhQGWlYC+YEpaX/Gk7EiGmM9QmY8DQjaXkq85HLh2B6L
         jpetFmUxBTVyVWPAS6knIGkwFKdCFHpZC8yDaAwJpJiOY0cxKZUsLJyaDZsTzXbaCZIu
         5e9uj1sLtT450KY4yq1e06NgqcQvuDKr65z5NIFDTJTm5LGb1eVWWA28Xf2Q4Rz4jVKH
         CZZw==
X-Gm-Message-State: AFuF++l36okarLhByoA2hDq7uPSI/XK6CE/fXqgNRBoaGrqfXY4jEATE
	0rPpR/tnB7HMGILqwgvCTYqvyXqvzLqD+XUHKTEtMX7783kXzsbhz+tgB3TpyA==
X-Gm-Gg: AYBFou3zhnfWOv/busa+8STB0zUq6UtV59JAtuAKVOWxHRktfr5GcETiURKRLvQjss8
	hnkyi3up9EA0E3MDclnGM01Pn6OAzYl7nbvafIGKf8EILhVSeiCeOZBHexuVKBsc1rAxB7tShKJ
	tQMq0RGnaHS0dgNa05A8JSJcY+Gl3+rX9zvkG+VDJleGMOiTt/3wt9IRviJmFIg7svD6rJNXPE/
	8Bb1CQWMfStTX3osx2D9UGiQQFzV7ljbf5ij2ME3S3knUQQ33AIckYoYbgJo9SM9jL74Wh2SJKv
	Qal5Fh6GtnKcJ1HyzYqbXGsQxpIUA8IB+z0NVhUJO0hTGAPlrPAv5878tNxdmUO8U8bHTmxh7GW
	9C9s51shJRz9sVF+kaqvpocxmEPMQx3FaguVZ0n0I7uN1fZEUweIgcxqvCkaZ5WpJ4GsOIQBHSa
	LucgoDjq/qQWnZiQ+D1OcHlmhpWlpumFWLRGxMnIz4P9tKV8LSsyvz1uAM0VzxCfGl/ueUK50/z
	77WT6tAZsBQEc58ZsG81y9nbWVKG+rvV8NPlVDLUVVkGpnaDvVcQso=
X-Received: by 2002:a05:6000:1864:b0:487:360:58d8 with SMTP id ffacd0b85a97d-4887177c2a6mr10127312f8f.46.1790344032630;
        Fri, 25 Sep 2026 06:47:12 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm7660766f8f.4.2026.09.25.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:47:12 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Fri, 25 Sep 2026 15:46:42 +0200
Subject: [PATCH v4l-utils 1/2] edid-decode: fix incorrect shift
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-jorth-amd-2-v1-1-41deccc043f0@gmail.com>
References: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
In-Reply-To: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
To: linux-media@vger.kernel.org, Julian Orth <ju.orth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790344031; l=899;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=k/YjhEtT8EG60IOpEjHDyljw3SOClRNq2Ltj1RsTnic=;
 b=aPHkjgC6UZtfUqHQu/avWBlsYBt+dCRAyjXbxAycKXYW4vB8fu03hxxW6oU3bJLSS5GccVbhH
 gIVxXalPf7oAZ/zeDuf6dSFCcaWkITCui8K3105EKAajyHd087znabU
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

The panel type is stored in the upper two bits as described by the doc
comment.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 utils/edid-decode/parse-cta-block.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
index b52860d4..a52bc115 100644
--- a/utils/edid-decode/parse-cta-block.cpp
+++ b/utils/edid-decode/parse-cta-block.cpp
@@ -1711,8 +1711,8 @@ static void cta_amd(const unsigned char *x, unsigned length)
     if (supported_cs & CS_BT2020)
         printf("      BT.2020 Gamut Supported\n");
 
-    bool is_mini_led = x[5] >> 5 == 1;
-    bool is_oled     = x[5] >> 5 == 2;
+    bool is_mini_led = x[5] >> 6 == 1;
+    bool is_oled     = x[5] >> 6 == 2;
     if (is_mini_led)
         printf("      Display is Mini LED\n");
     if (is_oled)

-- 
2.55.0

