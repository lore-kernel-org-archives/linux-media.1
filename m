Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0183BFE4F
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813135; cv=none; b=LrJnAWko2LQviLpBSk9uiggBzx/3L10y9JhLJZY6GF6Jh4/wkTlH6fr0nn/o6+5hKuS3eL0BRDbjwrZHljFx5ewnhI60s2aSP9yGzBII/AH0VFm5hOYT/eeqCakPtBty1yZWDwI5Kq6PNwRMjbK8O6hLzJ3tXtCjo0nmHTrU2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813135; c=relaxed/simple;
	bh=YZhhybZrv3s66S7NBzF5YFGgcc0+N0oUYnJXl+V0kxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzFRCNCkM1MpA8LEldGGl3E9WP5L2Iqddo1TZ3fYAPID0qxU/XPGlAwD18HiMDJGSE7+6CyS4yMyu0CKArAuXU/eEYLo5ecNZKMAuYzTU6NY23P8ZJkH+XLXg+IbWEi+sibH9IM2ec3QrOq9ebzgwPAaDTWbnsN3c19+Rou9OVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=YzCMm7I5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="YzCMm7I5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1783402f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813132; x=1792417932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHuiEncoG0VoEV58mprVfME+rgEEB1pqeAB57KOc7lg=;
        b=YzCMm7I5ujsYZSZcsASfukyT4ugvljz2B5e5hqnqTWq0XWgY4qeucotytV1MzkoYAJ
         XAr88gf8RvJ/1Cle2dJ4+51LirrCyh88i3cHNrkfwSneLnOS13Huv96//soSUmksPWSZ
         +eC9sdrGb/E/Gzkmkr+x7Z+dp1NW9so+1XQOuIS/UKJ3pfNUsePvinqHlFNfbyS1S2Zd
         CiKuleR3VRwCaVPihJFpfd4H24o6HJEEwRYYXBHpecPNQe0iDHEpZ+AE8rCvbn/kXE5R
         1BO/4Vcm2xt4fC0FsWnMZlaL/hN9Yvg72Hap83tLnqi7PV0nBr55M9BDfLPNknSqNGZ9
         to8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813132; x=1792417932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHuiEncoG0VoEV58mprVfME+rgEEB1pqeAB57KOc7lg=;
        b=NOW3/ChNdMQLbKafRi2WpLH7f9kAi4qMPXebXHyV4klopVoWmmxQ7AZP1Lw8bjR8/J
         LTN6V2mgr+mkUUAYXNMt1SKlttRYfjcJN1+yXf6HfRiNCoxWHq1ws3AbfzO3Q0Yirr5x
         IekpE4At6EFw6D38ZpygS/B0mBsdpK85l5trmS5M7YHRTQAozS9TKEW9F292OoNNuVeK
         lF+6G6Pja4y5LzOuGx8KLdrS3P6xB6DCVMdEOsCiXcjLi2CncceFoVbp6Y3Q6sxH1qED
         5kxK3oClwGaJtRlNOajWdAYdu99CX/HL3Qx1WdaXtLFX2Rl/itdpioAu9RHoIMi8/nue
         0cIA==
X-Gm-Message-State: AFq9FYLz6WHvveFhWh1kGeOxRyPoq/X1qa0SfrGZFnJ/tHYPDuGRveZe
	6vf05ZSCclJQOh9TzJup3rJ0LsP+jVLO4IrnXNqk3XZ2suX2FB/Cu46NBdEgry4Ptuw=
X-Gm-Gg: AYBFou2R+YGpfh0O4P0WbCQ+ex+GF02yjJbn1A4tw3X1xcqSuiLvhK5JDLgMH/TDR3f
	34PnHAyIwgrOFHxGDMEHH75BvO8ZWrAoYvIZSiy3aIZhpEi/3oaFSsHjnOvxN6PMdclqynTrDxU
	UlbMoDwGcK1BlmFbKqJ5oC8WzBzw0xoUQuqougqQUiroritX44zs6Z55NfJMwVdlczU3hiXvNn7
	e9uzRH76l16IFFd/YK3UD57CUw8s65qubm4YQs55CJ1jI1fBoG5DtxUu8iE1H2sm93F3xY+vxf4
	ARbWKCRxBM+pFHA7wosWgrSh/kyy9edSUOj3nmBgCck/nzEwipjnhe528I/WN+zEB/eMefyW5/l
	dtg3iEycYIFvTQZgkY6fUqwewmVJJy+HLaXRAEyDn2zBfV9bo1EF9omVm0jx65OY16OQyjyPwrU
	H0bKr7yhIxS8CyLdSKFlOQ/zEEm9dgWw+JMa+tOVs+gwkXQH1VChzxj4tzJXgL45Vb0h1hsKA7U
	VbWUiSp666lNCYtYciQCiLlJ21QpFqQOfm2SJs6UTuGJsBQ6jJg/cb43zwsl8eEvKog8hieySr2
	1fmN5iWztOx+4qkvJjNaMQ==
X-Received: by 2002:a05:6000:29c3:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48dba7892f4mr10814183f8f.4.1791813132156;
        Mon, 12 Oct 2026 06:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:11 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:00 +0100
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-1-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..05101dc97711 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36

-- 
2.43.0

