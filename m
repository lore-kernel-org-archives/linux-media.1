Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2B35DA63;
	Sat,  1 Aug 2026 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607471; cv=none; b=VyTwjYw7E4V9StzDcX15hKnxCc5pAGKg6GptsKWlg0RWItPNoDOXdAdW5/fIYxBfLRBwiQ68Q8FgVccoxlEMWSM2pgm4GfSQocb8C1SRhzfYlk81syVLMhcYY2SPsb0qhbb5OZ4mVvtvw34cTj87ozWD4pgC9pgSYYv2vrp6nZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607471; c=relaxed/simple;
	bh=HnKFPDMyB8nLZ/uPo2znFL4Fagp/nrrgpXktbXoOZEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MfTosp4xCkaWsV/9sgF4+eo2L+dLBenSGZyWjIVkLfoA+RBZtgG2SpvYZpCOmX3vjlN3YTCfRp5l25GUNlARMtPImKYZDTVyPyqiFSx79x7s21O/NYBqn7AswhlcaT5r34dgSTYP1X9DEtdaCSBJIcDei748PCCQL5K8YAkDIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TvOFE5IM; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9QTjGvRW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TvOFE5IM";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9QTjGvRW"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1785607457; bh=yIYgG0IHJZOlOes+zMNAogJ
	Ixxt9aAsAUZo1zJFi8gw=; b=TvOFE5IMxtBLM5sVme2U1EmiGOo4lDFluiHBiRXNdqbDIcUQAs
	UMNMw7x9QqyPOgBJzWwIPeBPuxiLZ6OLOcWpeKuoWqtwFaJ3EG+l/6XiMKL37FgPQwYvNa0M7Bu
	sn3VrV0wfjjZyzSalC4kxeQZurssmgsQoh7Vs4DlUfJOR9XoWgN8/63C5+CFnydZqlOb4zdF0GQ
	20rXAH8fezaDlr9DsGUKPH3uhqHMypgetN0NoS/zDel58V7yIpz8dbwe8XxfT6VLx6/9P47XCxc
	6EGxUM4y8t/soGEh5oYMQYFd8yGMe3/Im3aqgqs0HBy75xgM3doWh9vFtNR6qLtVI8g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1785607457; bh=yIYgG0IHJZOlOes+zMNAogJ
	Ixxt9aAsAUZo1zJFi8gw=; b=9QTjGvRW0yiMh7x9GHZk39wjTB3ECggvA9wNJQiJJeRZiK43oA
	G8nm3CMl206jtgD1mt0dwtpIglm9KwHEseAg==;
From: Danila Tikhonov <danila@mainlining.org>
Subject: [PATCH RFT 0/3] Add UW Camera Actuator support for Nothing Phone
 (1)
Date: Sat, 01 Aug 2026 21:04:13 +0300
Message-Id: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOy2rDMBBFf8XMugqS9bBsSumqH1CyK1lI1tiZY
 sut5CSFkH+P8ujyDnfOPWfImAgzdNUZEh4p0xJLEC8V9HsXR2QUSoaa14ZbLlg4tZbzE+sndJF
 56QaFgxpso6H8/CQc6O/O+4LPjy3sHsd88N/YrzfSs5bw91DW1mfXu4ysX+aZ1q5SQhtuXOOxl
 a2VOvjW82B8I4QtQ9YYZaQy4YaaMWd31+yq139LoaSo9aY2DdeKFWkXaXLvs6M4UaQ4bpY0vsH
 ucrkCxDFawAEBAAA=
X-Change-ID: 20260801-dw9800w-clean-b3af4ef4f875
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

This series is marked as RFT because, in addition to adding DW9800W
support, it introduces chip ID validation for DW9800K. I do not have the
DW9800K datasheet or hardware, so I cannot confirm its chip ID value.
DW9800W support, however, has been fully tested.

A separate compatible is added for DW9800W because its datasheet
specifies a different default VCM frequency than DW9800K. The register
layout is identical, but it is unclear whether DW9800K uses the same
chip ID as DW9800W.

- Patch 1 documents the new DW9800W compatible.
- Patch 2 adds DW9800W support and moves DW9800K into the chip ID
validation switch.
- Patch 3 adds the DW9800W actuator node to the sm7325-nothing-spacewar
device-tree with the vendor-provided vcm-prescale value. The vendor-
provided sac-mode value matches the driver's default and is therefore
omitted.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
Danila Tikhonov (3):
      dt-bindings: media: i2c: dw9719: Document DW9800W
      media: i2c: dw9719: Add DW9800W support
      arm64: dts: qcom: sm7325-nothing-spacewar: Add UW camera actuator

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      | 10 ++++++++-
 drivers/media/i2c/dw9719.c                         | 25 ++++++++++++++++++----
 3 files changed, 31 insertions(+), 5 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260801-dw9800w-clean-b3af4ef4f875
prerequisite-message-id: <20260801143125.267054-1-danila@mainlining.org>
prerequisite-patch-id: bc2fbe0b102239e80d8effbd6db5bac152d9dbbc
prerequisite-patch-id: 29a239772d265935e75c326a5e1cb448028756b0

Best regards,
--  
Danila Tikhonov <danila@mainlining.org>

