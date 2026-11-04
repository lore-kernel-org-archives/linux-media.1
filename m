Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782971;
	b=CHuYdjL4z5ojiaaevVFTdvMqxhYQzP7ZbFnVGcyNVltnPQhckpWE0G+B0R+6Cxsbw5pl
	 08XujMCjiPmIE3Aijp4VeTr1chnwBXq9GBEKk65S7zGFHPmShzsDnB6jkCWpSymDTKaMT
	 kGcFXH2FJx136qR7796GhgTxa4FRYMTKyQdaRyvGzozMo/v880E+EbdDsMB1/UwqRjI7g
	 PNCFDN+SruSL0BFsGbfPrKWCfG/1bK/1i17kr4P6pcwl1oT6UPIDJ9euenxKwgZr6KCPE
	 sugmHHO5HZAcjhdm4tSS/bWOkUl6cwyxIqmbR7kjNo9ABWbRykGd6qBPhNQjxUAnDiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
	b=EplX6M+/L50UzYKfhLGThRFZ8hs//X83+rkV6FAXna4CgMFs7RF+s1tFokcSGnFlhW7r
	 UC8MT8Lw+fWkZtG+mR/hHgguLl7AwQuabLNyVfcmLA26c55AUGILbqju57wG31TSzbhSq
	 dAvy21kcYx9bJpm1b9DPf2Qh2uMEneX2d6ExUtOyPYGr7SOmld036qb0BHct0IiCrA0p0
	 yGGngMvXwBAOaExx/e3+yDxSn1DrkUWX6YCxRxmU20/eQ1KIxYjKwnkyyCOMyw6KXPkSR
	 5pMYlJbQtWqMutwLTxIdK7GaxofQ74S/2jaQsCeJM0tL3vYk+h9rRSismAPlDBhWCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdHj2hcj;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B9606EE93
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 09:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4B9606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdHj2hcj
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36661f953e4so557890eec.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782965; x=1794387765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
        b=sdHj2hcjewu/pJjLV1f5snSmqxrqj5pa+YnHcZCyKRhPc2yThYFp9l4BVSfBQBWT1O
         oYH+RsVaoYO3KDk6sK28SloHyXxEvzVOtW7kkmZTJL6D0y+rlZTeS17A/tkKe2LRTjeq
         NjtxLteDJw25juRUYKsPtM8v1im0cqA2Qronv0T568l6Y5RfM/zqWe/65FZkPRB+Ok5p
         9twJOwmuZ+YTQwBDUl2Bshvh1461x1DDHOO88x4VarTg/p5irmBSzP2TN8o01mhrhR7e
         Fp3t5N9bm0GoApWLiXZCuCNKHhDQY/7EI5yf+bclgTcgtaNwkY359quU6U4thsbTZmgI
         hZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782965; x=1794387765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
        b=ygIwmmpo/ftJ/GI1J1CGBOYcdOWuRZbPcMRQsl2nXNCa2V2Cjajvox+A6J2OYhd8ah
         a/2VpdtZ+Jt7oLIVmtTFWuzaXbkMGuqmMYl5RLgwaXjsSBjK7uDS+iLZIA6WHVADv4A6
         /Zcmc0p93X7RfZYzqoFqoqi7dvwZe96SVeP85quPpoj0kmNVW5x5sIJM2jSPVTHrAzfa
         /iyf8aVcmbfaicdDn00WRfS2yEWYz6AcpYhqsuyJ6eNcTWktfApb57gYVQm3LNFFHIqR
         S3yI6EU+t3QaV9uBCex/05IsvdvKSsYDKq0866wkZDS0977l5pzdYz56y+o4NT0aCr8t
         g4Kw==
X-Gm-Message-State: APuU4Z+j29WudakrC/PynAavFugZ9DbWwWG8DB+Dp0gTANAyzQgD7gMd
	sZoVwM0YBeLQwM/8qRwFPp+wMtYR7aYQz2kNynew3NqhSncVRP5hUNob
X-Gm-Gg: AYBFou2JFHmhfhexPD6GUrIaSEER+Q9CPDO5e24A/QriUSAp9V04ji7yUk/8e4sT4dd
	pFT6czIDn28NG1KOD6eSxZVIQ7BQ7/ikTN/BRW+2XRd0rD77mRBuz3bZrMfn20LyA/dwiW8Si5f
	v6uLoakTXD0nLkb0X5ccGACyc6es8NTKa4BRawaEy2+vIJhPw7J/vih8tjTfoVxT/aVc38dWeds
	qgWCuExpf9M2e92I5gUEPEGB87+e5TursvrRXSygV9cmOuy+LUkEBkzdQrTDY72kjr54BCElDau
	P1WAswVKxCBQ3tS8q5s3C295y80lZmPG7uBo/REELpTww5iCtb4xend8AWn5JpBEc+o+wEVdbEO
	nJfF+zSJJ8ZfKkU7vURNwAQNcW2ER/LOjxfdrsnYK597e1hLZ8tYShmwAso+B4VebuKfwrxQ7aY
	7WTkuRzDxKfPsUzR6md9SKW9AKROzRMriqUQulLxU3+fQ1I5IBfdauRt+W6HYd+Kjn/R9xc3BpX
	FXfYp+djb6Osb52QYL7wNgyGYLGaHk693rZxK5uy0/9kGpblW3R7/KRCJCh2QZ/vthQ+eS4M3/s
	FfuBydIly+AFIBSMVjLWO3E2y5faun+VOQbUKbkBwguyDZBj8/WTPfMUKG8=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr28116053eec.29.1793782964775;
        Wed, 04 Nov 2026 01:02:44 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:37bc:b892:b6fa:fd6e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm5182375eec.29.2026.11.04.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:02:44 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
Date: Wed,  4 Nov 2026 01:02:39 -0800
Message-ID: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls with a single snprintf()
call to construct the IR device path.

Both the source and destination buffers have the same capacity,
and the return values are unused. This preserves the resulting
string, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..636ff228108b 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		 "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0

