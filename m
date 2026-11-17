Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946806;
	b=NzIH6ppoCFRcxL2nx2+uB54E0iHuZ1q1dkap3jkLCy0nWNxQE9CXUMf1YDb0Ftx5LESS
	 pG8QnRo9pV1Nxswu/5gSEqHfXaIfmjWsRR3Ws0wppZU0F/Ng5EjUL4lQ9JXdNdnoQDzpM
	 2MT/bnEohv1cT9IioSdMOnT9RDD8527t4pjtQPQ3zJFA3pdZ4JCDlblO28JRy213kOnjB
	 PLFSSrLmt2SJvoiTLpCN3TR6gGdb7IqYxEzQtcSGA8iMoiACNe5QydZcXlt/25DbmT2Cj
	 kHIKhWeY5BzL6dJxNzQtrPjI/tFXgx5a9Tr1SN7RC6Uh/hyfLJJa1igIpqg7zOsEs2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946806;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=dCZb9Y2Ky7G4ZdQWEPSEsotHftlRF17DHNxVc23HJQU=;
	b=W/LpqhuzIoW/zynPSVKC8ZegkU0Sbfdk5vAtYwX21ZjPCeqZ5qhDOiWaWWelL1TnButf
	 RdsqlfFgKBg/LtVNSz0Ccou1/zTatRJ8EYYLsP7x1YkRuhp61cPyN9OKmx0DrsCz/YHJb
	 ZkgVPUaSD5rNwpWbPmywTabWshFWqRnl4V7XAvfWFZ9fS8nBhsaDpKxBui80FLokLOaoL
	 bjpr2CbRHsb6gjirgNEl4zA67ZK5ark3jeRaigMsVB821ii92aO3f2kJzUOB/yhDnOFyU
	 0fUXqfHM5/4pQZPXH7dMQ7nPa0cCkOkEXY9nPKBujPVdwcWOoxQktIWv/6sB+X1yv1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBS41eeX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526B606A33D;
	Tue, 17 Nov 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBS41eeX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794946806;
	b=ykrsHBCYJ9fZNXZEz2N35fw/grmaHyb6UH4OLt6zwFnuXlb2pEIag3EMhEjiy0szIGcX
	 hi44d9nPvj4e1mwqQ0guGbO6N7BKErLQSFf9ZYVEtB2SuqjnBXHOwuMV011XIhNR7Xgsa
	 JgFeO+5KXY3C/RmvkaUK5g08dD7Vxvn1sibutBx1GxGITP8rNnRl9KA/VKlMkJDnXHZUn
	 lH6zoYwnSDWpofaRDrWHoZcybGcvvrd+PII1Y1Jq51ufkF2NX2NQ/MNFsKcfB741TUjoN
	 FVR1Kr+euxKT/o/dN8ZCn5iEE2gOGJMYWSy5HyIggEoY58FTf5SWv/e513faUE454dA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794946806;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dCZb9Y2Ky7G4ZdQWEPSEsotHftlRF17DHNxVc23HJQU=;
	b=tQQWFTinlPemwnj6nrMNYl8JLvgXE025N03r0YuGzVHknKCQ7BkvBtEaN3u7Gnw3fVtU
	 izvSczqEkVtPoIGzbmS9JzF3V1ZY1xdPae83fR9TMRTJJjtLi+O6T5rB/MgWd7NdPcLx3
	 UgWAcxBfHGfPwqlhezn0nXU2Xsh0N5ABCceVY1q49CJb7WV3DQymT/KadcOmZklE7axNk
	 aF8VNMfJby7WDY2sG6fVxmP+egaPIf4UAkKJcw8MRps5cxHz8ekoim0Yg4p4Neoxk3QQp
	 NLET9noE3jbQJ3dCQvXirPYLDgVK4Fw7n0L34Ox9MSS9QsbtrL2/grZnqRNXOHUZ8DQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4171B1F000C5;
	Tue, 17 Nov 2026 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946806;
	bh=dCZb9Y2Ky7G4ZdQWEPSEsotHftlRF17DHNxVc23HJQU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bBS41eeXzy3AMMEay8vml6SvzRBRvLnmKzozlpt9Qb4iggBtfgd0U1OkYpVITWVJK
	 iWjlSMrquJ7iWLe1+dEAAWBQJdjGrA+1uMmoZMta7xmhuPhg8SebkBL+33v1L/RWaQ
	 Up0U1F/0NtgxzXASuKdHg3/Ukymw6YLxeZNHUXfa/MHecDkjRJDXggTNIClmHGcSjF
	 IQSkNldFwv7RFGIDQT6JIx8qjFciR1GjHx0qVVxNSwJkeVkFPewAAKwkGrIi9ZkXrE
	 yYIWRINU8PVH56P8PKM5/NtFtC5nHiDehL+IFvN5L8EemjAV+T3ncgfR6w/saddoP2
	 UUafNyG0IWu2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 93C4A4AAC1;
	Tue, 17 Nov 2026 20:20:04 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH v5 0/2] media: i2c: Samsung S5K3T2 image sensor
