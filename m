Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5043D34B2;
	Tue,  2 Jun 2026 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442149; cv=none; b=JMWjCVkQVkjiA3MEPmgE4ANNoDeSgSwBJmEN66QzwuhLmPJK9PioB1Xc5r9GtPPGmhJBWccDwYXDGaJbhWmYoDb1uHzgQwIQk477aoMyv7IdEVtizzDv10KXzpLuqspcwWofSRNKvaNxH34YNUQJ6SXWH9mCbL/Xfc9vj3fJJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442149; c=relaxed/simple;
	bh=CpP3MYL/xZuRc94/LoWCpiHox/E3LaJFlCf6IHNIbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=WFQOPcelLOsfllGo+rcHlMdsGBheZTMIE4z8+7CrxFfQLff2HAv4Nari/ogtQfGaopjJznSrQk/KD7A46BNRg916w90RYpx9/8jTAXxTt82fRWbQjB99xQoFPkh3hJOiFpQy3Kx9xplNQmIMlLtqNPf7vmOT7owS+auEaerJ5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrLtsJ+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrLtsJ+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C651F00893;
	Tue,  2 Jun 2026 23:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780442148;
	bh=1C0bl9AgD0fcY+yZTAXnC99W2qoG0oz9eOdEYIvhZ4k=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=CrLtsJ+tl9jz9wZ3yjvcE1f7AVILegSbfc06j7Gv7jtM/z31KGxQLQIAhiIYuMxgh
	 nYEDkPtMPRAH6EIcdLoapmk3AkKqKjYh7zAyv/D8SHnAug0HSKujFhMV1H1efgATyi
	 RnUhwDerEWk5wrMMlVIYPWNxWIbhLxuPQfBkuC4v77G7Lpx7FsNFpyt3WUwiLYMWvU
	 U/ZUMtJZKpBJs24dqClt+qPwrjm2sOZmo2fo2tfpgwVb3DZ/Et00Y5pCMxeCpsVtdr
	 D7JgOkQ//MFn3jJRe0bWpU+GEtPLtHKAtrA+YgOMgpWGv3+xa02N23tqLx9o1ncdAI
	 rGtjBE0jxf0Sw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Wed, 03 Jun 2026 00:15:41 +0100
Subject: [PATCH 2/2] media: rockchip: dw-mipi-csi2rx: Add myself to the
 reviewers list
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
In-Reply-To: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
To: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
 hverkuil+cisco@kernel.org, Frank.Li@nxp.com, michael.riesch@collabora.com, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=bod@kernel.org;
 h=from:subject:message-id; bh=CpP3MYL/xZuRc94/LoWCpiHox/E3LaJFlCf6IHNIbRg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqH2QeqgSAtFuVG+fig5zZjimdEAx7dmEUiKd8s
 VISxedYwRuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCah9kHgAKCRAicTuzoY3I
 Oh7zD/wNmCf196CXbdjd1OR5m0RADHbQ8mD5Y9v9bqlwYudqAyWh3pYN0HYlOmkOS9uv8ksw4aL
 23CgcVrbhs5DN8mtpoA/i8/K0LOKssAHIiZoJOTdkN/F9Ss1G/7Cl0a6q26RF0Vi+5mECLedobw
 M7M92uu9WXJOxeXCxTY7h4UbZgrkGJxJVq7fjlXaUc6x8S9TqAqrmp0DR9i3/Q6ukoizAQ7yrev
 IONEUoawupp2NjeDvmpoIzWrntEqhr7dgmT72SrtzEaHy8Rrvzac/69JNmWW1o958hiCWIutDiz
 WACoEsLoVbH1fzVM4On2N3HRABwbXBvtinX2hkD2AUcU8p+vkI8HtDfzujuroLwJ9Jy1vdJuqMN
 cwtwss/jJ+MQwR4TP8iKhYXelnbtmnwnoe9dgPLey9TuVJDhLPcvCIafVVunCO9guyL8EDxyGsR
 C6rzqwme6+gY0C/b/+NMlzOxA3hcB767I1B8lSaI+jHUkmagQtgSzX4FZgangn9hE+kYGSTIqVy
 GFr61SXLndN0Lh2D6mHVUXY4zriqHrjb2rvJ28c+1/yH/CtMUBXu053dMEJusb/VPaHpG4Grz/m
 98HA6xAdW85Va2wLyiXZzVWdsaY1u5vLcdyvxqB+JvAww8nsOC2e+Id4Y4a/rwCLywvJ7HlLTyW
 QOJ/Xfc1N8JKqAw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

As a cross pollination activity between Qcom and others add myself to the
Rockchip list. We discussed @ Nice making reviews more formal because
frankly we can get gummed up in not reviewing. Add myself +R here in that
light.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8436428865aac..25e3f2cfcbf2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25934,6 +25934,7 @@ F:	include/linux/soc/amd/isp4_misc.h
 
 SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
 M:	Michael Riesch <michael.riesch@collabora.com>
+R:	Bryan O'Donoghue <bod@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml

-- 
2.54.0

