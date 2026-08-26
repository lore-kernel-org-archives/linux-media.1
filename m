Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8953D955F
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747800; cv=none; b=UQgtBfKIzQVJB9s97uFFO/7SUVy/Dlq/vLJXmTyZ48dJWp+uIaGA+IYsv/4KWeTZhCgxowR57aUFKbQrQYR0z6bTpBNPyIsvfZb417Iv7J+5b7L6CDs/auUXlYhpTkWn3zyMCJoHcd4rWo0tMED7MqUVUTlI5erDpLl3esNyWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747800; c=relaxed/simple;
	bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ky2D9jrkx9bq+2QfiJinjiB4RZFQxpb1eV0KH6sWtLIza8hql7uk49XMOZ+P47FKl8s5pC2325wN5s25UwcFnDQuosuN7MnrCR8isrrTr3G2EuzMNKHWSe24n85VfcZDaSEhgj+i/qboVUPOenkQ0IVnVAFUs0NCMWAtqTnJzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmL3a5Jy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmL3a5Jy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49800c6a846so7055855e9.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747797; x=1788352597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=cmL3a5JyS0AuNTJC+EGHhBr3h6STNiq7p4P9sUmz+8w2lRxrncrBLIOgwXOy/FjLMR
         fx4qyQSjXyN/Z9a6ibP4nPB9z5luJqgfykhGKAe0uUxKCqNjKus7HicRG3t8SXNNREDv
         IgHgv7gUX6pctWhhg9sWS+A4iUmFyzsood+GLy3TbWZ6pcqVmtB6ZfUwkexzjETmPXiW
         u2i+a64sxb8SdVU1rF7eHYlYd14ycYw49fHWTBwU56F55qDwnDKkvdygpLL1n0ykHL6M
         Jh7RFlcxG+9UwOEQVMqmEK0mwiNLre8YreLl6qZCxgUOltmxhMsysZ6a7r0gyMe847Ej
         zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747797; x=1788352597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=ObHse8dwdPDAqvK1TjcWXsbaSS3+gmWx8m+cH3kO3xJIhpFIJcMWCiwbxlfUqkVc3l
         6EDJzsEaH5LeZHscEgywSaq++WBcu7ioLFYEJCrwhc6Yh+ImqEkEBrr6E0Gf319jEliI
         zuT2/p4lIyHOY44osgfPTTwz7LHIy9yFAUaLkydy35zvfjVHgf91GXLVUWeb67oD3qhj
         zsZqR4LNWXhqPL7cGrw0IsJBONnxkp9578jKdVvjC+tEbo8p+b1+mme0nTy2ysF4AvXi
         gPapSIffT3Nii7DBliJCidCRkqj6y4EmpmCh2sK5Kt54BumlOXuaH5PHWt5+bGeI63Hj
         Kl2g==
X-Gm-Message-State: AFuF++lfjV5g8HkUccw1vhdO04tSqsOXF99J7mbajA0s2rTtEBnEdtwN
	ovq/w2zm7rSZDK3+UEK1jQS9Nao6W/CQ49YAn7/WUy6goKgpzvuI8HO0
X-Gm-Gg: AR+sD11BmgxwFEVC8KVvl5pP76/uIoZ4Zcme9p34LDZpVeOsg8Au5UnBFswD370XvzS
	igSIS5Q3nQRHVNFoMizZrNGVjYTLiTA9u59sG4k6FQvg2QbxtXPgys2KQDRoOSZmwn6hM+DuXxX
	5bBUB/sx/emP1HQtd8A9AfysfqhAk97fE2zTfcBadPHCe9QfKrAPs55jWOPqBhhmEO25TlZM2SK
	FFPsQYoKbhkLB9KrBoArYG274UYiEmYMieXHBy++mu16HtJfWMY9+kHn+qAJsfIQ3O3SRhhiRFf
	1VgSQPIfuT4isH3JjrxQTfCU9+Ow1Jr73fikM/llj2pa6EUYntLysoGLLFrj9F/FXx8LF8AVhuL
	sKMe6YErppZvmbuJSRCubwC2ftBnMC/nPoztUVMmFs18Bk5DiS7j4KAPIB6D0RsxDoe8xyFuhzr
	3B8MfEJ5UvB5t0vvpoMRLpZ5QHNxYX+uHJXmkxo/PPw1zw1fSzPUoYoxOfoTe//EvaBvu3+Envx
	e3Shj5lSwLG22A8eHHI+7uxTHccg5AaTOO72VnzaCssrdQ=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr63320205e9.4.1787747796976;
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Wed, 26 Aug 2026 14:33:48 +0200
Message-Id: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzdjmoC/0WNQQ7CIBBFr9KwdpIyMAV7FeOiwKBo1Aq10RjvL
 loTly/5/72nKJwTF9E3T5F5TiVdzhXkqhF+P5x3DClUFthi11ok8CUBQvYzhKmAMRJdsEoH7kT
 9jJljun99m+3C5eYO7KeP5LfIfL3V0LTM/p2+WSpyDfmoyHQQxv0DULU6Wm1Rkutn+ZG4oTD4y
 +mUpr5xgaK2FFWsb0RytiOjmGg9xNYZJM1RS6vF9vV6A70FmTnwAAAA
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=1518;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
 b=D5SZuHOEZFLq4kV/bI0disa6qhctUgipBPOTdKl3tjbmw47te+DHUq8yqwhgqFIQKWdbWjzoB
 vOdGow0S2mZD2zoH8t894Bq5c5ei5wyPao485qKRl2S+x7izKKzRIWf
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v1
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: aca697161c21e19fe3a7f62f208da0f6c3b666e1
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

