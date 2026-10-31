Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445746;
	b=NtsSYQl4fQiDc+7TdXr655zbv//JHPIR8S1VE/hB8Yr+ek5ypoSo/vvFrCgZUzdQanZ4
	 zqlZuIIYYCoVgFTGnVINcXhaOJghfFi/OEdiTvhMrUBP6PeJAsHFIOWLBVl5Y6svhdoek
	 EQAucqHBTThqKOSisj6PXKxI8swHuJEvDBXu6+gB7ThPsmgmnjlc1TpwGO1YWoZsqAKcj
	 kmuE8CynmHzNz4vwoU/yt2s5itUbPw606BS6BS3E/kwrq8/eG6wA9vX1eiDj4eB2HTQNc
	 CHP6Z32kqRVxkkK4gykMF47JIQTCVIJnARauXSpozMVk8reuBo3RY1f3NAyDdqYGGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
	b=X5N7jbJbetv4EZiaBoCdT4idouU4B7VANjzLRieAx4yQx5morIMzu8WrYFMNWM7avvF/
	 d9dbWOrqnONsM7vNnZhHRGOxtuN/QmabBXO4dVqVhcHjP04xx8tjGW0hgvUxOcp21ap3Y
	 uZid82oXk69KXkPWRH+UxExNqmm19L9stOVNoLYdbA/UXCBW9TUysNrvNTeR+R60CjmdZ
	 eWVvBqL7i3pIxq+c9/z4/mY7lA7upDpa351lUAHMaAXdB/nz3ZQtQoBxt7TtWmTUS4suH
	 5muPbXHWpQ28cbA4XVfVWPg0pCQyACJi5jH0YbvCbZLFcb90iqdaZJ1mq3Z72dhBmvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC22606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=smYomg76
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ec14bc5so260906e87.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445744; x=1794050544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=smYomg76JlBtZyAHVkitLrlxUqVrHWOxG9QTciE1UGoSL6VtHE7yoLtH8ZrLPOE3ER
         LdAI5hhpM0xD6zCf8ReZkvWqaZ/EsQp9AJw5N3C9PY61euVM/CutyRl6mutSikSNhkzW
         7ODUxC6ClmoF25ubjB0Xf1cuZPhfu8XLXSaSpP1wtEaD0pFAh1fOCj4l2B4VlHbdduFB
         V9mXBkmygJw0oY2gVtkMlCKduJrFaA8lme5PrH/4MBTh2nZzDck6nF4kPj6trRDpdRTK
         qFrVDOrC5RBZ5hzAg63fOqm2dbswqg3Tch6gWHjKeZ/TQZsIuNFY3efD4FSKglhRrNaE
         7Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445744; x=1794050544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpErthRmnc/Sd165TRJRy3hTqpBnrdJ3knKfPzqq1g0=;
        b=vU7IUi+Vh1OGiFuPGdQeDdgIlo/Vayz9dXaXYN9DjJYhxhsQxBs6DV+8No28dIGX0E
         3vOG3jJsTmREB4eQIBmhqzMOlQD4qcssmAtc41+VIPqVnFpBOzxmNPHmhCAvLkEgTLAe
         0C+sCdO4QK4zIP9KMxin82l5TuHyBT9Ovet4ok46mNU+kAKRm7PvsmCW4EXrVsEKnC3C
         Zw6jpESZPwEQyS05fub1HCQkRVImBqInOb3pZVDr5gEwOyYeKHCyVYVGEP4k02VqBsv9
         Myq5UJJbumLuB+yGjYL0t2EzaOtAUIwS32SrNc2ieMVtHNgV6y92CcRetb9FJgzDnYAZ
         lNkw==
X-Forwarded-Encrypted: i=1; AKwUvBwndb2WAECVWP0Bxq2ow4Qsp7aGRm+TldJiXW+9J9VIha8cuOp/2TMOmPs4S3k+kP+O0mL0Jq4v/3BlQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpFPP/XPDmpS1vbP+iNjx7YmH7Be7rsTl5AHnyPOg9KI7uLz1y
	aFekl2azqF5xMQp9YdmGzcMHY6PijeKqXF4pLFbjlg8UaPv2OQ6Ryx/BL6kBdduuX+8=
X-Gm-Gg: AYBFou3MaRpBRpUOdYhbdmc92poUM/go0p8o3alR+a3Awsw1jglZWOpqi7EdPENw5VE
	emgE9BaBpCUC2bNm35JrwCQ5iPKaXQ05lI+/7HonoIwTiQPbBoBIF4Pf1yElVrADeGmB/wfG/ZB
	ZdoSap77hLwwyTTl5gk/q9vjPNRRtBkoG7ODUGrxnyNqmly1nc21FHdBUcGJq0GLooTlleG+r1U
	wB2TC6vBRHnol6dECI8IArvk3bUDR/wWiNu/RQafdTQVOnrkiTQ8Ez1GFw7nJYe8g/juB4hr2iK
	5ZU94yqhHJEQTS08yYTHTagcAVupF0FTxjSw6UUvaWVVsMJDULI1Qdw5Efk4bAcZ+GXiCV1BNzB
	vSB3jKwJFWYDfa4MITShyyzLDyngAtRQIAMrFJG2ibsHvsfpzcejInKnhAXZdOVNtSIC0RzNnux
	XCgK2Awy43aWX1MMjUYsk1/Dz1ybfQy5c2fMs2UrOH0tcVK8IRf1PCG7Yt8ak13L1fpQ92HZfHP
	qvFBxdQgHg8BCizABpCtKBbrl9n8gYIljiAAngqk+KhiBKjHVB25P6MwVsMS6MTWW5odgjdBh26
	IFv68gscf5czZreG319KXWb/jcNrIJ3f1eeat8ludUBOwrQKxX7E7yT+kG7zqSDtDXCXlrs=
X-Received: by 2002:a05:6512:3e20:b0:5bf:d237:449d with SMTP id 2adb3069b0e04-5bfd94c8826mr1847404e87.0.1793445744234;
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
Date: Sat, 31 Oct 2026 13:21:59 +0200
Message-ID: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

If TPG is supported on a platform, CAMSS probe fails on a device tree,
which does not describe TPG I/O regions. However support for TPG can be
added to platforms with functionally CAMSS at a later stage, thus
registration of TPG subdevices should be skipped for sake of backward
compatibility with old platform CAMSS device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf4687a20dba 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
-	for (i = 0; i < camss->res->tpg_num; i++) {
+	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
 			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
 						    MSM_TPG_PAD_SRC,
@@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
-	if (camss->res->tpg_num > 0) {
+	/* TPG register spaces may be not described in old device trees */
+	if (camss->res->tpg_num > 0 &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					 camss->res->tpg_res[0].reg[0])) {
 		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
 					  sizeof(*camss->tpg), GFP_KERNEL);
 		if (!camss->tpg)
-- 
2.53.0