Date: Tue, 17 Nov 2026 21:20:03 +0100
Message-Id: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOzUoDMRQF4FcpWRu5P8loXfke4iK/NkpnhiQdl
 DLvblJBageXB8537j2LEnIKRTztziKHJZU0jS3ou51wBzO+BZl8y4KABtgTyNNcag7mKIv+4Eq
 S2DJ7Y4FRi6bmHGL6vCy+vP7kcrLvwdU+0xuHVOqUvy4nF+y9/9cXlCD9oOBBQVSA/DznqU7j/
 TGIvr7Qteetp+ZBxegNswaHt56vvdp6bt5opx99dMHR/tarX4+AuPWq/89skaJlGv78v67rN6/
 NZHmAAQAA
X-Change-ID: 20260920-upstream-s5k3t2-23b33dab0315
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794946803; l=4420;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=cWqprRsWHifDeyW+sl4Dkmfh8eAssu1/TNdW3k/zaZw=;
 b=UZI5K0+TMQE4wKCGPqbGpGSB5wqz+El6gd5sT9JsTmTPpoKkWRO3AlLhw4cSgKhSN0cVHURUv
 XxMwdAeAyN9CgiobQixeBalX70rRFXpD2pGTQywNdN2UXpLYOsg9LLG
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

This series adds a binding and a driver for the Samsung S5K3T2, a
20 Mpixel CMOS image sensor with four MIPI D-PHY lanes.

The sensor is the front camera of the Xiaomi POCO F3. That phone has no
device tree in mainline, so this series adds no user for the binding.
The driver was written and tested on the phone with the Qualcomm CAMSS
driver.

Tested:

  v4l2-compliance on the sensor sub-device, 46 tests, 46 passed
  capture in all three modes, twelve runs, no kernel error
  the sensor returns to runtime suspend after every run
  exposure and gain sweeps checked on the captured frames
  Bayer order checked for both flips

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
Changes in v5:
- Dropped four page select writes (0x6028) from the register tables.
  Each one selected the page that was already selected. They came from
  the vendor sequence.
- Collected the Reviewed-by from Elgin.
- The link frequency still follows the mode. The question about it on
  v3 is still open.
- Link to v4: https://patch.msgid.link/20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me

Changes in v4:
- Use ARRAY_SIZE() instead of the S5K3T2_NUM_SUPPLIES macro.
- The link frequency and pixel rate controls have no ops now, the
  driver never writes them.
- HBLANK and VBLANK are written from s_ctrl. The line length and frame
  length registers are gone from the mode lists. HBLANK is not read only
  anymore, but its range is still one value per mode.
- The flips are written from s_ctrl and are clustered.
- 0x0100 and 0x0101 are written as 8-bit registers.
- The mode is not kept outside the subdev state anymore. The crop
  rectangle is kept in the state too.
- Every control call in set_fmt has its return value checked.
- The fwnode properties are parsed before the control handler is set
  up, and the control flags are set after the error check.
- Dropped the link_validate op, the redundant fwnode and endpoint
  checks, and the gotos in power_on and set_fmt.
- The error labels in probe start with err_, and remove calls
  pm_runtime_dont_use_autosuspend().
- Small cleanups: container_of_const(), local variable order,
  s5k3t2_format_from_mode(), and init_state returns the set_fmt result.
- The link frequency still follows the mode. The question about it on
  v3 is still open.
- Dropped the line about hidden modes from the commit message.
- Link to v3: https://patch.msgid.link/20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me

Changes in v3:
- The check on pm_runtime_get_if_active() is back to the form used by
  every other sensor driver. The v2 form skipped the register write when
  the helper returned an error, so a kernel built without CONFIG_PM never
  applied exposure, gain, blanking or the test pattern.
- The binding now requires clocks and the three supplies. The driver does
  not probe without the clock, and the sensor needs all three rails.
- Link to v2: https://patch.msgid.link/20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me

Changes in v2:
- set_pad_format() now stores the new mode before it updates the
  controls. The VBLANK handler reads the mode, so it used to program the
  frame length from the mode that was active before the call.
- A negative return from pm_runtime_get_if_active() is no longer read as
  active. Runtime PM can be disabled for the device, and in that case the
  usage count is not taken, so the old code could drop a count it never
  took.
- The PM ops use RUNTIME_PM_OPS() with pm_ptr(), so the ops and the power
  callbacks are dropped when CONFIG_PM is not set.
- Link to v1: https://patch.msgid.link/20260920-upstream-s5k3t2-v1-0-d640740f4013@proton.me

---
Armandas Kvietkus (2):
      dt-bindings: media: i2c: Add Samsung S5K3T2 image sensor
      media: i2c: Add Samsung S5K3T2 image sensor driver

 .../bindings/media/i2c/samsung,s5k3t2.yaml         |  105 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5k3t2.c                         | 1327 ++++++++++++++++++++
 5 files changed, 1451 insertions(+)
---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260920-upstream-s5k3t2-23b33dab0315

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


