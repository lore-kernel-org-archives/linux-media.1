Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35342B33A;
	Mon, 20 Jul 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557767; cv=none; b=VBFy4qEc65G8wFJyhhPTN9Uf722QKoipFawLoFi7pU01muJ9KIdlE0m0A81XJRdhEq7T83LuQn4r80x2LbZ/QxmHkeckXvIkyBCERz+6SZzgNmCOHX+/DzuvYy7acQYSj5PMP83iPIABRBY/D8xosK/BroJO4bOLiglcX48BZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557767; c=relaxed/simple;
	bh=PKu6ZM0R5CwUasCTKi7Ym+D5wVThMFpjTVz34hJF4YY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R1q71wG7LRcCvy/csUb/8WjHvsGcy5LPDtoOGBEZjQPPBHBi9AF8Kj1VYnmr/9jVWDSp1M40a+g7ba1QTpeeDsaKchhaTG49siEQOCM7JmHRumfPfHvGPWwcnOfDAlFV0tYaXVNoMrLpwCTP2F/RbstQxUBlGK75owIUItr2wq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=WGzsUOSs; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="WGzsUOSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784557753; x=1784816953;
	bh=xrHY0E4R1CByJ1fh1ODLNLl+6NRKYdyAqh5u+gIG9zU=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WGzsUOSsUybiJeF72y3HebYRsxO28Puv3azpNKO2OVkqIyoXG608KprqZlZVLLY9z
	 DXtbKm8U4DGSM9ciw9cwctcvaXXnZr8HyssHDJByH6if91gyf4VOvw3kt8RyKrvCSk
	 FCswD9RtxA/A77OIxWoK0OluPVIurwQu5+QGHyDO3RwEpgL9NRMkI554pJF4q/AoTH
	 is20JFvjc7gEyboQodz5aMNt7kS/kz3w2MacT53UjqJ5CvxL3HE2aRELqZHXWGiNFs
	 3J5yCS2Yxnkelzk3zc4+/LEqQqLvLwY3G1m/JOxUWtjW0KcKok3IL+PM3jYYqlosej
	 OkiU9aCMlCniQ==
X-Pm-Submission-Id: 4h3jZG3NLWz1DDpC
From: Jakob Berg Jespersen <dev@berg.pm>
Subject: [PATCH RFC 0/2] media: i2c: Surface Pro 7+ camera flip fixes
Date: Mon, 20 Jul 2026 16:28:39 +0200
Message-Id: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3eIC84Kc0mLd/DLdtJzMgmLdJLPkZDMTUyNjsyQzJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUAQynIhnkAAAA=
X-Change-ID: 20260720-sp7plus-ov-flips-b6cc645236b6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 Fernando Rimoli <fernandorimoli11@gmail.com>, 
 Tooraj Taraz <tooraj.taraz@yahoo.com>, 
 "Joseph V. Lavigne" <jlavig88@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jakob Berg Jespersen <dev@berg.pm>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784557750; l=3750;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=PKu6ZM0R5CwUasCTKi7Ym+D5wVThMFpjTVz34hJF4YY=;
 b=RYk8iPAVY12MqSkhQXIED9UCdIwtaQMdorCu5ftzJMhdfbWaXPxKq6k5UVtmiCU6+un6/Qq2b
 7Yhf6+w7XAJB1MZOiQUhwZM23PUY5dwRLHAnGun2ZsbzXtS1kybyNz3
X-Developer-Key: i=dev@berg.pm; a=ed25519;
 pk=b1r+eoJThwSQ/r5DjO7jrcosyrIsyhlOuKk9CBdvBxs=

This RFC series fixes two horizontal-flip issues on the front and rear
cameras of the Microsoft Surface Pro 7+ (Tiger Lake IPU6, ACPI/ipu-bridge).
Both were found and validated on real hardware (Surface Pro 7+, Fedora 44,
kernel 7.0.12) and have been in daily use on that machine for over a
month; each is described in detail in its own patch.

  1/2  media: i2c: ov8865: fix horizontal flip control polarity
  2/2  media: i2c: ov5693: fix horizontal flip polarity and Bayer phase

Both camera sensors on this device are mounted with a 180 degree rotation
(ACPI SSDB rotation 180), so libcamera requests HFLIP=1+VFLIP=1 to
correct the mount. Both patches address the same class of bug on the two
OmniVision sensors: the FORMAT2 FLIP_HORZ bits un-mirror a
natively-mirrored readout, so the V4L2_CID_HFLIP control is inverted. I
isolated this with a live 4-state flip/image matrix on the streaming
sensor (details in each patch). The ov5693 patch (2/2) additionally
compensates the Bayer phase, since clearing the flip bits shifts the
sampling one column off the fixed SBGGR10 the driver reports.

Why RFC:
 * Both polarity fixes change behavior for every existing user of
   these sensors, not just the SP7+, so confirmation of the flip
   direction from other-platform users could be considered before
   this is applied. Colors were verified unaffected on the SP7+.
 * For the ov5693 Bayer compensation I used a window-offset approach that
   keeps the mbus code fixed and userspace untouched; the alternative
   idiom is a flip-dependent mbus code + V4L2_CTRL_FLAG_MODIFY_LAYOUT on
   the flip controls (similar to that of imx219 from what I understand).
   Maintainer preference welcome.

Note: bringing these cameras up on the Surface Pro 7+ takes two
prerequisites this series does not itself depend on. The ov5693 front
camera streams on IPU6 only with a MIPI_CTRL00 (0x4800) clock-lane-gate
write, posted by Fernando Rimoli as "[PATCH v2 0/3] media: Enable the
OV5693 front camera on IPU6 Surface devices" [1] (confirmed here on the
SP7+); and the ov8865 rear camera probes only with an int3472 regulator
patch I posted separately to platform-drivers-x86 [2]. This series is
independent of both: it concerns only image orientation and color, not
bring-up.

I discovered these issues independently, though the motivation to work on
the Surface cameras came from the linux-surface community. I'd like to
credit two parallel efforts there on the same hardware family: Tooraj
Taraz observed both the inverted-feed and power-cycling quirks while
adding Surface Pro 9 camera support out of tree [3], and Joseph V.
Lavigne posted an RFC enabling the ov8865 power supply on the Surface
Pro 7+ itself [4]. These are among my first kernel patches; I read their
work closely only while writing this up and have not drawn on their code
here.

[1] https://lore.kernel.org/linux-media/20260717132021.18034-1-fernandorimoli11@gmail.com/
[2] https://lore.kernel.org/platform-driver-x86/20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm/
[3] https://github.com/linux-surface/linux-surface/pull/1867
[4] https://github.com/linux-surface/linux-surface/pull/2201

Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
---
Jakob Berg Jespersen (2):
      media: i2c: ov8865: fix horizontal flip control polarity
      media: i2c: ov5693: fix horizontal flip polarity and Bayer phase

 drivers/media/i2c/ov5693.c | 22 +++++++++++++++++++++-
 drivers/media/i2c/ov8865.c |  8 +++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260720-sp7plus-ov-flips-b6cc645236b6

Best regards,
--  
Jakob Berg Jespersen <dev@berg.pm>

