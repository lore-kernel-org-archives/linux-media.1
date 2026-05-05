Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0DE22126C
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017560; cv=none; b=cK9x+9NqWIFoNZlcu6UkoRGL0/AnW2ePSTIhQHoIGs0hUJ3BJDHjyokP0G3wHlpTt5NLRBTnmYI0wtBCE0G2RbpbNMGol6UwmkI8WWLCmdgLxbmtiV8A+FDwhtXe3sB1n5pOhrQirI3nhrXvLPpEv02B+O3TMSAk4HIbpKiR0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017560; c=relaxed/simple;
	bh=pQrsVHH672iLD541aAxk9aTkvN0tzWS/UIaQ6RTMYnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFsYEiYBdjIX66mht6ZfdCTGyJTgZ6ENY4tyTSTSEH6hoh05MI9rqBE9rNKVusUG8RIrwhlpHTeU0eUAr2FSARPoSfH4UkYkCX0joaOwAf+F9wd+rEUhkfEOmHaG2vc8hR9ylCaTzgYqA/wo50YqLARz0Wgs4IJoim/j9bFuoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/8bZiad; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/8bZiad"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bdc947aaa3so12284397b3.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017556; x=1778622356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=r/8bZiaddbTCVO5mZsPmxNDluuUS04jkjsiG3771ZtNXkv0PzpQCFcuQezWfFYVstw
         8I5Bat99gkAUUP9TBG7QatQ1IbottnW7/2+cmlq0cPSiNH9fd4Da4ab4QgPW7eWZZ5c9
         rwYGZjYZcngUR1eap9GeDZPt1kH4H4MbMRl1RL+8gAfh4bAMRWkPkY5w6wA4GHD/cfWb
         KjE8f+L4waHYO5mIQ0yq1n7JfESHG/pJLHLWnyaa6l7UwRREKav+aMK19e04Tc1mr+lg
         Cin6qxG3Aq0GiN31ZV1URgoZFSqWI3lM6cNtI7xCJahLKkTP+aJHVEjoLtFl6bE+zGUa
         NR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017556; x=1778622356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUx1WhuNP3C6tZPswT5NmzfLUccyj6ApWGSEx9tbsXg=;
        b=AME3tcWzeQ2YrGO8hG8QJJWfHHSa0DEftYQYxQiHokZKrs79qabaxAL4EBUkgavHsq
         v970vf18T4KnagwOooOkCbosVHdXuNtsy7y/Go1Qht2ILZ4WGNRwNWTK86qYRDJDy8pr
         tAnmdTgYu/JVY9tUTqgT+qgGXt/nxucuKVyCzTqyJxVY7lSjHoPX2d1o7rSFNGD4VXrO
         4IfNbBufVGD9Oll+dTYKIW65dZENCkkE6ibuZQFZiifF/FwRQuo0PHDLhElQCPZhY8hP
         vlnpjT4ODdwaOVxYwEb+7EA5mbWFAj7rgyQeOBdmqF7CBtuadGb32rA+gSJtkKxSx0K0
         NF2g==
X-Gm-Message-State: AOJu0YyWftQrxC/iWNFwdZRjBw0o3tH5iFDr/p6HTxzmEBnbrX4tpJgj
	7EJBlb+Fjcs4BXJedeTfcS0oVEQTajQn35Oi5VqdEXdUbQ0S2/Yk9FnQ
X-Gm-Gg: AeBDiet3gnTJDzOEXY3ZijoL/rhSzhSvHBEFGbUfLwxrNeRBcSB05Xp73pvLbrE/P4+
	sjUir9rDI1jnPNw419GI24SbpZATULVAsROS6BiISs5HW/I54OGrNFT39XOpSH/uK86jGjPL0JG
	/sv8qPnjK5dqjm45K0NkaFnW20cyS45kTvpY1QbUwtsoO6o3VKOGOPuKBK+Q4I9PjLasoRS3kIH
	fCyIEwsyByoY0t5YVV56gyahqO8vwwpHqd0Ikg+yMRmOtsAJbZ1zubWHhwf1T7z5vdWEFWDyhi6
	/Xrvm1bpwEHRv8WeufaY86l40syZoQTnMDlJnx6VOQzeOvBnonE8J87xdnKKahJ4zXihUEBxEV9
	m+Bp7ygnPBOvk3SEVXhSu3nUp2hfPChtUMbBD1jFT/E/BfZIi8OV8TbFlmOAvMP0MJdKnWdGo5f
	yKcFmB0PRmrKbvkK3kSbxJaNfkfXLQsOFLz1cW
X-Received: by 2002:a05:690c:14:b0:7b6:f4f:f06a with SMTP id 00721157ae682-7bdf5d8bbf9mr12969057b3.6.1778017556354;
        Tue, 05 May 2026 14:45:56 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:55 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:39 +0300
Subject: [PATCH v4 2/9] media: qcom: venus: add common clocks used by both
 vdec and venc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-2-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add clocks which are enabled during both decode and encode. This shall
be used in newer bindings for Venus, where subnodes for video decoder
and video encoder are not included and clocks are not differentiated
between decode and encode.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c1d772c7ae9b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -77,6 +77,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -140,6 +141,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec0 struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -194,6 +196,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;

-- 
2.54.0

