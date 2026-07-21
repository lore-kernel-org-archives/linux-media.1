Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AEC3749F0;
	Tue, 21 Jul 2026 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630589; cv=none; b=P6GypTJy0IpTz2/nnTA4dheD/+1XA28cKHCMYOOPgG7Pqf+lNmuefDxKF/Q5qL85rbgu964wp2mBAsA7bUl+6Rt5WNQwCenkl/OETGD5C4UIQMS0W4O6My3l+S9pJWqR0bcp4qdhEjDiHBy5Q0k9+ZNtDcmtecJHXQfsS3YpzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630589; c=relaxed/simple;
	bh=PJHudpfJPPaLF/OF5XN1VmVtZW2B3h3vVmD2XrJzmUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=flUyxu9y2Fl64lAyD5vUlqF6+rHxU+gCTMMylQ91KW9GmVdM0Ado4PcyE/wsxEFXNDODBY2wjQVNXTrx39ZIjpmehqo0GIDGkL0J5sdcVYaMnlthfAtKWEOk7a7SztAs6hZ1xV5M4idrtHHxvpq7kwvR3o+juO68X6x7i0hb3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1lohvbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1lohvbd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D10BC2BCB8;
	Tue, 21 Jul 2026 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630588;
	bh=PJHudpfJPPaLF/OF5XN1VmVtZW2B3h3vVmD2XrJzmUE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=r1lohvbdtDc+mbBUhCVGiQ8++xZz+1IaJF4NV7NfuEUb0LuFfTZN0dyEajvxxoIcS
	 oXdIbeXf+uUShJOM0Ae1+utwn91hvrXZPz+oBwPbYlATFO7+MKDPpmzQnBoYb5/qHG
	 MUSWkq6GOFAv4x9rn5W/RJpane87HN+IHw1MpvFEGtxq56gRkDK7rXxSlJqyK5gI9z
	 4vKIuE4+VexmI+1Su1X+gY/7GoxF6jQC5/CV7v3LeV7ef9dLKdIAlV6QsvwpH1yNJz
	 wcKrf5PTN/9THu32vT0LduFI1rW/kV8AJ6D9S5lvaRXPn98/x5fRj133ur+NfEOMhK
	 /jFsGk3VJm1zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF91C4452D;
	Tue, 21 Jul 2026 10:43:08 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v2 0/2] media: i2c: add support for ITE IT6625/IT6626 HDMI
 to MIPI CSI-2 bridge
Date: Tue, 21 Jul 2026 18:43:04 +0800
Message-Id: <20260721-upstream-it6625-it6626-v2-0-7c4f3564ca38@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhNX2oC/3WNyw6CMBREf4XctSVt7QNY+R+GRcWL3AWPtLVqC
 P9uRbeuJmeSObNCQE8YoClW8Jgo0DxlkIcCusFNN2R0zQySS8OtMOy+hOjRjYyiMVJ/wzBTWeU
 uldNHriGPF489PXfxuc08UIizf+0/SXzan1Lyf8okGGfK6lrI3iql6xNFLLt5LOMD2m3b3jNrv
 YW9AAAA
X-Change-ID: 20260716-upstream-it6625-it6626-6874ab8a5305
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630587; l=2113;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=PJHudpfJPPaLF/OF5XN1VmVtZW2B3h3vVmD2XrJzmUE=;
 b=ojx+/XJ4hVyg4fLLudb2jhrIenR7MSOQcea2sYBJA7U6Y+/39gs0veN9gK9Gr638mx7hJlENR
 4F7rKFkemNNAi3te2oCVlzp0ETSUe8lTuiCr7pe4bf91UZ1bcpkZC09
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

This series adds support for the ITE IT6625/IT6626 HDMI to MIPI CSI-2
bridge chips. IT6625 accepts an HDMI 2.0 input and IT6626 an HDMI 2.1
input, converting it to a D-PHY (or C/D-PHY on IT6626) MIPI CSI-2
output. The bridge is configured over I2C, exposes an HDMI CEC
adapter, and supports EDID read/write, DV timings detection and
configuration, and HPD control via the standard V4L2 subdevice pad
and video ops.

Patch 1 documents the devicetree binding for the bridge, including
its three graph ports (two selectable CSI-2 outputs and one HDMI
input).

Patch 2 adds the V4L2 subdevice driver itself.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- Patch 2 (driver): fix several correctness issues found by automated
  review of v1 -- premature V4L2 async subdev registration/teardown
  ordering, a missing-lock race on banked register reads, a
  status-poll interval bug, a dropped CEC interrupt, an unacked CEC
  transmit, set_fmt mutating active state on TRY, EDID blocks=0
  handling, and a couple of uninitialized-stack hardening fixes. See
  the patch's own changelog for the full list.
- Patch 1 (dt-bindings): restrict port@0/port@1 bus-type to D-PHY (4)
  only for "ite,it6625", since that chip doesn't support C-PHY (also
  found by the automated review of v1).
- Link to v1: https://lore.kernel.org/r/20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw

---
Hermes Wu (2):
      dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding
      media: i2c: add driver for ITE IT6625/IT6626

 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |  159 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   18 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/it6625.c                         | 2104 ++++++++++++++++++++
 5 files changed, 2289 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260716-upstream-it6625-it6626-6874ab8a5305

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


