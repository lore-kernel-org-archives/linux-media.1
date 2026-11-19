Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=uxxiZymVZk8CCd+/NVI70uAhFhIXOlkAetTCCUAInrQU6PC5+7aSISt50bDRlNslHepG
	 v8NCy0T7BOyzLQgGBuY2QoTdLD5zjqhR+Yefno8yrICYXyLIIMyQdUy/BmCYicLxLO6m+
	 JCokmEa45mmzK9qp6Zy+kRbQ838/OwyizHSJG5eLP3C80i93OTPHfD5EKROCkDz1P/x3O
	 BgzQp5xM4y3gVdrc56udY5w+1Tbd2xYRbDz38tMD4WEwE/056YCZE/8Vu8/yxW1cVyRon
	 ctFXYzAEV/pA79/Q0eBU8pU5NErJ1ANl05lpzXxUto3RVypPq1f1Be3OOzhsWtazhcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=miRDDdwyAGE8kK5Ez7Kp3L+1oDitSC4QAxpqcs7Tz2Y=;
	b=ItU+7axPSYxtFkhgdAAXHD2GqBPqnkItMDRkQX1zAvxKk/5TYgc9GM1lFCVjQ9RqdzX7
	 14IrAooAhdxiPIZcGkuhk+4wrQsCU/l6EW+Hokz7npy4vY6Ej0gwDkDSeCSQzz35lSK9S
	 vNUO5frwmIOzRz5YVWHlL9QJ3iG8x5Gv44+xyiUJcBi1sebby0GXawVPwkme6SPRfkGEA
	 /T51/Yumj3xx7skBlpvdQzgBtpZjj9aHSKOeGV9abnLts950mi82PBZ7ZQRYNEct8Zeo0
	 6tGBHyrwPMWU3n4TQBa4C3sRK3dVtYeEOjEmd/dQ4y4IHHwjqTJtg2KRHvSrzDjtgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l7wB9BRn;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0E606A332
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 09:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE0E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l7wB9BRn
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so322106466b.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081885; x=1795686685; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=miRDDdwyAGE8kK5Ez7Kp3L+1oDitSC4QAxpqcs7Tz2Y=;
        b=l7wB9BRnTpdVrHTtVNpulXaVzZZHz6U0HuTknPXZVuTgOLrpMZpuTfeBxyjqSwb0tI
         GNjAkko0T7ZxjVCK5YCtczM2UtvTiM4s7l+wjN8k6ILeocUzluTGQ6P3rtBgwSqggYuX
         gDevutH0FgjNuV2e8KrvSlKjh51cAH2D3jhc9ESCA1Zv6tkmPdBtuMRbzGb5sipFfzFA
         evq/DPfcVTz6zaLU3IUoWffhlZMdiFIGzQ9MigleadceW5hoHZZXkNSUpAIygk+HccUu
         2vJ+aS8wrqPL5OASX02/0RmXn/OyzrgfAVw2F96Trtr6UVe+l5W4VEuH04ypy1pMzWg7
         aL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081885; x=1795686685;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=miRDDdwyAGE8kK5Ez7Kp3L+1oDitSC4QAxpqcs7Tz2Y=;
        b=HSi+3VNO4maK4pNBcDcqaLu9/meyFhAeihv0dMo4alx8rmTdPBrfTNC0dG9VeXzIfY
         htI0/OdhY9VieZjGSrQwZsxf+ezIQtOLukHiPOhZnhm4Do6BiIbFQN9JaRGd981qba5z
         f18TUJWjFEjmdixtMyXP0s+npwcdtTUAWLSyPWkp7iTLDTFuDvD53t7LxqEOPo1xC9l+
         WIDLmO061JnOy2EvVmkdnB6AHF6VKdMED6mRInOhdskfB/AssjA080S2Tcbujhdrgd1k
         pNPpkioLDLoUtvG3TfeRdQER0fFdEXSVNnXnh4Dul5qKmYRR7ujtJnxXywtBCi+XMesl
         p3VQ==
X-Gm-Message-State: APuU4Z9+vN5Jgz6/EoB1Y7TnVJ1FtLudKmmWlbJwjH35g1VaumURCviT
	gvro65kAeIDRUS8mQ0z68bTvbxC69btUNoQ3hOwBPrZzG763yeNeZX1PX7+eiwW+P0I=
