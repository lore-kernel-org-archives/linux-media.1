Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E01175A67;
	Wed, 27 May 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892858; cv=none; b=cWFkqi2gtjIVojQdiJU2jcy068ISgE9MD2KJnTjfqbscnkI3W8pVtZlZ7WjSnCuiVU//UWkqGvkbrRqK3cWnjNWY4GtMm9ibhMlAFfc03SfFeK5e/+ukcjrbT7PCBidKEoMb5oaut/vz3tBQihvHyA1I3EPfFLjkXIpuT83tzrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892858; c=relaxed/simple;
	bh=ub4UG5sqL5oQEDTUAcKwlNBK5R7RhkBiz2g0E4FNJhY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Ud0vMpGYjCwa+JtJjvoBZDJJhuj96iefyS81S/qwyqVthSMswUc8YvHnKpmJPxnSPwIyYvohj9W2sQvX/iZ7hlrC3UTQf5FI1TegvLBu0AaheZZ2ofSnxqdkY29kbyyc8Pa+O1dWc7z6p3FdX8fibmAMxeSVAwCQj5jmPrZ/+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xbDPDvVy; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xbDPDvVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892857; x=1811428857;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ub4UG5sqL5oQEDTUAcKwlNBK5R7RhkBiz2g0E4FNJhY=;
  b=xbDPDvVydonEccArzCoQGd3kXYcq3WNfTQY7rLivBrmbul+o/f4Yq9gs
   11CsNG3cbPd7LcLZnF9qwkIddm50KAW2UbZgR64qM/+lOclFN3WhCiQfJ
   Laaz1WUPqeXei8ARBhBWaRyhyexm/Kk7PwfhfsKtDo7AJruLM40l9crj2
   MQdOw9T2zHZeQoxJtpc4nN+dCiQmw2QVJAxDXOZjg5lKkmXrW391UoS/i
   t7m/fPSBjNW5/LEA8nYvWI9wQQIvkuh1krqbeITJtSY/Q5RZFWnj1Jh6o
   ylSXzKAAPGG3jtTGr0vNYYYC/59YC6NzsIFAjShbJs/1a0hDNootdbh4e
   g==;
X-CSE-ConnectionGUID: okRCfW5xRlOMXFPbdh+4kA==
X-CSE-MsgGUID: qv0Qi8EtTnK9KBgUnQNAKA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="289515115"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 07:40:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 07:40:55 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:40:51 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH 00/12] media: i2c: convert ternaries to string_choices
 helpers
Date: Wed, 27 May 2026 20:10:49 +0530
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHICF2oC/x3NwQrCMAyA4VcZORuogU7xVcRDzNItoN1o3BDK3
 n1lx+/y/xVci6nDo6tQdDO3OTdcLx3IxHlUtKEZKFAfIt1QPsp5XdB/xfKIMs0m6vjVwRiNBCO
 /U+rjPZAytMxSNNn/XDxf+34AWsUGi3IAAAA=
X-Change-ID: 20260527-cleanup-string-choices-media-i2c-5abff65802ea
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tim Harvey
	<tharvey@gateworks.com>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3

Replace boolean-to-string ternaries with helpers from
<linux/string_choices.h> across drivers/media/i2c/.

Strings in uppercase or mixed case ("Yes"/"No", "ON"/"OFF", "On"/"Off")
in adv7604.c, isl7998x.c, and ths7303.c are left as-is since the
helpers return lowercase only.

Build-tested with x86_64 allmodconfig. No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
Balakrishnan Sambath (12):
      media: max9286: use string_choices helper
      media: saa7110: use string_choices helper
      media: tvp7002: use string_choices helper
      media: vpx3220: use string_choices helper
      media: msp3400: use string_choices helpers
      media: tda1997x: use string_choices helper
      media: ths8200: use string_choices helpers
      media: adv7511: use string_choices helpers
      media: saa7127: use string_choices helpers
      media: adv7604: use string_choices helpers
      media: tc358743: use string_choices helpers
      media: adv7842: use string_choices helpers

 drivers/media/i2c/adv7511-v4l2.c   | 11 +++++-----
 drivers/media/i2c/adv7604.c        | 26 +++++++++++-----------
 drivers/media/i2c/adv7842.c        | 44 ++++++++++++++++++--------------------
 drivers/media/i2c/max9286.c        |  3 ++-
 drivers/media/i2c/msp3400-driver.c |  5 +++--
 drivers/media/i2c/saa7110.c        |  3 ++-
 drivers/media/i2c/saa7127.c        | 13 +++++------
 drivers/media/i2c/tc358743.c       | 40 +++++++++++++++-------------------
 drivers/media/i2c/tda1997x.c       |  7 +++---
 drivers/media/i2c/ths8200.c        |  9 ++++----
 drivers/media/i2c/tvp7002.c        |  3 ++-
 drivers/media/i2c/vpx3220.c        |  3 ++-
 12 files changed, 83 insertions(+), 84 deletions(-)
---
base-commit: a3d78e74dd3ed04797ea351edb7f0a19b961c063
change-id: 20260527-cleanup-string-choices-media-i2c-5abff65802ea

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>

