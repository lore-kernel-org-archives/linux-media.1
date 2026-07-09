Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C785366DB9;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567855; cv=none; b=Jw4OaO+KhwM+GcNoe8+AT7zS6BrOLIKM01SrXMgcAyKtymxM2T2wlmFScumkgKDtOVfPxEaMetwJXBKz/ghVSmYmtO10VsZuXIN57OUkW2YqPNL/nJ9geuEOWMczfqqxw1bpI3SJQCUoLmIBGEWcE+iRMb66Sk7EgIn61PXVE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567855; c=relaxed/simple;
	bh=DE7C/zNl5gEB4hBwdkFVQx0tCjdrOH14tJ548l6Whgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t7DgGrc7qXd/7zchzT3lZ2YZETJuON7tXC/Hm5su39dfCEkDU+mVKapVnPDu/P2a5H7khmx6EB0JSS+1Bbzpq5Os9NWolOh5Tza8RdX2gy2ThKtpHuZ4u48fTTUrnu/6VxPCeUJgg4fbUmCIccaLcsnU60s8gR5bYfwTEGWoYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1+obGiE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1+obGiE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 068E4C2BCB7;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783567855;
	bh=DE7C/zNl5gEB4hBwdkFVQx0tCjdrOH14tJ548l6Whgs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q1+obGiEnuN7wUSOpMX2tudk8SMFsltTcqukKI6HTlelOf39NQ5kdpQ5fXos78SnH
	 DHfRxymQYPlaQmEXi3jzKPouqxfikLdaU1spfthIMErtkjMOObV9+hcE8ywqEUafm9
	 001L+UNGjMPZVRSnAjhs4IwOwbqGNNUW2xSptqApHSC0KZ+eiBudd6L+BMHPLLWHZg
	 fs2JzGFN49eoc8v10lPM6ADPyBr5/dLVXZPd7uAKwxWbl/bI8C5LuNoGq7Bg1YxKMF
	 HO848IK5P+D4T9PXoQw5wXGNBKxzOzjcx/I0PNoJD3FrpyZ/GjahN8t9CYlnVP+Z1N
	 Q9dP0XyCCpAAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9358C43458;
	Thu,  9 Jul 2026 03:30:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] ir: support IR for Amlogic A9 SoC
Date: Thu, 09 Jul 2026 03:30:50 +0000
Message-Id: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsVT2oC/13MQQ7CIBCF4as0s3YMYIXWlfcwXSAO7SS2NGCIp
 uHuYpcu/5eXb4NEkSnBpdkgUubEYamhDg24yS4jIT9qgxJKCyM02h454unc+rvqDRmpoX7XSJ7
 fu3Mbak+cXiF+djbL3/ovZIkCWy865WxnrZdXOz/DyO7owgxDKeUL4w6ssZwAAAA=
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783567853; l=950;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=DE7C/zNl5gEB4hBwdkFVQx0tCjdrOH14tJ548l6Whgs=;
 b=HLP9Sp5lnUznfoFvgIElGMxBs7e0paxwl3xkQp+ZKBqWNjbybe2egF5mwLYtHyuZANSu7nv47
 MFN+vto0MWRCzuHuNqUrzP5ln3Bb88vslsNThxYKfbrzg6mSYrbcyeL
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
Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

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


