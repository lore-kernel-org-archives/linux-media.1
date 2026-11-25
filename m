Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636252;
	b=QDszwZs8bht2uK1MjSWDVml01BGGWHTFQgGnIz5fTqMtNJlguec+XtbVuKtTUPTHJ2A9
	 SRvzH5wtl1fs4Cl1+uyoyS0yEhJD/tVjFu8+584Z3C8LnM6T2zGXplNodl/dm+BaB5tXO
	 5Un73nLun1cz/wdWqjPeeh6W+77m02v41b9Xqb4QU/9CDuRH6/Q9NNZmPbLl6YkKc/G82
	 diFIG3eEvaIb0wrgxtHLRv+87QOjAC2gupEyae0q2sEDMV0QNhDrTdVDWfThCAmlYxpaj
	 +nQTHTifBlNXS99mfK1En5VsRrhJu/vP+CbBhij4EnEAkzOi7aCJXHxX17NEbFn82Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
	b=dvXFmVBJng9QbPa19evYl5oVn0YCEhTKWrvUtqYK1WTBRKaXKfX8UXhUV5IHQ1dJyy7o
	 qtmO+b3szyjrnef7v2RmrmOXXZinxzQB77s7tqFf0y8a9mOQDeBnY3Ng6zOjhikmDJsIF
	 IZ6ZXz/JgsbBG001OKnCDI8lQztkX8sfP4bl7XnZnh8CpNXYwhMIz24orUEYzp7THxup6
	 X35ZrPLFAyODn2PH9W0zqSPhOwuVNcIWxJzwbK3ekiSb/NQQoN1id+TneTkXVRVKb7zqD
	 I8z/j4E8dVCXZvECeboQcAsFDRlkmSIU2jdTc+hW2UCFrBk+Kl8wrrJ7I8Hx0tBoPyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA26Rsgj;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0A606A33F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C0A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA26Rsgj
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57309bd40b1so3276408b6e.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636251; x=1796241051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=WA26Rsgj5tZUS52PMmcxopcdRKJW6M7He6TvNtF8B3MOJDu+hxgJfxHb80wN9rVkUw
         aPNn7u6v7LMtPI3FpFXolro1V2G6NkFj8kUYfhfPTgtGmJJ6AS9q+96EevH4GT5Wf3PC
         tR8cYgWZp4oH2lGcxR6eRUkaCiRYPB5FWbZPP8ct1Yw/kdvGiw3GEQZhVszbkHBH2+iq
         uQTRv2pBBAm7swHzRKNcBX73dohml+JFMEzDCofwDobS0LM7mb+Df2gjKVkI4odUfAbx
         aRk4uVaITSaZmPmqESBgC2CnbX2KzAPOjvKfKEH2yqVVpirhz9yL2coY9psDO/TowRYe
         70mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636251; x=1796241051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=m1ja8AUBCg7vuliEjxRWaDN3fncF6J/Yt8kCdzFmSMmEiNDkK1AW/MPmUwQBjPiNYZ
         LAvOtkC/tPmvphg9fw3r1uyhi+pTEbIJLIWg8cRxWhTJjBxVPP1CGewqsy+9+J4syFeI
         tIFyveUbCZlm10OjvzX2Hj/JVPSSJ9HuHTriqLzes7a3z4Gugc8pkzLaEJYMFmibvFLF
         Sa5pnJeBM4aSfDsJtQcDtzIuMEQaiJeKmKPci6OmfAKo8VvqH0J8f97d6Qt7EQHL1RC1
         S1r4w7OgHgIVjGc/TEb4wZTKsTbhkCILof/anFe92oEvL3BVw8bUVH5/ZxJ4no8jPblr
         XWIQ==
X-Forwarded-Encrypted: i=1; AL+hErFoAFRoaxA0X+Xm8fzEU1QqjYDh1DWl01f3IlwUoTO2+ItXqs77RXLSVPNflhBpxNCpyJ1TroteAjeoNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UO79gnXR9m1FJsG4g1prltOVzTQDBk96DAiLTYKOF7STO/P6K
	2YYsSV7rPQtoxtfDsb8GC/FPjh1kdS1GylF4bS9Im/yBDJQsoiryIM4=
X-Gm-Gg: AZFdTZedaks+INlBRtjEQLR53yA5Hou1UBrRcbnUCvEHekU43zG/YR5xHOAppYavdMz
	W2zFoLt+SLmceceTQe44zTrDPeIHwTjOZ0WsqdCBBmT5R8RgIV+17M1Uha10Nwc8PX7ZtpelFlW
	KNEUXdLlSj7cieiq07BqehA0T8sIQS6kkHquWaBbGZvMHHkhzhJkLVFaHexPSV53GCUgLXgANLl
	n7+ZOp/1+kmn6X5LFB0iCg4WsetC4geXXpFrjuHDNDekO4pT1IE1iEDfUQj/MjZiAHrMcdQnCv/
	AZVCB25ol7KLAKChrefKX9idCAFmSdtybsIwpcyQ1eHNrg+ctLVNyhYfM4t79FK//kGCn/hkXTt
	DNKSYQDALxJfCmxIfcnG16SAa4pl5KBxi/fOqkf4j/f/4gU2b1CmXxbp9IV0+twNZYSwIkxf380
	8WvkkVx7jz2XyqQiUx1Bpr7XF1YTcy9PB7iN4ftScrX9bV0HsRxL12rOC6OUSrX7CkgpQds50U/
	OjIJ7XsfRvb7VnB87ezo0FZDRT34tjg3fuGCwZjAq7qPernOBz1Qh0qeSmW5DvWLpGPesbspxzs
	4O027c5U0J/1btScXR8F7QjL1iy3FInbOcDQH/sVzhGdBnKUEl7Nqrsm
X-Received: by 2002:a05:6808:1785:b0:543:50ad:baae with SMTP id 5614622812f47-57a0d817ea9mr22285415b6e.63.1795636250681;
        Wed, 25 Nov 2026 11:50:50 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:49 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 02/12] media: tw9900: release the device when stopping the stream fails
Date: Wed, 25 Nov 2026 13:49:41 -0600
Message-ID: <20261125194951.19072-3-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

If writing the register to stop streaming fails, the error path dropped
the runtime PM reference but left tw9900->streaming set. Then, s_stream(0)
again would drop the reference again and unbalance the usage count. At
that point any s_stream() is ignored because the driver thinks it's
streaming. Always clear the streaming state and drop the reference, and
only report the error.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..e9d384039b50 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -303,14 +303,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		ret = tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
 				       TW9900_REG_OUT_FMT_CTL_STANDBY);
-		if (ret)
-			goto err_unlock;
 
 		tw9900->streaming = on;
 
 		mutex_unlock(&tw9900->mutex);
 
 		pm_runtime_put(&client->dev);
+
+		return ret;
 	}
 
 	return 0;
-- 
2.47.3

