Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267742;
	b=bpJTXjc4WsmdlZizbDM0wYXE+C4jjyU3A6RBSWz9WKufXulOaaHv8WavwGqLWufyrjhi
	 HnEYtdD05fsR0vUK3jbl9G1N+vBOTy+WGiQGz70ivAJ9eRRZmYV3hcL9Rx/bp8JDthe9c
	 r7WNuq8vdl9Cs9/kBqhPqRaIvL6fmaUWmue8GJZxNVtliYsCzfPRAjouubJ+CPjy5qGO0
	 a20ZLDNn9n0f5fIeXA6qptSusEkL6OlyDGud2F6o2vUZDTz11UczFRYL8dmwPkc6nMF49
	 Pu+egIB8W94H0/O/XFdqb6FJLyWihppVwESLWx96toTQnZzAL5q/Hv3Qk5gisTZ6Diw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
	b=yaGuF00eLT/ZO9XHFakRMP751EYV+Nr+F03Qv7pO6xgulQt/wT5jK1imv8jVgtGFuPXl
	 YnP77Cm87t6EhX/YWQsoeESaARLEXvpmRINq0Wa5uAzHDYAW49MDAdj//gxaM7jyg4WRE
	 zFUMM4lRFD03zSC6MnsPIVXvRsmkWvShej9VWjd+0eYqKp0RgZ+8U76uaNQb0z3WCZfJT
	 svxRfwPrD53RDz9go2gjsm1pqONurEt/g8esf9PL761wmOQ1yfmF0l2ClH9z5iLiC3qTC
	 ITwJ+uoDE6hNQgldASfwQcDh+8Ej9z5im5JGLWvvOnYOMTflZ0BTsVP271OOIG/wPRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="w/dWBbx+";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D3460A3833
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D3460A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w/dWBbx+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1604266f8f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267735; x=1793872535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=w/dWBbx+CovOJKWQFEnbdicxeJ5/ehGu7760QZ51KYotDAAc4mtgqCtarSBZH1/oAU
         ip+Xs2ydYAOcGXxMRQFcaxbzxFjOCnQcMQ/xe1UwBBgVdCW1j7UVY9khh2sFENYKRUpm
         +KOPpjGAKTOyLh+LXJEzWQiaeDS1UEAqMntso7a5ZE9TwqgKNer1AjnTtWCvuK9xrwXS
         1bQkFGhFiHY3JOk3jRN5y0CTSqO2HsletEYsx4PwtN5Kafne6vq8FTeq/PBp4BLozZls
         8h4pUao6y7Is+WS7EGHn2PNQtM4LMCZ9uNJAARU27ZlejYNasKJp6odIpME0h/6DdlrQ
         pDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267735; x=1793872535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=MCv+Q0tqlfeN2oJK13DNCg+woQ5gdQW1Ra3NsIOSdYgB14CGTqcXJVbS+dDk1u1mjZ
         mNCTyswJpP3Bq61My0IavdVKf+DIQNKJmO4K0yQG/dSTTmphGry02+6+D4mh4ZZQEVVR
         E+pGBf01MqJO5xN0vXJAEEhHHc4u+pDmQpGqoSr1ZgZK59TXI2nQjBUvdrN68bRnyfIK
         FJQYQfRycjjUHEQOSRtiWFyezDwQCvk2ocffFGC53cD6l8/T4mKRDnBfz5QTUqVfzv6f
         ECR4eYTvFKyhDxpQVMrU45uYiOC4SRtlpBS5Lzop2gqX2GzPjxVht98Ksf/B2t7BcPxg
         qsEA==
X-Gm-Message-State: AFq9FYL20JcgzjERYCUfe1CeseENhSyVKZDoXdlU2LrCjXZVFf8tjLgp
	TnVPoHs3USphCdYKiftiP50tUqDr2DOHzrGnbnZb2hp9POj0zBdyhf9OXvhkmanabwo=
