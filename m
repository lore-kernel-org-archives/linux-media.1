Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27474534AC;
	Fri,  5 Jun 2026 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642981; cv=none; b=sl3zxa2FgIcBNbUfE5qNrEXDpbdhUV6xT7JJi7AQseoUUq4e/IovspLoQZRO8MG/7M6k0kM+zIlaASrai/ajZrqva6AJM/fClIYDuZnjsp8g4t6qZQvkwQZWfSf46QcSF99JsM2YQ4rmYgeEKv2IqJZWa5SpwssF9SjxYRavoDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642981; c=relaxed/simple;
	bh=Y8Z2M5Q2AeM9IRirB6d/i+iL8gaMxICKzExEhAwqy4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pr+IShUTaZCiQHYLd/mPSM7nHx+sU/JjlMH0ADNUzADywH6gqC9ZKSRUsiKpmxSrCdTU9XQzyV0G79tIAF3XlHs2RnFFwcxbKdccF9ry0hhFYMuOF7Y936nwq6dnvMJt+33IJ1TK8yjQ65DNVm7h+rlwHg3ayI68PXVVkSUlyLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlBhJ/rA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlBhJ/rA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61BB5C2BCB4;
	Fri,  5 Jun 2026 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780642981;
	bh=Y8Z2M5Q2AeM9IRirB6d/i+iL8gaMxICKzExEhAwqy4c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WlBhJ/rAYDA++hOb7LWfJ1dt6tRx7ICzwhd0ky0E9WFfYCq+X7/jXU2VwE4CnwHN/
	 shkyY1B/ATzcLFTDIpVOlwKkg3c04p+Aj7wLDWa52ajE1famiVlg6QzYlfEuSHvk51
	 Qs7Af6rb1Z9g/NgiuutXJOzXZdADJw/LYBV75LcvRD7LEQWeJ2cnwHrK754duxqLxU
	 FG43TA+FGqwQs+VgHEnWeUwF1jHmBJohVgMKCbU2e88eA6B7W4n++pd8/WroROBbdB
	 PzcmVu0oVTzYd9Hpcj2CymHKfr+jhzs4MzLgfBs2espE6MsLrqleBZ2Nr/mxEHfYmQ
	 Cj1oSqYaFRotA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4568CCD6E5D;
	Fri,  5 Jun 2026 07:03:01 +0000 (UTC)
From: Herman van Hazendonk via B4 Relay <devnull+github.com.herrie.org@kernel.org>
Subject: [PATCH v3 0/2] media: i2c: add Aptina MT9M113 SoC sensor driver
Date: Fri, 05 Jun 2026 09:02:59 +0200
Message-Id: <20260605-submit-media-mt9m113-v3-0-dc3e07d5d70b@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKN0ImoC/4WOTQ6CMBCFr0Jm7Zj+CBVX3sOwqGUKsyiQFomG9
 O5WLuDye8n73tshUWRKcKt2iLRx4nkqoE8VuNFOAyH3hUEJ1YhG1Jhez8ArBurZYljbIKXG2jo
 ttWmN9BZKdYnk+X1oH13hkdM6x8+xsqlf+ke4KRTYk3TuKoy/OH8fKZaj5zkO0OWcvz94hXK5A
 AAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780642979; l=3168;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=Y8Z2M5Q2AeM9IRirB6d/i+iL8gaMxICKzExEhAwqy4c=;
 b=m8SSE3XZdAKe/3bYZ1taJSmzXFseqPs7jmVF1lLClb68vyc88tAENXRifkRZQ6JwJcqkKx8BL
 joptN0M7X8lB+tIOGHhL2bpzNn3Ch2UELonUw32ZiYENiPHD3SSpdbp
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Endpoint-Received: by B4 Relay for github.com@herrie.org/20240417 with
 auth_id=809
X-Original-From: Herman van Hazendonk <github.com@herrie.org>
Reply-To: github.com@herrie.org

v3:
 - Add MAINTAINERS entry for the new driver + binding (patchwork /
   checkpatch warned about the missing entry on v2).
 - No other changes.

v2 (sent 2026-06-05): pure re-send.  v1 was sent on 2026-06-04 but
PATCH 2/2 (the driver itself) was silently dropped by my outbound
SMTP relay during the original send - the cover letter and PATCH 1/2
reached the lists, the driver patch did not.  v2 routed through b4
+ kernel.org so the driver actually landed.

To: Herman van Hazendonk <github.com@herrie.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This series adds a V4L2 subdev driver and DT binding for the Aptina
MT9M113, a 1.3 Mpx SoC sensor with an on-chip ISP and a small MCU
running a "SOC1040" firmware that performs auto-exposure, auto white
balance and lens-shading correction.  The sensor talks to the host
over MIPI CSI-2 (1 or 2 data lanes); register access is over I2C
using the Qualcomm CCI helper.

Hardware layout exposed to userspace:

    +-------------------+    +-----------------+
    | Pixel Array (PA)  |--->| IFP / ISP       |--->[CSI-2]
    | sink-less subdev  |    | MCU + pipe      |
    +-------------------+    +-----------------+

PA carries V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ so that
downstream receivers walking the graph from the CSIPHY (camss does
this) find them on the entity flagged MEDIA_ENT_F_CAM_SENSOR.

V4L2 controls implemented:
  - exposure / gain / hflip / vflip
  - test pattern
  - V4L2_CID_COLORFX (sepia / mono / negative / aqua / vivid)
  - V4L2_CID_POWER_LINE_FREQUENCY (50/60 Hz flicker avoidance)

Tested on a HP TouchPad (APQ8060, MSM8x60 family) with the on-board
front 1.3 Mpx MT9M113.  Probes cleanly, both PA and IFP subdevs
register, csiphy_stream_on() picks up link_freq from PA, and the
preview pipeline up through CAMSS produces frames.  A bounded
3-attempt retry around s_stream(1) handles a residual silicon-level
wedge that occasionally leaves the MCU's SEQ_CMD in an inconsistent
state on cold start.

The DTS patches that enable the sensor on the HP TouchPad will be
sent separately to the ARM/DTS tree.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Herman van Hazendonk (2):
      dt-bindings: media: i2c: add aptina,mt9m113
      media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml         |  127 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mt9m113.c                        | 2971 ++++++++++++++++++++
 5 files changed, 3119 insertions(+)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260605-submit-media-mt9m113-5ac3137971fa

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>


