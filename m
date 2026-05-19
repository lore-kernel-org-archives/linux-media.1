Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B84E3782
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203608; cv=none; b=ZCLhwAvOp6H51VT5Ygoiczu2jlrku+XHsgf5PGlTQ8VQCLjLaNJrw+HnntuVbe+l3VNVS3pMNW6qf/rnLiLlLgq5G0JWFBRyJNEkVkV0aV2Y7dRseeKaXOLdiwUwMWioidH6sWS8q+V9lC/Uo16ylgRvw4yiVtRBqBsn+M3Li0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203608; c=relaxed/simple;
	bh=U2Bp/Xc0dTJFjq2uSqbXXCvsJyGOH0R6f9lCOAE7i+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+2oPFPgC62nM4SzMXSoV+AspKRQUzRdTQ+hgkjUefYqXEuiWNQQFAYP3iX2d7tFvHMWj3JwC77eRzLL1L2t/j6E0FJyzTsc8ghrzG9tqiIDH2aQG/3xtoYIpNXKP/0AXz5kvzfwuGcPVD5+LOGDnXriP/AdF6///A7DP6EvSjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkOw7HDb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkOw7HDb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso8533975a12.2
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203605; x=1779808405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=OkOw7HDbEdUl7wB5wpkAQUXhhtbnB3+YiHNuBflnr2F5XYojoBmtx2DnCziaeuZ0YO
         4nMkSf7ncTPAl6tpPWHXFQbyFkFprzU4Xg84CuWitE97QYn65zIMUk9P5jv0PpOw445y
         eak5jZOoRK3wrPj8X37Dvf2a3tD78wlg3NPj2aW1yVFiagmTVyfUmwZA/dCe9jaWm03r
         o8X4fqhiBozPjwXX5AjW48GhwMAIoel1C/GwvymBSKLyQTM5Ch7b9xUg3B05o2sWV0fr
         nmlN8Ya0mgrgKiINVM+aHLf2Rqs2oc8t0aBvob/BHCozJjbcuAFMrzLefXHHvu6AFdX4
         JFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203605; x=1779808405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=YVNgttri8Sopjac7kOqZfVjSqrvBflXQb+/DFF+ZYzx+svnXfOlPWG5dVMyb1YhrtD
         Q0YTus1kZPvwlbFJItSWXwMx/cAuatLZAtAiT8A/UQnWuZuZcu4s+bu5uF2OODlCfOPE
         S4S2oosv3DwNy27i1Tv2J4+Wm7JlmNSu7fDskP2J7VQiL++tpJI3Nm4noUsgR33xwEbO
         W1y0J8Vq31Gg97K9G1t9pfYbqv+vqTowNwV2x8qmk92M1tsnbIeAMKezgGPc3Q3n6Y+A
         7TaKeXgR4GjonMC5Zbelw1+jP4fP/4Xd3bw80+RO+Ec54+uoZI5e1rRHiEzvPrVKasc+
         iFqw==
X-Gm-Message-State: AOJu0Yy3JTzFUQi0sULZiKwHC269ma2W3/ovXgtjINrfg9Kb6fU+s16D
	3OVduBSh716YNzLqxnVPXqu97uYAIfiHXuMfIUoP/XBkZxfuAh1mlOXG
X-Gm-Gg: Acq92OGN+kUYTVmPaQ6Sh9N4M2wi38hbRJn6QaUWLVVIPOJXqnuQyIsUMXxIB+BK/tD
	BW+a950AzkaDGFuh5VGU83GGmnUh91s4yqVsKhR81Jpi09S9R5dJxsX4RiSsjVRNFBl8I2CmOcx
	Sw7Gkkg3Emsc679r1k1rTK3XLY5d9uD+efJm4mMqbSWmPjYuFLDnw6G3e6SMJt6Rxjp3umCrWQi
	IrX45F5xOvEolI4jXyWJm/KgxMqiItJMtJl2jgOuGRUPBhPw/gzOxGeEPg8fQI7wdMwplOsbZ9x
	P1TGDC+mtzvdfkNSo/F7dERFtrRBXqEw9OUEDICUxKl4JnOPXoKdIHeB8ZhNENkDS4jfGp+8gFG
	7p7RrbwZkmUjLFukPMRXGzvsN9545/nEuWXoo+WXqHEWfzhn0GFo007zXnJzixXeN3mOHETz8ze
	L5nhNydiwupum60sjdQTYIBqQGKHTktQQTcT1s
X-Received: by 2002:a05:6402:1357:b0:680:ccda:55bf with SMTP id 4fb4d7f45d1cf-683bd095c51mr6997580a12.16.1779203604701;
        Tue, 19 May 2026 08:13:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:47 +0300
Subject: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

