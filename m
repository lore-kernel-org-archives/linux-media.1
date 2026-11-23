Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411938;
	b=B+/hwlXFjtbOpxKf/TiJgHnhr/203zcdCGpqhLYlUHS2uak7XAnnyaihGWDZSLcEco5n
	 scjwKeBxKx2rv8cNbPRbDeEb65QMm/PRhgTNxbn7UNnoG37Xdsg9GqhLHHurBgckA1b8R
	 36FKKkQTO2WqBMRLPl33RFLEIWD5Y2heqhkEBTlJidn2XoXVbTDY4mSOMR2f5e+6YtVJ2
	 HKzMnZnhwsld8+w1bQ8abAsco+4KmGRPYQgmhDZCBZUMymVTrqXNhUV53Gjwms1D609ze
	 bSdS8hBwqruVluAQtnGbXFOTDgydrS7jCyOfOKWbvY8Iz4Do9FS1gZsZAM4Acz6+H/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
	b=x7wC9zIeER+McbFL0Q8JlDNzQcLVY962SBbv6kY5WTQ6Q1/XltKTx3EwRRNuJqLFxfHM
	 1zKhV2X6iil7zUTVd9oDgIgstqTbd2L5fEQlEQ5qGGE84xPfoewZOkyHq2xdCTUuzhzVV
	 4Pf3bAnkF1wboNX72M6NsGOEnf8BM7OGXGap3svDn0kMyY2jjveBfsxe8frQWdlx0U/cn
	 0ggC2TDtBi2EhYjQf4refVCe1e1+ZRXEIpnccVkMF+QwinTEM7J9U5/PfvIs2U1DdSdrn
	 i7DLPkmM/Ny+RGKOjj+q8vGZvIhihMilIzS8MdYgd0Kx9yhW7+q7xG/Z/gFkZysI5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNwKM2bz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569B606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E569B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNwKM2bz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so17482975e9.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 21:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411936; x=1796016736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
        b=gNwKM2bzkcZFrwcl5sDDGTNR3i2ivvUgCudjI/j4SKT8Ncd+VOlBilqILX05M5BZcJ
         YHBydctbxhV2DzV6/yJ8vAaJp7qof2XJIiE64U8PDxXOYpryIQf3n495lQbUf6YsNlIn
         3QtKs7ahwq2TspAxv0xKPA/9uHa+ynunip3Fj2KXIwSQi16+AmgRjtcWcIkIQ4UBSpfR
         ZpEvQ8m6DAoM2xX/OUjn+ykAolEANafxpL4BxkOq/9pn/6Qd+FmMli/YdRX0SZxlI2ra
         F1Jmmboa9UfLPWoYlHCWZCQ3WS+VpfXYvoXOGrtqlF48MYiR+PPunQa/Sjt3XKSBqC5l
         r3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411936; x=1796016736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
        b=pAfqUfxW7pjDLOxQgiqGKjyv53dlZxN7yYGjKMgxevlh6dTH5K4Vaz3+Oy/bKvyqnj
         CI5LfN4SwWU4IpQrrT2yDm+4UA5Fb7633WGNRX7EdSoznENvbYDCSEwawqdBZC2AeE5O
         Wbh6aYfC+hutfkCJbJOVbU51s4UAmeec/kt1/yoB9LfO5eKVCeKCI1aV8xW2D8MHtiH/
         9XShXhF9NB9PwnuG7F2sQZxMYPWlsrNqkV13u1QdSdqfB3fvNprz/ye1BfrgEpyVVQLb
         rWj88goUsjpE901bMLShGlNo/czdFCzw3dbGmvUNXc/qiV6LNbLlOsEHMs9ruv734t2C
         n3ng==
X-Forwarded-Encrypted: i=1; AL+hErE08JW1ThP/v58tehq1U7QLF6rJuLUkpjnN4KJJ5m2pDxaRc6dAy1Q3vJ6hcMIiOqE/fynV3595QDr+nw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pc8I4r46TsMnWjSFKOcsQJP8qliQtaEtAXgZDsNpXx3qqpdoT
	+ddnY7PVwzdKjGoyZjg+qF8orDBbfuzDk7NItkBHgADN0Rl4Y+P+G4s2
X-Gm-Gg: AZFdTZcPl1DLlAQDY8h9yUsq67jK2cW0W2XgQgX8UgN3QjKJ6xx9V4UONgIZNIQ8/zU
	Qn0ldo6R4QkqTP/RHCXl7MVlevMRKxRPP+VgdCl+IKUn8A+9Eo2Ywujd5JXnFsGuCLe5UAzo723
	c5bLqRdk3JuMCmVpen9XGnmuBXiasKIdrz6W1u3YSyT2q3muW4JJxutu6tIIr+40DHK2auv43/m
	y6h6gyAyhWGHgloaDLHOJ9fFZKxyL8o4MswSQqWsNRWWVR+veMj9UNaLvScuLBE4jtFGeLdMf0T
	/GvXP0rIdrp4HRXVn3ipMcVc9U6Fp5pb8G2wxPeike14xRiOvscvUZ0JgAjPdZySVkDLvDq0WOA
	HjPQ6l4gStmmzZ9eEXvIx+vqJcmRR4GKto/5cYTMOPWDfcz/bSgvN/8Y1q9L1reL+WBI55oW6eR
	+d3awCYAGuGqhkCmtQjiesW9gmmhKX+lXJFXNFQihMOsRSnNac9m9KZHN7RLE9Mc33ZPH+0QKjf
	iWx1oZmcrp+q5nD+qRT8firFdm23xIf1WfaeQjHrke/E0BuWbBOUksSj9XNLF5OTi0HI/qJf1ER
	+4QTb1zMPokrM6C9scTkUsKKcn6quqYqeVFQ6U+KTcw9qY6fNMLgu0G6PNtiEQuII0JRto/5fsc
	Rw6pCRm/elQjYNQ==
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr190030495e9.8.1795411936059;
        Sun, 22 Nov 2026 21:32:16 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm369423435e9.7.2026.11.22.21.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:32:15 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	philippebaetens@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: i2c: mira016: Use the 12-bit format as default
Date: Mon, 23 Nov 2026 05:32:12 +0000
Message-ID: <20261123053212.212169-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The analogue gain control is created with a 1..1 range, which is only
valid for the 12-bit format, while init_state applies the 8-bit format.
The gain cannot be changed until userspace sets the active format.

Make the 12-bit format the default, and initialise row_length to the
matching value so the blanking, pixel rate and exposure limits are
computed for it.

The issue was found by code inspection with an LLM, build tested only.

Signed-off-by: David Carlier <devnexen@gmail.com>
---

Notes:
    v2: make 12-bit the default format instead of widening the gain range,
        drop the Fixes tag (Jacopo)

 drivers/media/i2c/mira016.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index 082442ffad28..d6db922f01b6 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -1630,7 +1630,7 @@ static int mira016_init_state(struct v4l2_subdev *sd,
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
+			.code = MEDIA_BUS_FMT_Y12_1X12,
 			.width = MIRA016_PIXEL_ARRAY_WIDTH,
 			.height = MIRA016_PIXEL_ARRAY_HEIGHT
 		},
@@ -2254,7 +2254,7 @@ static int mira016_probe(struct i2c_client *client)
 	 */
 	mira016_pll_calc(mira016);
 	mira016_timings_calc(mira016);
-	mira016->timings.row_length = 1062;
+	mira016->timings.row_length = 1504;
 
 	ret = mira016_power_on(dev);
 	if (ret)
-- 
2.55.0

