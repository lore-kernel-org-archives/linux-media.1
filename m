Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AB3B9D9E;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784832; cv=none; b=bjFyJsjq/tLOVP4HzTgguqekUYL0OlpaWPH04IcfXqFJ1nC6o2Gd4aFNQWlZb0P/NvT/dShtU/1w4Poq/R0GVIsivb8BwwE7QJVTNgUoPSKy9V7Q773qL9y+Ncip65Eg+3+ZHwfXVlT37oOsGFwpqxIhOXV4I6SILCBY2jG4uHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784832; c=relaxed/simple;
	bh=S97JAUpv0NlzwMDGm7KcefiNCXWmBBgFYU4X8a5WTnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y43tCTlAxLu2UY2DdZ5etlUI86X78dJrnxf6yJ6vLFUxfYbvhVm+uO193ceByepPEg+QDLJ3wU94LUrU9ZZZfUeiR4yHVVQYBya//rfNErYjvTWQgHFUJ7LPAphz0/3rB1SHuDB+upKqb22bDw6noKlCZs+sSlrmdoUjBcI1dxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/frGZ90; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/frGZ90"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBAF0C2BCC7;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=S97JAUpv0NlzwMDGm7KcefiNCXWmBBgFYU4X8a5WTnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c/frGZ90qxS6VLTzZmvIvqiOfy2jhqWR/GX0ulrqmo4UZIkv7J/nMu1J+IZPHYz9X
	 EZDJKs3qEpVyTm+bOB1NgipRunavq8tYuJNVHrel62SyGS/IzP7O5I02DrVryjEcDh
	 Q4vq1+r0A/GjwyqiGjA/1ki2eJl/rAxJEQ59VqafmH3w2WRWtQbvxu/yFke2lZnw/M
	 b/nWgXDryxrnKgL/uRJVy3IztQTg9AtVRDz5UYOj/8MtYCCVXhz7XKAhj3PTxMKK9d
	 ebepU20F8DLykEWPGMeerTwxMBaTNGpCpnhExjrR7WOoGYIPapFySZHD9A3eeZj+ma
	 T0xeHiN/WSN6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D662DCD5BC8;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:17 +0800
Subject: [PATCH RFC RESEND v5 1/6] firmware: meson: sm: Add video firmware
 loading SMC call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=701;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=EIbyEqiJ64VIutoxUMLEEjiZLuEMFFURkZoqXNKTANY=;
 b=NaLJku72FRu7wrITESuD13n4YTJvdOHqdM2dI7Xd+TcBlQMosaOOOV3obZfYTo7OPmWZwbubA
 036tRrLurx1CTOoTCNRPFJOSwR/ruyV+QIXpRkHl8d8WC3JwI/KBkK3
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5d..5da6c65d684a 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -47,6 +47,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_GET_CHIP_ID,	0x82000044),
 		CMD(SM_A1_PWRC_SET,	0x82000093),
 		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,	0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0


