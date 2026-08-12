Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA3381EA1;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502496; cv=none; b=jHb0e48QAC5s0sId9OGy18r+ytf3qKGohZ3gmUV8/9VsdUeY6bF74xx2po9eMSd0hz+/2UavIaqGoWDuSJXm4rjlHX0SR/ikLikcI/tT43KlpJOnehFsA1s9J5RoeVw9NghfiTl4GhAABpkm/208/YzXwiMEwVLwbvxVLfxYAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502496; c=relaxed/simple;
	bh=Zpmh8tNY6Pnt5n65mitKLOwn/ENmAmMsvrIVDSYl1f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfcRBqf79l1REOiZa9nbs23ze6Qp66L/B7fiRPOPm4E3suv41EUI3gVGFbZio/vxWnUNp2nCKeUTlkNAL24pDbSgMRF41aTzujW9WpP9X/BmYGBgmmT5JZ+1kCh55mqSDKIH/wL1dvmDVlEQIzYsU/pzPflxH8M6ht8+WNxtmV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRoo3Lid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRoo3Lid"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A76C32786;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=Zpmh8tNY6Pnt5n65mitKLOwn/ENmAmMsvrIVDSYl1f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QRoo3Lid1t/7wDbm4ZuWpfGTw0XFA2UYeIAqxnNvcZ+736DZOKSIaXaLj5lwLd5Wv
	 JdnRPs+ARyDUDugnYO3kirmDMbXL1uncl98b27+3/rp7KPxuuHkjwsj8CuCCH062+E
	 isM7lcrR/4HdeBE99MpQWpNYH1QHK7Hn01q36eupeWYaJGWDoGWFqSKVuUhP4S0Ol+
	 6yFTlmbXI/EmqStp/puIfsFlcO1gE7/yKqtw+mBedc22O2fb/w1NVJTXPtO4kz13yy
	 tRoPhHQ2zmN5OGyifC9S5Y22zF6Li742J4TfmgkykTnsKFn4lkmZDEQZDo5awUMFXj
	 6o2SZ3Jgdd1hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B70C5CFC1;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:28 +0800
Subject: [PATCH v7 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-s4-vdec-upstream-v7-6-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=809;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=A5HDTanmoeQPb4xnQrPVjYVDpBjIBDOzhYRIxgeYOhA=;
 b=hD0byagTjmnuxpL9SmcGV9vdcglR3DpM2iwZmqHGkAmIl9O+FvRJbT3a1QPifvGN6uFynGjJj
 SbHx/VnAzSnCO8uluYvolVgi5Ohs1bkZjbVRc9qWSwJNzHMIIENT+6U
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig to support stateless video decoder on Amlogic
SoCs. The driver is used by Amlogic S4 platform, such as S805X2
board.

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


