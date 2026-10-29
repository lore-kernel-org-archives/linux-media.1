Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267737;
	b=RTJUEKz+83IK00wvsPhhf8H5ob4b5ZZ0HIa9zAwVnDARvJYTMLPR87HcX8Vz6S4NBmJG
	 zZd/Rl0dFAVZuCJb6l6jDaD88OQMlYCXgld6ilUTBwr10oBurNa3glFCW5RGA5GeFHLa7
	 u7wvwh291Hc3VIa7GXN5PVE3M3J8RMAp+DDCv4EVFhoUQvhLkWBXg5VGvnJDpjX6lHXUn
	 wsn7AFPDhUflRAWuErxYv2oOhSt/lrcxIC2iq0Gro4rQOaA4FczPBkWbrWWop9UtPeN8l
	 DHqAypeGimTsCwbnfG3G+T8NlfY4GjjjAssF399tKbdsBdB3Tjx/PR4GtFAZ2T/sylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
	b=kmHa5KWL+kVgqSS3fYGU/x3I0hiNMAuJjIKKczNrodg+xZbfvz5LRSUCqv+bzv5Yoqtq
	 KiY4at8dT1ubX+8i6INnBcMb92KxZSmiPi0v6fe3GrhZhW8Wh0AKEcnvsbgQTpz8GFRGD
	 Grzo0zRCnoqQ0OEocjPiPHAMGtJUHy2lOan7Wj5fFbS1WfuGRiXK43agGNPU8nAC2LxIp
	 mEMoUYPeylnlHfls7svMIfT5CMP5obHRmY2cq8xV6499Lz5EKOanP8x65aHuiMm5RHHfb
	 RLU6yFwi+xaR4+lkiuaYUO+aFZo3EeWzbhQO3VKwyV05PTbMWsLzM4O4ycu/PWyy9Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="CGMUh/mk";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32A60A382A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D32A60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CGMUh/mk
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so1315438f8f.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267735; x=1793872535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=CGMUh/mk8Rdot8aWrDqkerskWgkN1ZWGTn+KNcvoW7PSLUH5L01ik6TMFJ8Xe5qLlF
         J/7wxzL/Qrvb6be16BQPsKJ1BDpMpgRwBbGGyskXymZ2yX0WkNJImR0laaDQOfuvc3yN
         hZZnV29Ai6/AkdrP+VtJa+6KF0+J9pHgIw0U7al0N1F6GiZTxWTylLG35otQKPeO9d6s
         OrIkNBSE4L7uyZvtm8vCPzolIQB0DlH2I86j3x7ZCj8x1DS28diXZD7jES7kj32fgDe8
         10eUPH4p3FpB9oKR6OB7q3MaXR7xfJsUA9l4aVOoxdaQZH2qE7yZSK54cFk9L9nMEMKa
         CHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267735; x=1793872535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=SfjY4M+NkQhmSQGZ6y3LzhmPm6P8JufEe/5EqFlbS8WPjMdxrRpWmrRvqjNjlFOU7C
         ik9OE98MOxZ6pNYXpQbyyEfaxzUpN3hkEWUIxQ8MN6xPTONixOdthnMwel8Afb5W2IU2
         6FtZiOXrImYSxDojH8s1w6MXW9B0qvjlfCBzNCaId38jXnRaYFAEIkmaAtQ6lO4xOkn3
         V5/YoPIDeopwJ1tWc6AWxiRh2uNN9szpa4b/w0SUaESviCpKe9n4Oa5eZmkkaEvZ0HHV
         62phZto0zxV0VJUUFwvQAOhdXrxtvcnLnD1Oybf5iW/oFY7YozWSnF9jyVSTwijtNXL1
         t2mg==
X-Gm-Message-State: AFq9FYKNK7UKPdtsVUGARIwFyGvR3AG1kvlhY2NWhCN+AijBtWMtroHe
	fPLj2bEX5r3y5Gl5/UXIu7zgYOx+cwUjtMZQIJOn4pkP/sVdSkmdSpy3lX/jlJKAUqIlor/gjq9
	bpvuR
