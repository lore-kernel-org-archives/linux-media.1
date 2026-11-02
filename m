Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616895;
	b=C6ewFtVma0diJ6ULZZGD2JTQVNGoo9UUNzzKg3ekmepl00OfQJ2OrtiUPRMysKZ2aLBy
	 emphbV8YnwMVzj+AbV+ydu57Dzy36PLR0R7DJNPE2ZLiCCrPPycLwBO+oepFbYLLZ8N7L
	 1ReKNMAQjNYrEwlkMQZeq4bNyt8sv3WHFDK9ebrmGrFeM0t48x7IbPUz34EFUtZazEiq3
	 p6VCmcggiwAOv//tP6AU4gfuZxATWxloX6LLGNr2+Ko1QAg8mItpZ4q9ni+RMKEn9AG48
	 KqB0TkszDuJZEZvRhwFZCXEmq+WzcZ0KDgWPHKUAspJJkTply4uZ1R1Wd9rLI149msQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616895;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NWG1AS4n4YHpmMswdTb4afagBqt4yYiwr2aDKkk+O1U=;
	b=xF7CnKRf1KAUFISSBIQj24hvRVQnK7nRcP7/+85pQU9Jl3mJQb5IYWR6c+KGWYi+Qunm
	 Pzp8NvYbPrBGZg+mEnODs1UUlVUlygiUwLAUAPIFlEYCn/uM7t33YLeLeHjNV3yvn6Q5I
	 2HRx91pbUfRLDkITByGNK6933pTHOMvA1Pt8Qjz1AeaSFuQeIoVwAIXjtxDBZ05UToqav
	 DYn2wTGredx0A3Im6M/66uKWfPBDs0BWjr1+k+fPCo//mURkMD7yCkbcD/4VxtlQpN3ga
	 g4pWOvTGegy/whdSWx3SiLxkRiKg5GCNcMbzJoEVf7QUD4KFeJ24SKqwHiwImSSz3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrM4Xekn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445AF606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrM4Xekn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99121F00A16;
	Mon,  2 Nov 2026 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616894;
	bh=NWG1AS4n4YHpmMswdTb4afagBqt4yYiwr2aDKkk+O1U=;
	h=From:To:Cc:Subject:Date;
	b=RrM4Xekn2NJGdxHe6m+N5fvRteB9VeYF7rGQMsBEJcrTgvFVhQ3aMVbbbmOmAGYiz
	 ZSPG7JOeE79UjKX0p8OZXyiFdMti/fXVL3vIUqHrhO5l1nXppUN9DUaG+0a7dWx80W
	 Xdtq4dhk2BGLhuP8LWEjoLwkHY2lHjEvlG6dQEos8Zy+LgOqydZPAJAoXSZvcP9ayh
	 Lbt2vAkvlWEGWlW9ROv3H3vqbJ0OechanzH8utisJFBadnO0FhEYe5GXrovHgMP3fg
	 4KuneJaXLlk9q1tMA1kvysq/gj7pXP42iT7zSrbcitcxAyx6JMEp0fz7Pbh/WpMPE0
	 vTYphnlyLItYw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/13] media/drm: cec: add EDID_PRESENT
Date: Mon,  2 Nov 2026 11:36:51 +0100
Message-ID: <cover.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the media CEC framework the application receives events when the
Physical and/or Logical Addresses change. However, if the Physical Address
changes to f.f.f.f (Invalid), it does not know whether that is because the
HDMI link is disconnected, or because the EDID does not provide a valid
Physical Address. That can happen because the display does not support CEC,
as is the case for DisplayPort inputs or PC monitors.

This is important information to have but this is currently missing.

This series adds support for that.

Currently drivers set the physical address either with cec_s_phys_addr() or
with cec_phys_addr_invalidate(), where the second is just a helper
function that calls cec_s_phys_addr with CEC_PHYS_ADDR_INVALID. There
are also cec_notifier_ counterparts.

Change the behavior so that cec_s_phys_addr() is called whenever there
is an EDID. In that case CEC_PHYS_ADDR_INVALID means that the EDID is
present but does not contain a valid PA. And cec_phys_addr_invalidate()
is only called when the video link is disconnected.

Most CEC drivers already did that, except for the few that are fixed in the
first 6 patches.

The remaining patches implement the new functionality where the CEC
framework actually reports whether or not the EDID was present, based
on whether cec_s_phys_addr or cec_phys_addr_invalidate was called.

The drm patches can either be queued up in the drm subsystem independently
of the remaining patches, or I can take them through the media subsytem
as part of the series, but then I need an Acked/Reviewed-by.

Regards,

	Hans

Hans Verkuil (13):
  gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no EDID
  gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no EDID
  gpu: drm: omapdrm: call cec_s_phys_addr only if EDID is present
  media: i2c: adv7511-v4l2: call cec_s_phys_addr only if EDID is present
  media: cec: extron-da-hd-4k-plus: call cec_s_phys_addr only if EDID is
    present
  media: cec: core: improve cec_notifier_phys_addr_invalidate
  media: uapi: cec.h: add
    CEC_CAP_HAS_EDID_PRESENT/CEC_LOG_ADDRS_FL_EDID_PRESENT
  Documentation: media: document EDID_PRESENT cap and flag.
  media: cec: core: add support for EDID_PRESENT
  media: uapi: cec.h: add CEC_EVENT_FL_STATE_EDID_PRESENT flag
  Documentation: media: cec-ioc-dqevent.rst: document STATE_EDID_PRESENT
    flag
  media: cec: core: implement CEC_EVENT_FL_STATE_EDID_PRESENT
  Documentation: media: document cec_phys_addr_invalidate

 Documentation/driver-api/media/cec-core.rst   | 10 +++-
 .../media/cec/cec-ioc-adap-g-caps.rst         | 10 ++++
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    |  9 ++++
 .../media/cec/cec-ioc-dqevent.rst             | 10 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  7 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  5 ++
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  5 ++
 drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
 drivers/media/cec/core/cec-adap.c             | 49 ++++++++++++++++---
 drivers/media/cec/core/cec-api.c              |  3 +-
 drivers/media/cec/core/cec-core.c             |  4 +-
 drivers/media/cec/core/cec-notifier.c         | 13 +++++
 drivers/media/cec/core/cec-priv.h             |  3 +-
 .../extron-da-hd-4k-plus.c                    |  8 ++-
 drivers/media/i2c/adv7511-v4l2.c              |  2 +-
 include/media/cec-notifier.h                  | 33 +++++++------
 include/media/cec.h                           | 27 +++++-----
 include/uapi/linux/cec.h                      | 29 ++++++-----
 19 files changed, 171 insertions(+), 60 deletions(-)

-- 
2.53.0

