Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267735;
	b=QdEFEsvcDzhphir33/5p90+kFH7H/IDDivPEXxAedhtkZQ2M+/g8Xm3m7nikvlnyutFa
	 KUWh72W07xlm7NWUL4OL/+6rZzxZYVqJrb1UjyFgcDP8ZpUkavID0NW9F1zAr+0AH7c/i
	 7GiS2Vnmc8BlBQDu5tH0Fdzvx/oO00RJuhuZ5hpVFYIu56zWh5q3Y26iYk+a1oBXJJnLv
	 9aIlwlFuZk/i0BXriT3ZNZT9hIQS7dtdTUICXQKeEUT4j06IbH0kMMC65T5tyA6lweiWZ
	 93t2lV9gbcgcQPgpgXayuMey0PQ5qKIhujUnSwd95Dzx6L8BK87BdE/x0U+ybYLjCdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
	b=xlWBlz7tR93cpSzKAOQOwkECCfzO6lIN9HoK4BfCBRw3yDxRIuRjyL3uBOoo9Lxi1spd
	 S/uBcg9bsl7GdCjlXsjYcTB3htVOXXWDMn+0XXIrmuBYU/2x2Ku8y4o+ijw9yq5WxU891
	 A6vgni5eBB+KSYeszn+KQReCHysennCkJHvMTHXfgWAWp6gB4BQl8KrSxF3CynxOkn6MJ
	 gdpZa3Jpb9hKngSAVx9Kbnu7B4eTtorGN+3uTbbMGxYC0/WABPCCFZAbr1Ng7vDyeeb2x
	 /KwU99ShBCXZCtMK0Et7TYTwFhVBagJYEk3WrTkH82sOIMgbpxuQnJPIJu1QBlWl/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q9YGsWcn;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BC60A380D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439BC60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q9YGsWcn
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2440665e9.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267734; x=1793872534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
        b=Q9YGsWcngmPu2DzGl+Bnt6mF0+wdUetcZLIgkVnHBctmiXm0M/7IgHA5Ov/udP4Ncf
         5QphMDo7woNFxYXHp/SrjY8BlnKB5dtueReeDXYRZvtFBx792O2fME+uWTpMBK3EcWVU
         hID6bWgmzJ+uzJD44W9AWIUdzBZdEyAo2HVAousQMmZasZKxUerzhmoHHHhVGAPlq8/N
         JLoM6ZPf8xolQekV8Ed3q8a26uSi4Abo3iCYrRa6fI2Rq3AleryJcDEokMbfCYbmO94c
         qRH+tc/GnzFWGnfkoRJWzgHmhTuUERyajOu+Jns23bbEnFkBcbP252mSTuKW9hUEFBLV
         Ntfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267734; x=1793872534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yprnLM8yMFRE0F3Z/EeO/BSd7mpeYOvDRbj7QvgaOTk=;
        b=nZjc+thoB6+NQ5ZuitN9bZjuHqNm6uB5lcfdDVDd/BIwLiuSdx6+laEIwTwAE8+v8f
         Z6Q53IPHftgPvyGykOHkIYpcGRFTTqqxgBbmZ7pqeNoTGbiEU2Q34htCra9OCDrWFsAU
         gZTNggQ8n1qelrPPRn4bCzSf5aHLKDxaHc2+oTMFLPD8zwgK5JPbYXzS/TgBs6HJeCpd
         PI3Nda+iGLbmbqCpIiOT9zczcPTafB7DR9my8IED2742+L4IC9qM32kEmjlZlDZdrLqF
         gufCenYrx4LZsbEIjePeH7JEE2xwU5/bctUJaO8khexZeJ6IaYSelmN5a15+ZKAxeUES
         gldA==
X-Gm-Message-State: AFq9FYLZtAo+aYJBPwDsLpMKMHvJfkvvnItAs+hJ8+G8PAVgkpIIu+VC
	RWKRCX85QyRhCW1dtrCUy4qkKqOHQiAdYtT6HhtMt5Ke2abjH7gzl4WNOhCcLbgpAU+Ngepkuod
	FVoy7