X-Gm-Gg: AYBFou1JTu8cowp9IukQ67+F7RHwhiktCsv1HNdafqJT/1Wt1FdLg2OPaMYIpAtBb8x
	VEAMYdTj0IdTF6ezvuCwQx7gyUjcFC5ThsdzGQp2LKRAjid3Vr5MNo22QZ/OYJucFGjS6QO3881
	bXVgA/Yz/a1DssyBEz9Wmp2DdM8G073TVDUeY8pRRQuHhjL1q3JKbEHk339lPAeOdHuhenlc40L
	h+Fua7NQyWLHSAFuKjs1pAOtzp0LB0xRaZay56MvDrVNSghR90TZUyJbcLn9twb/CJXN45zOG3P
	0cz+hOElcByGhRq26CWMqKm7IYNzkvjY4TwpC2hkzXhp5GZJCYFcs8oKoZkYZPKR1p8SFH2SrTX
	m9cTjUSyWST57vIQh6PHsXM1iSp+4/mGZMLVv+PaNiUuhf2WseTZreMv6Dz3c+UdLmhDZDJUzDa
	chrMzhqBcdIm8H3bAcJctFGzSMYXYhMH22YNh0frtweNbMkCbtO1eJMG5Hh+EXxWd6iqeeKlysD
	FlucFidnd9BN/6e+JUsqEi0cnANFwgiEQyJfpA2Gd8c2v9NsLmb0GUTq9SUi6M58goyurBn8wId
	4nOTcp87xplL4OWSfVk=
X-Received: by 2002:a05:6000:4281:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48e5d5c7104mr10359040f8f.26.1793267734616;
        Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:16 +0000
Subject: [PATCH 07/14] media: qcom: camss: csid-680: Enable RDI SOF
 tracking
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-7-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=bod@kernel.org;
 h=from:subject:message-id; bh=akubu0rGSbK8Bi55Bu6Z8+I5lQw1Ol8/ItTGES6zVpo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLFgesLqwuGjFWWlQwZXxMNo/ISsxJqcmXv
 HII85wXXZKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 OsRzEACdcOEGVv8/MUuatktqnQOB1z7ppKozXH/zCqjTbd3hSK8Nx15HnQb/Jz/ibaTGNjXmj0w
 3BE9wwV598sHQqKGK5oNb3qQwXJVUlfkUO9IW8jEg01HDwSdiemAi2EHSdQuDpr5MA4155cw5Cu
 dXb9hWv1WCQ+/vt+bl82lJfS8RPxhmErB29eG4e5wnFSj1Ejkyz+GV8cR+wK8vjGenhR0h3h2Zd
 gQjkRnT3ltYVVfHpTTBHdiQlfkhrTfmkBESWGAriaKGf2hFEgnkWH6dFdWyT6b8pStwRKMIB3Ty
 cQOQOfuXk64kCtelBJEJMp4P7YiPcxvJ0ISFpOFfSJWKyj9X6BUlBhoNuUMidBd2zfxsBHAVf8l
 fWHZJT6NQQPe0Am3mrLpK/GcXfLczhqfpHOqEOBnesQXON1tChcTw51VntvpDIZVa1cQdeqQPDz
 82Y1eh4j0HjVtf0tS4UOaOkjRyDE4UnVWhBNyxU3lvRHRlJY6uqRutm8bPF0HOYePpO8dbGwBQc
 SmOcIBRO3Cy4uQ5+tw4LuNDQT7R0ZPydS99r94xfKzerJEnuJKyJcgHz+LjQa2JkmHvGEI2+NZV
 MnTQIyXNrj9d3FvOpD7YeZ+L+6fgFOT1pn8RrU3l3Q8Hy4Y4ijwPL3SEpNLR5lBOn7diUKOyWHp
 w3AjDem/w8H89TA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

