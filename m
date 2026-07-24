Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875553A6B6A;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876709; cv=none; b=BajMt2DiETAOIEVtve/3yLZDl7qgpgdFrvRHG9jatnau0FADi+9f2nTYUPHnn2y49caF+bGkZazgEkEY2e9xhJbK1fzhUqdT4qxobARdiggbFUJkxOhl/mfgm/GLcA/FOlvXMih2o8Pd7Qkij10U+uT29b3wSKIS5QyON3OhNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876709; c=relaxed/simple;
	bh=ZduAyIlR/IFIiwJG3a0BTdrTnNLX76FAnBte6j1pQOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2RMK2nRmKbCedqoWPqWAjABRjQiWpTy2X8xD5YtDzJSA+glpRMBfuarGoff7OmE810QlAUl79NWCgnQuNwR9fVQMmZfvZqzLoPAOAzyP7OsPzDw/KDUyhZOSmtQl3wS2jsfD8GjJSX7BlWTgzfUiy9VHLkyF2LRfrpR0sNuwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIV4jt05; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIV4jt05"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 428C9C32782;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784876709;
	bh=ZduAyIlR/IFIiwJG3a0BTdrTnNLX76FAnBte6j1pQOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VIV4jt05TE2yuG+LCs16byuiwWyMIMg7ki/CTM5NranCgLyo7AgAA+VK/Wo8eGdgn
	 7URhxfrHSb8HMGL1/xv7/HAab61hDEwLNVSg1Gz6Eej2WUySz0i7uisRF0mkyD5fjB
	 1RdstWLzLa8WFBNlECc+C2Vi5nCwOErnp3vikbyweyd2CNQWeiO7YZ1pMSbbFzpW4X
	 uGQ4A/ennoDqtPOTBdiRPuYPahtgBaqrUk4GeJ/zXfUcOmB/sd5IZdBsTAGyIuj5l9
	 Dr+okLZyPH3uqCX5/Xw7XwER4HN5/cajl9wOhiv7vlhCrBfjfk6oQehMwieUj+EouS
	 LUS/txvFjnPdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9AAC531F9;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 24 Jul 2026 15:04:56 +0800
Subject: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784876706; l=768;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=s56xUn1T/sDmdBk4tsVqVJGNOKSjSa1IT2ROng65XrA=;
 b=lb4nQAFx6tNkB7KG9S1omoruM2Xct6Jryv0j85PT210Nmj7bpqzUs6MHgCyqLhE7vWPircOkq
 ZMHJvDUdkrkCjiSspUnaAB/d8RzsyB/zhC9rNie5uu2Ug9BYG6V/xKi
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig. This driver is needed for stateless video
decoding support on Amlogic SoCs.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..7be4e5a284ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -919,6 +919,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m

-- 
2.42.0