X-Gm-Gg: AYBFou2rkAcMO3xRgmiSK+LLTPVSeH4AgzGd5lief65aq3w8knMr6vOtrlNPBYoGGzP
	24nHrenn9AV6q0Gmmco1YuM33xQZ8Ld5RvwBjtI+pIZPce9YUl6vm3NKJB7P0JRVH7MkvBR+p1u
	Hbr7mmzGe0hG7wvhCIxJT5VsIg42fVkP4Q8FsU9nmvpsvfSwpxoeDacsTzLc+iHlva2VNGVkfaV
	YsRsaRHk9iRZLzZSI3lhtjtN6KlqZD2Agc2mpZTVKfloN45XiRSEG4wZUJVkyAnCTs5CTNxfbnE
	TcHVq+tHrZDRe0SCnmpj3JylsG1KoZm3Lel91D9XOJ6XW0XYTfA7mK9dpqxoXZUNrkx062433Cj
	xX+aU+2IuftWtw84fOEJs9Th2+dcdXlFqpuAiyPrly9E3wqJBt++2qEwgqKvIZnGEMWgNQkvPdv
	QbD4IKnSXw2D2/zwsG02WqDURDg583KGsxCx3OwBAPyd/nfPALSKSWyoFra/NksPWfFAJKFuJMC
	NCtywlfJ0yruNd27iQ4ob648il5+xStMIkEgxUtV326I/bk8A0OULYomfe56s3DymJWl/FRbvto
	Tbuv7AFoDzPCvk/y2KbLTGt0ohDAQ3E8AM5CzoD5QjtYdp/Ao5C3esO0eGRfQd4wwHuSY8riDfm
	GLDcmMqmDVKE=
X-Received: by 2002:a17:907:6d13:b0:c50:4983:5d8c with SMTP id a640c23a62f3a-c510e4c7dc5mr462265166b.34.1795081884916;
        Thu, 19 Nov 2026 01:51:24 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:24 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v4 0/3] Dongwoon DW9800K update patchset
Date: Thu, 19 Nov 2026 10:51:22 +0100
Message-Id: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAJrG/moC/22Q3W7CMAyFX6XK9YKcv5b2au+BEHKDWbNB2yVt2
 IR4dxIquEDIV0c+/o7tCwvkHQXWFBfmKbrghj4J/VEw22H/Rdztk2YSZAm1AN5qvj/Xa4CfnT0
 S9vPIoa2xQiNI6JqlwdHTwf3doZvtosPcfpOdMik7Ohemwf/fU6PMvkeAfhcQJQdeGqNkpRBRq
 c8DOj92Q08rO5xYDonqiRECzFuMypi1AaISTapXzHVZ1tPvnB4xLRewFgPx1D+5qSlitdLcW5X
 M1xuAQwriPQEAAA==
X-Change-ID: 20260910-b4-dw9800k_cleanup-0b9a7a51e149
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=1866;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=wt4hIVeK/o47k3U4oT+VKM8Utd3/8tsRODOOzKhUBVQ=;
 b=Z9r7Y/VSolQbt86bB4HMFdlXQsAfQN7L4Y900nrfMljELYc1gQAUGiXcH6vqhfusGhM0t6Fif
 uSkXV6JjcHdBe9nTaPUETQrlFLuv1Rj4mEt5uhAUjdQzAYpB1bJR6hp
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

This patchset edits the dw9800k driver and related files, to properly
match previously mismatched register writes, variables, and logic now
that we have the datasheet for the dongwoon dw98900k.

This is a breaking change, but is necessary to ensure proper bindings
and driver behavior. The previous naive approach did not ensure proper
functionality with different device tree properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v4:
- Fix typo in dtb example.
- Fix build error in switch statement case
- Link to v3: https://lore.kernel.org/r/20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com

Changes in v3:
- Added more detailed descriptions of the changes actually made
  to the driver.
- Reverted to using vcm-prescale attribute to avoid unneeded breaking
  with dtb.
- Link to v2: https://lore.kernel.org/r/20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com

Changes in v2:
- Expanded commit messages to be more verbose with their changes.
- Link to v1: https://lore.kernel.org/all/20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: dw9800: Redocument DW9800K
      media: i2c: dw9719: Update DW9800K driver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +-
 drivers/media/i2c/dw9719.c                         | 68 +++++++++++++---
 4 files changed, 152 insertions(+), 13 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

