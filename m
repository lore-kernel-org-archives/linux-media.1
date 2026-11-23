Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448395;
	b=i+P1k9KuU8cncB8YemDaCh0IdW60pvRrdCwNx8o7hkss5WSjozx3zjfBaHTiTN7lDcCF
	 kxECn8N/84O/49W0tFU4o5fI/bxdO7fT7GDwi8YiZK+FcXZ5gG/QIoT56d+KQDbWAykwe
	 ARrmVmZUsrzVN8JzD6N2mcAJcI6wbI7ZSb07AA1RPDt+3JNIYANiLL/rPqoHGzOHy1OXi
	 JPiImYxu5ogE4fgvTbwKvtM9rCR36r1Wg0QVlpOjHeF98/3GYmCQmucZYP+3KmP0VGNlk
	 TiwYe0YZSkEqJUtUbn7M6eiotNe117xjWYGiGVrdzqISrw9hxcHW6neNmd7aZKoRvsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
	b=ml6RSXTcAKbZnHWqTATnclPq7p5BrB7BNJFoxENPhoywqHHdtSfudljjYx+bRwBtn56b
	 A3bizNz1DZ4IIIKrfrMg5xu3qyLCEdgkQ/UfpI3K0pxWHqrN4PURz1DQZmcGmzGXRL+nL
	 2RKIPQVlFdAbBcDTAf71Mk4lSPa1AlZKvYqcO2y9EMVOvdmkrsfu5/UvAyrZ5+URa/aOZ
	 CAKAS7IroeCV/5Mwm10c/F+dOU/fC5GxXU+cN6kpVrQTrwPt7eGK6woCMBJWgd86IYJf/
	 nr6UAiAu+czG6Dq9en5YP2kNZULbVVeBzYt2IJG5zInwot0P9Xvp2xvN5azsaWastvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWioAiUK;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89101606A69B
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89101606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWioAiUK
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753112c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448395; x=1796053195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
        b=RWioAiUKIrrz1imjRAGD3wxrhT8YwmkSVzKrz2Lrjdb3pbZeLqNScgpjQZvjgMyBH7
         lh83ISXSkJr2DW5QNOYvvoy1b7aWOL0CyF+bP8SaG34pOiwE4DFEgEW/VpPL5w8G68m6
         rrqrZ8oc7H+BQ6kkPvNC1Ek+ydfAEJSEzplTw/XCKvxu3gVaLIkfq8ZzhXwRVUX0Zzjk
         d1BmiMjFkckULs94pMBZlmBRlRyb1HyEYA73EO8+qNNnL0zZZUWOO5ge/YUjJXJlVK7I
         WTQGbe1K6w2bTkCQsXEA1V+BFaANZSHBQMO+CqbBvCpfbx7fuo6g3Q9vmzIj7b5t2QvR
         GxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448395; x=1796053195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWQoeOpUuP+oE9rrgpL1AbVJmnbQCaH1p6MKTz1Htcw=;
        b=Hnotoqvc+d/FdJmRpsoSRJ/sRoIam+34aWq9snDBlTRuBcpJoddmKn33UZvjlykBR7
         OJWmC4V6XEgN9+zk38T6B7Ammn144OhtQ0LWpZVsbbuqRC4wf2FTWjFs6eIJAd7m0RBi
         cimPYefBfTh/M+v+8O93Xu5t3crZl4jgpYEZdKldEoeTteKlb+r+N9IqC0zXm/z4TMjL
         z1DeitxtI76q8pfA7bogNO8VOXgYxo00r4IIG47cdlSz90+us+JCjR37gpSohpB3ynr0
         4hBAsPmxWOuUBEwep4hcn2ecx+QMkUTF1pdI8TPyw/RGya1lPrdjhPRep9niLpvdgm26
         DD9w==
X-Gm-Message-State: APuU4Z8b/uZkinq9R5RgmWjQ7fL4c8nVccFsUiArN7paLYxBjay2J63d
	EU8yYHZ62iuWV36uJUwzN6BFnYyawxdwQ3+Tz+PUfnwRDd3NfbyLNQsP
X-Gm-Gg: AZFdTZedEO22SvndxVU7766CWHQr3wmzzteZjz5kKGiq0CJbfbTHYisHG/OvDF0U8VJ
	ZWDl02tVTW98UqKODszXyrGR89Ap3GAVF59vTGvJ/rropgmCi5KR0VgxY35jxqJyZqg09dqEI8x
	oj1vbi4GClrp543CKHL8IPyhMwznJbSnaC7epfd2Pf0fJYARJDt7oVeVeFlymNerlJrpB8qUQvC
	TFCAV6kEM+IGrVtp284b/JO/7lfJ113CSkGQAZzL5mGTyo8K+viIQOLPZzFLT5kb+zzOQ11N1nW
	u6USEhYeNbe9wdmXpcLy0lYuSuvXYT7RUHmWJRzbOAAqWJRAxYyvMpILEvQAgoar1gfHupp2k4Q
	m3MnBIEKuBaPLwjs25vwm0paDKxG29gcM6u9lXWx7AFmFtS+qRHNIYMzQXJjuNah3SRUNIIo3J5
	sD4ySg+U1uXeyJoWERgFwe334N5ENLmU4a2x5H4Bx0Xw4H8Z2LT475YHODNWz7MD8S3sFlzoMhY
	Hsyw3yAPY1hw/80a1KVr1mg9S1GtJFZYDK1NVZ49ICPpbFTcAKb6U4lWME8810gCKwoEnJ8mfYV
	APzDD7cCKKzHbtqyxqftdj7Rp71ZD+u8bw2nh3vPEYAnFoM=
X-Received: by 2002:a05:7022:4181:b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b5568c8f3dmr14910765c88.29.1795448394622;
        Mon, 23 Nov 2026 07:39:54 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:54 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] media: i2c: ov5670: do not power off twice on remove
Date: Mon, 23 Nov 2026 22:39:19 +0700
Message-Id: <20261123153927.2547169-9-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov5670_remove() calls ov5670_runtime_suspend() unconditionally after
pm_runtime_disable(). In the usual case the device is already runtime
suspended by then, because probe ends with pm_runtime_idle() and the
stream has stopped, so the regulators and the clock are disabled a
second time. That can trigger the unbalanced disable warnings from the
regulator and clock cores.

Only call ov5670_runtime_suspend() if the device is not runtime
suspended, and set the runtime PM status to suspended afterwards. This
also covers the case where the device is still runtime active, which
the unconditional call handled by accident.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 62ab1e325978 ("media: i2c: ov5670: Add runtime_pm operations")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5670.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 90352140e5fe..dcf335abcf5b 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2786,7 +2786,10 @@ static void ov5670_remove(struct i2c_client *client)
 	mutex_destroy(&ov5670->mutex);
 
 	pm_runtime_disable(ov5670->dev);
-	ov5670_runtime_suspend(ov5670->dev);
+	if (!pm_runtime_status_suspended(ov5670->dev)) {
+		ov5670_runtime_suspend(ov5670->dev);
+		pm_runtime_set_suspended(ov5670->dev);
+	}
 
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
 }
-- 
2.25.1

