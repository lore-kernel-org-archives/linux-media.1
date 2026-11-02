Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=W1cRnytMttRRQ4ZAG1jkcU18+foeUddAGKf+CLiEHjJuo05dRE/exGsDUHyzw6b2csFI
	 XsKF7IfKbd/F1NgBeWBwwfuXgxgKTtEm0z6/dqaT4WRLAPAqTS64QzFDUNkANKOmPuGkN
	 b33cYv6dmlJyAURYH0XzoP+4OIhRsA7jdPSsL3VRL7RQavWo5+37HarqrseCn9SY8A/SH
	 75+SWg7QdMjiAdfrxLFV+j+lQ2cCeUdK0838dYhDsiRk26YCmJrlV/Gbauk7poDTbmzrN
	 KFn1SJQYIzx6q9SfyvDbHyKBJctCYNkeoLil5CDwt9Nhie1Xz8ebg+Y0XnjGbL0lWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
	b=Rx7zrBOChLdb5/SrH8mP/42JsHptAzL17vGajLaEMcsvIDLtubOK2iB/InkHhbPxB653
	 Wq2zG4UvmvgxYYaTlbDODyLQDoLzFvIuGkOvt52FbZMdgqlO8LEVpmylkyRcBiFiMKRjC
	 ee2iY1vyYZ5kBxnTZ+YAvpanDNjkOqY1ap9YlB4uD3WdfEfFgE41bG9ihJtU1u6g3OwYH
	 36QTYJCn5QiaCvxjL4N7f2cJNAKtyur42/P5YbWOIUd15e7MQpCK1TKhKFVTzq3rpvFRv
	 KQ0wi7T6+Rbr9oGYx1ZJwaSEcx+1ApvLL1pZ+Vfif4p6ryY9x36CK9aIg6wCAUjkFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60660A3815
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A60660A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so26991285e9.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627823; x=1794232623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=QgToMraPIYAZ6E9QJv56CW8TA5NeDihIdL+2HBv8SzLY3Cb1I4doWGGWqegVV045oe
         MZh5aLyCLD2lPb+kGeoouhiEpWLJHv5VWJ8pJdcHh1MPkRmjf74B2AsjnsO/S7vr4tuO
         16V9492Vy0I113SbekVflXtO9ZGIGq/96CPiuWUoT/HoAu+fdKBmll65GFNiJJgRaLoL
         n61P3B98QU2kUUQ0G9mVDLLXVyMNrajtnBMsf36FMCEdUsHQ8f69gTiNzcaOncLgoJ8O
         x5y8mwy2fOaTYBQrvyYuuFcBP5GSuweKYHN6Y+jRySjJ6erIZ2ateNG3+vvvP1+HL5Br
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627823; x=1794232623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=Jh+HgoVWk3q6DSpU6XmX3XOaWsXqhNlwrLvvjb7DRXuHGAtfVYzAgXhZMQi2Rd3gjl
         +9/HL+lrRU0oMfPPhmOw9tJjxD9uA4YPv/NjujDllcW2dsxFlmcvVB4teeL7wz87T49u
         ZMvBnE/sOWoQR1RHLzmpegJjtAdvs6A5AgD6kfLsYS/eDCuKAUG5ZI7VHgwHehV2RRYV
         ZD4+YQZgtrYBJr/8F36ntS2T5QwPkwgbBuJSto+QVTQM3JEmcxyxwjYqxR6Bx+Jg5hSD
         Ru1DHvkPiedwXC/1R8RSqhbdH8zB7/z9E3dvv7U+tdGwT2nFGRhCOfoaCh9hI4OEVcOU
         x51A==
X-Gm-Message-State: AFq9FYK5LDEMoaF7d547R11JJ3qh3Y9nhKodGXPoaNAQBJb+40xVr4Tp
	xhQJsiyu06Vf98zYgt28rAfG6Da14sxFQ9GsTsdAVzC07Wb9J2ceYgo80rRTGRtTvoE=
X-Gm-Gg: AYBFou3kNFByFOyWqflcfTkI2w6b0r064fulQk63As1b9ipdEshzEMsw4CffU+rG0AT
	wNiNZjwdUS4/GfozgEFz+AwCNJSKABPeXroZJWZgrpK1PunVUkZ/e94qpjCiofnVb57wXflsOvO
	QKyGN3T9Sugvf0JYSn1PIfX+Zg9M6RJgDvH27ldkHXFNxsZDrRnZvNmKvaNjeZ9+SNaAE5mFNcX
	AmQWT8HWXRymbRxn3CSpSFs/JH9leRjR5ZybXZbkpzKsZloa3iCIUYPD99theHN2YpsNHv8ZnO4
	BlQseRlXt7TbfCZr5/d5zxQ2wMjnj4sR9Qdf1xq5KjI74DZezNn1v005Y6ucPKQFnIioX+cnR5R
	N/kAkLycCTxPjm3hFUr1JVIZfBLtSoKZULz2IQGH7TNrJl0ngE4fQTyzBltALN5+D8gqYZl44bX
	fOCIci0hxQtuPsxUt/2ItyYM16Ew84qpyH6FMIdGbeR2zKDfQpJ3sGHGbt1aRsjwlK89YD1nxrg
	Wnqf0HmwPWKteQz+AH/2hbP2kcOF+qwOKutHxATTvtyKzulSU0siwJAPfwWhbEx5hLZozkoMgSZ
	/TvnAq3TbPAn+/CXcsI=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr100728245e9.35.1793627822770;
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:51 +0000
Subject: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF
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
Message-Id: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=bod@kernel.org;
 h=from:subject:message-id; bh=akubu0rGSbK8Bi55Bu6Z8+I5lQw1Ol8/ItTGES6zVpo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jam7cLZPbufwEM11MFsdo3+kxSVOvLw0q7oq
 AntyC1Svt2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpgAKCRAicTuzoY3I
 OoVtD/48bicxJOCV5Y1Ypx9uQx54IImLPeJ/mYHiXKG3YUCVtwomU65GFhh74QgT9XqdoxqF8AI
 v/MgidmB8d50mD2/tBojdIokLZ77XClo4e/jrG1Cae03b63H5SBW+cuK6dVX2gVxr+yxW2gbO85
 qfQaLaIbqQKalU3OZNf9a/VgrVv0ATH5Mz0u3Viguu/a0RIFw/iTRdBGCRDmqtCdJOQMUbIOAVR
 ZHlxndf1/gCB+FDqMsnsT6RG1tvKaxRnyTzZqKd6Wrz0z88Yc6DFoJ6T4NMxOtR/Y+F7NSZGEq9
 IqHBW6EZKKbm7MatZUdE4luxsEZwxPhpB426RMAULXmfJ0orpabG7WAJVZ6y6ox96aYnb6j0sqg
 INO1lBRjohhBdf/XbqAAfN+nEosoSB10J5pFU525rvMDXYEdAFag9qZZH5YjOLwpp31oO2i8vei
 S+KJKWVNHK6SwecO5hTZOUzHM9zMj42/iePAq+Mh6V/0Rbcv+EEUhm9geBCSU4f4vOZI2FtCsS7
 LvCMOAJTOCGOYNr2Ef2yUoNxO33HkP7L2QBmkDZOWCixf9zJSL8JcIii+a7AeYccTMPnWP7DkzP
 lXeBHBJwpKAGzI0DJdH5UdGCwACvyGp3JX5cE7A9n2sNokD54HVvYoBNhVHrZ0E3xhOP9M+aaYX
 EgmzzzDv4zxSPeQ==
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

