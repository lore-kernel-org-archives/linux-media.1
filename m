Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1773A9002;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305811; cv=none; b=oo9aVJtxYTOm4rORHQGGTBGsLU8Lyto3mzUVZtlrxH8Ov4cxPSEl/ylVx+2/XP17MMjj70Vu4V4j14h/Oavy5buIyVyMHNJIJhlMwyJXfDgjxJhYmMQpmsJc/LiPF2ToP5qWiTb1mYgWDKsUh4L3MD6Hux9kGItna/D1/GUhmAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305811; c=relaxed/simple;
	bh=LtQLw07yy0in1Im8yRhxFupk2NhIl4F9cJLeOuofyZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vAyWT7VOltn0nmhr8wndjQGQymS0+n93buDvAwFIecymXhqV0uu/CScr4lskG7927qjY6+24gEjo1VFWKBSA6n5lZWsaWTPdMru1NcK/nLr57I1dOSZ+Y4lGVKo1i2TvyAUH6Be/BXOjiZlh+FgOGSRQgFxA/wx+P/neh4HWjhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaxrPozY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaxrPozY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8622EC2BCC7;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=LtQLw07yy0in1Im8yRhxFupk2NhIl4F9cJLeOuofyZ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oaxrPozY/bg9tf7g006BIGPFzAKYPf3Ty5Wh0dJMcqtp5SPRXLElX9hWRuAllMq94
	 TWvhuqMw4DYUomNXFhRJziOv+2E4RSoV921/iilbLdR5+M+7/ICqttBq+PnXuLlGDL
	 uQV8jRaGFAFxUtP7eoDbtfBMPRd195AOmJXuKj15anbJzFoFqr07ZJb55kPKSf9gSZ
	 QLVjKb0aLQLq9CPVnipXiuItSG1KtRNYgWPaixVSOhZTyRDPym6IYoextWPCdv9RBd
	 /QjNuFOHMIz2DfHnbnF664V9q92nvDcBeVPyVnNJ+2D8/3BGHEeEesCUcWRp5NGwQ4
	 WIBKVZOuJxk4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629DDC43458;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] ir: support IR for Amlogic A9 SoC
Date: Mon, 06 Jul 2026 02:43:26 +0000
Message-Id: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4WS2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3URL3cwiXWNTk7QkI0vzVHNDMyWg2oKi1LTMCrA50bG1tQDQVlp
 rVwAAAA==
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=746;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=LtQLw07yy0in1Im8yRhxFupk2NhIl4F9cJLeOuofyZ0=;
 b=/Jv1oOddNTK/zrH56+nUIuuDihi15maEHeBdgt4LMwTr1GpYa5kLysCF5rmAtJxSt1qxXaLr0
 jxJDyt1+VwgBDYY8iAbRPrrR+FfB14jRVm5q+9ZGsrc2XPmaOwzJ9ck
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