X-Gm-Gg: AYBFou1/yCpQzQlYHZjp++BS0yGAu5lwhY3YuDRXIH5mAQFGl1UFqO8+za4LQwSaJue
	TM6OS0jNooKqBBP1RFghr524paglujVKFOS5tk4gkWKflxNjOjOsG6W3da8ENX7A9ERCDB0mu5H
	EGkxU1FVo2y5CSiJYtfwZyumpPjs22eZjrzdYDAmYDqW0M29oc7tKR8C5V0dGlafC4TZ3Arlsuf
	t7+ra7fBKCW8vHEo19lIztxrVd/GsO1irQ4rbDzQx/tdaM775ADs3fAaY2dv0fJNu1D3+O6Ak5T
	9IO6d7OxkDb9bRzeqwsiq84bNG/fiqKjm0K7ITAi82GCfEhCjkrv1Xpc9jNz10jx75kZ92FY8SF
	lcrQ+j3TZqNPIYJro5IhDUaXc0pw5BpIVi9gCIcvDL3Y0PnknV9DpPzs5rFsyccRRJgv7nyOhtv
	qBLaBlHYmb0ykzpnxme9ryPLVoueNknafITdveQrPrExmriKcyYpCtFwmuhBh+dkgcd7mk3SbDu
	7oIXLhZsCnYUorl4165f5WFbhNXhLUPNfNcKP2Fl+gCTxtityo2xOKOD77Y2G3sD14c9f2kNDDY
	fZ32ggq2XmIVPTDCXvE=
X-Received: by 2002:a05:6000:4007:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e5d2f1f5fmr12175285f8f.25.1793267735461;
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:17 +0000
Subject: [PATCH 08/14] media: qcom: camss: csid-680: Enable RDI EOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-8-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=bod@kernel.org;
 h=from:subject:message-id; bh=dXv09uQCEs8qUF2K5KWFAC6wPULB4r2M9kbjuOqOpSU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgMmujgVpNlGYSXf65flgvekHI0BhlteX5PA
 vkLV+9gUsWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDAAKCRAicTuzoY3I
 OhGxEADBYyhwfefWhvg1ebub1C1XooYs4mQe53MG7nHMeZa2El09YtafgxMVfqLcF6e6Jrm56ev
 kZi550Ck0+6H9Gka8eUMJes90PUbtu9Sh6RtBWV/gqLGWuF0mgu/NYjVhKIoWnIynXKyxoxI3Gm
 53UrwXcJeQNGl9Ve/f5+gcsl7rjYc55VtK+x1nYTGseFiSlXCsn/VMX2UjCLFzlJdfXhH+SXJG8
 b5oQImi32ku1ZGZfaCWKwoyn83ynhDYih4FPgvjtJwsLCybjc4GU+1mBKsX+VsujWtlE0YcDssf
 EPOseSPFrSBrRbbZeQjPPHLoHZO4oKqQtl2ELE6HcQ+qQ90rwFsmoBkx8fFxjZajQ89cD2eDHE+
 bxJdnj91e2CxfzB/sIRANZWho0Me4JYH/zOTSq4hcmM8SzM6kQp1XhYUtPvFqe5NV8LyR4IhUWp
 KM5EP1cW/R54IWRssFCkJyM6ZUzn6E1z0vaighKba4JZ6BRv4KTzabAZL8xoeKxlrLm9PpKbQem
 kV3gao7gboLykWFoMlLm7DLhmWFvvTJQnuArgtzLNZvpk5XQdoo7zZpTqLi5ynTDWGLqzLXpNwP
 BgbcrpYr0Usw2SHhZyrdX9DYyLjB6bu5yr4J8iu4TzbT4pKU6hu8cWQ7+XnYzT1ljZcqQu8Fn8f
 Na8cQamoqlOZIPw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5..2113ce13eb56f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -303,9 +303,9 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 
 	if (enable)
-		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF;
 	else
-		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val &= ~(CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF);
 
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -413,6 +413,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
 			csid_sof_event(csid, i);
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_EOF)
+			csid_eof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