X-Gm-Gg: AYBFou2mgsLd8qmGtdfxbYQwwbiPz7pkQaImPMpAUEYPJOgqNELnSrTNKKogYuTcF5q
	M3vbBi2BHQJ7nekD3t+OAOPq0kfycBIK52DQ4Z+tOgddxYO40bItTRfRfaW2h//n4AEJeNSJn0k
	hXvdhyiuhE0dYnd1gZUzV/3/sOvuq1QcGTN7gzpUXIzbUQIg4f+wIqSvvaK0t6fajbr+ZMtfaRs
	syoJ5bUbmKnQoQTbhKtkY1jbjzQdAw6KTtd6tu0cv200ouYZKkQy98Ve0U/jAe7c5L2FJgl0cmk
	wkdUfoIsqI7gyeBhmGvkcWd4NDkH0QfXDMw32Nmk/4MiE50ciwFO/jyTVi1afdmfTHtgTPz5/i5
	TeA8BCtAxPjp7jQaKujm/Q47VC+z/o4oKkbtq0qcxuOj6SEQCMxUdjf2CZfYGYEq3aPeXjJeTZl
	sIeH75jCcWdxOjWXChl1XeBLan/HSVAvsukavmRqSdqi4TWfK/OPg/fUE1kiYZGPHaFpTOcLjp6
	qqIVwNFgf2myIeacY2HgJbpu4atbem6M9JUbdYcUXc9gyXxMRSGxfRD0WjBikahD/7GXJ84Bqfu
	dd7IPQNNr5HSv6zJF8I=
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr47807685e9.2.1793267733672;
        Thu, 29 Oct 2026 02:55:33 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:33 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:15 +0000
Subject: [PATCH 06/14] media: qcom: camss: csid-gen3: Enable RDI EOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-6-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=bod@kernel.org;
 h=from:subject:message-id; bh=kAQ7bWfn2CUyVqsLy1cTneFlv+8/L8CS5J0AQLs8eFE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLuEdDz8et7986CyGOh8W+0i6zquatnVwBz
 PBjXI6YopqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 Oj5yD/984HKV9jg/ruLA+pjrfG6WfRP5KWxH6URBXlHJLJaRWmgtfJ1y6Pb3xRlmZE0PnEKirC1
 wSu4jTIOrlmNhG0gJbIsUmSGQ2zwtRr5zEPW6Z7mor5KOj4DRPiDKfEz7FsI8TBb85JI5w56+kT
 QS66+a1Mr9DVWRMM4tSGHmaB4K+vLj6eezihNZiadhPUMKTNRtgSzkqPOQMgc94KdiLmJg4lGrN
 8rHnpxKv1d+KwY+OphTHlDKu1CQ3XAOmxh17P64N1D2E69yKh5mYvQUcJkYZtEzufXl4G7bdtjf
 kbs1mIRn8g+I8llPVtkNUxE+EqjGY1DGGb7WlWoYMz8zN4kmSxEqrmqFU4+SSGYa0AbaNC2GBmP
 IyS1NX8Fa2G8ALT6+R72uvoxJh89zrZw+iyW4an63UP6YMZ5/593onP81Kjsj5Pxh1xGMxcLaFd
 +x1i7/SUHM/7W4w0DKZ6q2Ttt5escGcXCd9yNMywUz3VYPbY2aC8mBfA6rWXmhVg/GQ6lvLgX4U
 Sqj7b9NxsDrv8bFgL6fYnAA/IkeCQisUA9LmAA1/jtcgFy9kE/+UEtOFai3Y4nnFM3VUmR7kgs1
 k/K8kutlEfoJ+KZKifvWAz6ojbw2WfdVa3tDg5xR4bRGcadRSBtk6tdHuVlBCzInUNpX0gQ0nzt
 ySQfBj9Cgl4l0KA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78b..5a7a328f6c0e5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -61,6 +61,7 @@
 
 #define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
 #define		INFO_INPUT_SOF_IRQ		BIT(12)
+#define		INFO_INPUT_EOF_IRQ		BIT(9)
 
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
@@ -228,7 +229,7 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	u32 val = 0;
 
 	if (enable)
-		val = INFO_INPUT_SOF_IRQ;
+		val = INFO_INPUT_SOF_IRQ | INFO_INPUT_EOF_IRQ;
 
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 
@@ -306,6 +307,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			if (val & INFO_INPUT_SOF_IRQ)
 				csid_sof_event(csid, i);
 
+			if (val & INFO_INPUT_EOF_IRQ)
+				csid_eof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

