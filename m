Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874544;
	b=h8/1q8MXp9+MNw9ilrwJ1X5+TIDGxhVByHBzNMFezVxlaQt095upu9qonukOLNOWBcQH
	 iTW8fQZ4+uFQxvYGqZm3f25ty7idUKxzCQ/7UntulC9jx3bjn59x1gATyjelOvxts0Wm1
	 9DECDaoHThbd/pcxo5RvGlMqQfqwdRaqHh6DVTe5ViE2c/rRphd9RZDMFh8sc7c9i4jg6
	 NEPzBk6QPaNP+sdYEdBlyuirBVJRGfwlUdvjGllyv255lxO++waPJOXblqU5V7LwmGzxJ
	 fVbU4QfKdoiVbHjYnRY3FRGos9hX73fIjCXnXHWBy2c86EJTo3yH9FYvErg8b+OhHFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
	b=4HeaXTMQs80uh4BSYvavTNKL40ws/XJOLzFfmjQfth3srOUswbbH3givkOPZ7Yr8vXCW
	 lUnhaIlLseBVMZdqikBgPgRFARkqQiqHn8oyXBcpZU+NOxzui7Z3z957XeS0222UQT9eN
	 B4XZO8K9SxcPiS39VeqR+Isns2L+khnFSE8aMbgFKG6Mv4lr2eHpGGP2O94ZdLwKFStqu
	 o7FgjhYO9MMdnm6ggWL8prutf4cwDbSypb9bcrF2FCkAiMFFb0q/anCwJyYWxaN3xrgii
	 RpVZnFshQZdKk8RNvPzvvnE2lYQv6UkZJEhpAvsBKvz1y2x0/uUkN7HfOanI9HX2z4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uGKlzRZe;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CCA606A33E
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73CCA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uGKlzRZe
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1061468a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874542; x=1794479342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
        b=uGKlzRZeKSBB7pbWNgXhCMnH9fIP+HhOcCeqRDYbF6gB1fzwZDQM11K0HHL13OoMdV
         IGZV5O8TUCjILvLNde50AKTfCEans1P9/TwPZmsR/VDfB4NdNmgk112k/F4/tuh5ung+
         Vw+BZNNhY/FE0qOH+R7fI9lo4i/gy4J01CjnfEBB46iZBuTmGNrQDyJnMLgS0GcVRdPv
         bzsOyxOyqVlDrIVXxYjBK2wKMPAMvsH3q3d9R5jbi4xhDSsHsQKVA/HCAPRiMP/3dQjO
         FZ/yiaMR9Pz6QKYTfLlu/Xg0/MrmZURk4B6CzDcGtlvTbVUL7qA4xZQ/QNE72quwZiNb
         pWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874542; x=1794479342;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
        b=EGr5w/cmZVHYvMx6mYbrwBlsvIGP91BqbJflYYuVoINykdjiDAvKwdvgLTj67QsAYx
         bE147iDPTKc+OblcLvVkFG0HNnOyeDPVpHrWppMALxzqU1zy12NKEvk6lfM9rsYY98JJ
         0pJK0jWq5cj8zXgIMPzvXoCZbSJ2MBb6drb9OeUh/SFZVWJufOcF4E0BNteS+QmN3PxT
         kGSjCrMWB7zjM8Zfue7a6h1j0WMG/kTpD2+r8n+o7ndVDeMp7A0UgiEOj2Pyn5gmPjqn
         1cr83q+MksY0Q8D4tNSH+riqKSEyVjRfriqOsaS6OjvzHWFzzOZC1707BIZdyanZ7kjQ
         FIRw==
X-Gm-Message-State: APuU4Z/r1d8nuT8nY5HuGTWY5gve1zsgM7tB4E+ok0aiO34FQe/s+cbu
	ECVhyvp33b4PQCWN9+r7oib7JRfZwMs5Rfo5+AxJoRMQgZDgx2bYchcTjOMlgCd4hH4U/vlVTum
	aUqt0kkY=
X-Gm-Gg: AYBFou0C3ReCb3BMN7/51rgArNqTq+qZBtXAEiOXiWTqA6Xzn8owhE5rIP3MU4Auvfo
	1yOSdjXpUtg4wXDxTT2UuyFwhfIvowRiejZ8djBV1pLtFlisn9pbTwDhRSZrIAT7EwuUyfBpjz+
	Wxjvh1ZllAr+e7vgj4o3YBT/8C4jUDTN+IZaQYucHqhNzh08kfVNVSlvFNtGyKX/CKobogn+h8C
	NuhM/nySiBWKBUyyvGVHpfjypV+FY9YMVZGeI+gGNPn/pYKmb/uaJxgNhWyxLr+vkC4TEWuaqAK
	hrdoYObl4Q1BbpXL9GSNHYVRB1cdGLsb6m2my+1vki9YX+DU1FZUHEnN5s8enqEyX/3e1XZgZU4
	zBVO3HNYHxRJkdz4g5lGeND6SzQgqdAjPOKg2YJfG0TAoECsw9G9NJcysZMfwJevzk5cRqZU5tE
	FUNYwbfOE2stEiFgoolbY67WiPsUhAPNh4mlLMDlmctzJyLhVvdSoK9nvE/xPJUZPW5RFAmm8kv
	LnjhgSswXBGIaC8hsQPSS+RCTI9p4zJz3xnPm+c77vBtMUtevkaAsaefeMmCyvPIlvEqMsj98XV
	j7YSd89G4kdiE60zUQH/QMbtn9R/V5C9xKDPje/HlLotJguETCOPbZNiOtM9dvNHVwi9tGq2uGv
	GcWI8J0nxD3vJQYv3Hh2UE6lvQiM05rz5
X-Received: by 2002:a05:6402:274d:b0:6b5:5ad6:2ff4 with SMTP id 4fb4d7f45d1cf-6b55ad63471mr4129137a12.28.1793874541906;
        Thu, 05 Nov 2026 02:29:01 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:01 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/3] Dongwoon DW9800K update patchset
Date: Thu, 05 Nov 2026 11:28:59 +0100
Message-Id: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAGta7GoC/22Pyw6CMBBFf4V0bUlpeVhW/ochZloGqcrDFlBD+
 HcLxJ3Lmzn3nsxMHFqDjuTBTCxOxpmu9UEcAqJraK9ITekz4YynTEaMqpiWL3lk7H7RD4R27Cl
 TEjJIIoxiSXyxt1iZ9zZ6LvbsRnVDPaxLK1EbN3T2s1knvnI/QfxPMHHKaJokgmcCAIQ4VWBsX
 3cthrprSLHsFovP0X8w7GqiwCH198YMeTBlYUytjjy8fAEH5U4r9gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1675;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zYExRqYQL9Fc6YcansLrZhaOHhoc55JMwPP4XAEEjC0=;
 b=NMqoBXeKooo51DzMpMUBdJJltOpoY1I5G43h9htz6lWJ4sYgqEHve0DhWTrVM/Fd8WFpF6xne
 TW7IVn8hTfiBGFbmz5R0FwOiH0rghv7/vJyqvxu2p/8pxyLngfTY2aB
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
 drivers/media/i2c/dw9719.c                         | 65 +++++++++++++---
 4 files changed, 150 insertions(+), 12 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

