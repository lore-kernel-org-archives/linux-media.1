Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863632;
	b=v0ZSVOIf8Hr9GqfhNKGbE7FViJ6/YV7H6TnbA2Bjp+BiOaOjVRBeavDBP6/DmkKwu3NM
	 +zNw3pzKfqF/m0bqgppf5LE3IA1Py+Ypn6vPAVDk6cEuJQSs6zjpkA2VWuMpuazREUfOP
	 kyK7KpPWzbROCuK10B5bFYt4PfIzqEDIdakPTXs50kpEuStOa1e30V0aVWe3dRybnrxxZ
	 OLz/nDeEiQRfo/r/HQ+0f/tDEpjT1EOa8Hu0WXQBLM7CT3gnbYoc9AvBptS57v9oByEd5
	 7gFI19zBcP13DplOIgwD2uDq5Pyo38OZtxylhbWCMDiOwLJT1i9AiWvuQiVUenbft2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863632;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khXZIcYeZjQkrR8ortlP2nK6TnkcUcW/+TnoB0iwtCA=;
	b=TjD0TkAhxGbYScnHYxgEEaDADpHUvqw+a9a+++sZ4C2cG03hILdNP6wOXxv9IUewDhR0
	 ToQqA3g59yNsXubh5ReGfsMzKkGjaqHcd+g6eo2FClVspNg31SJVsCxMxaEDK6k+Vt56l
	 3o0sBRNY9JbC8MboQIztWhtXo2JNYefd8W2h16UyCtS+5Y+P+dv1oKwVVvA4kXrcAT2Mk
	 yeU8TZoxhszcuZTF9ANBmYZbkD0lsLqa8OtWiZJM/RJEWYH9Kg7otIpOAueup9R49JPw9
	 hktfA5794+2DpxmDYbPDww1YISbVPTCphERbswDsTXbyxjrFu4hreNl/4F6Q6VvweZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReieijRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8AD606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReieijRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781151F000C1;
	Thu,  5 Nov 2026 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863631;
	bh=khXZIcYeZjQkrR8ortlP2nK6TnkcUcW/+TnoB0iwtCA=;
	h=From:To:Cc:Subject:Date;
	b=ReieijRIEIjNfoEzXIW0A127am8M7iIrncf1ZyuMzR7vcXCtBnb8iTUdwF+bUmYVl
	 ZEz4bllXjxey6e7UKhnSHUKfn4WR14Ih/oG1/Ro7ZEESXPaWdTej2fyfQ1nCfbJLTs
	 bgWUjgZRWYSRwTY9qs50YxJXuEQUNU2uGlpGREfn5O3noLNIkzIDGCy3NwdnBQO1qf
	 Iiqtn2GFdug0sEOI28bIA6Qgmc9na5OoGB+a0lnSm9TAiD2s3HGSZvHtzy8LkZKeoJ
	 pCiOKoW5FEngtZYTNd8zGb4qoVBBwuW/bw3HNRqKWTFSFQAwEYG/ctTQrNS1Soku16
	 S9eFyQPqDOGjA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCHv3 00/13] media/drm: cec: add HPD_PRESENT
Date: Thu,  5 Nov 2026 08:22:14 +0100
Message-ID: <cover.1793863347.git.hverkuil+cisco@kernel.org>
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

Change the behavior so that cec_s_phys_addr() is called whenever the HPD
is high. In that case CEC_PHYS_ADDR_INVALID means that the EDID is
present but does not contain a valid PA. And cec_phys_addr_invalidate()
is only called when the video link is disconnected.

Most CEC drivers already did that, except for the few that are fixed in the
first 6 patches.

The remaining patches implement the new functionality where the CEC
framework actually reports whether or not the HPD was present, based
on whether cec_s_phys_addr or cec_phys_addr_invalidate was called.

Note: I think cec_phys_addr_invalidate should be renamed to something like
cec_phys_addr_disconnect given the changes semantics of this function.
I will tackle that once this series is in.

The drm patches can either be queued up in the drm subsystem independently
of the remaining patches, or I can take them through the media subsytem
as part of the series, but then I need an Acked/Reviewed-by.

Regards,

	Hans

Changes in v3:

- Renamed EDID_PRESENT to HPD_PRESENT, since that's what it really is.

Changes in v2 (based on sashiko reviews):

- missed one incorrect cec_notifier_set_phys_addr call in sti_hdmi.c
- cec_notifier_cec_adap_register didn't call cec_phys_addr_invalidate
  if an earlier cec_notifier_phys_addr_invalidate call indicated that
  there is no EDID.
- sending the initial state change event didn't set the
  CEC_EVENT_FL_STATE_EDID_PRESENT flag if needed.

Hans Verkuil (13):
  gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no HPD
  gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no HPD
  gpu: drm: omapdrm: call cec_s_phys_addr only if HPD is present
  media: i2c: adv7511-v4l2: call cec_s_phys_addr only if HPD is high
  media: cec: extron-da-hd-4k-plus: call cec_s_phys_addr only if HPD is
    high
  media: cec: core: improve cec_notifier_phys_addr_invalidate
  media: uapi: cec.h: add
    CEC_CAP_HAS_HPD_PRESENT/CEC_LOG_ADDRS_FL_HPD_PRESENT
  Documentation: media: document HPD_PRESENT cap and flag.
  media: cec: core: add support for HPD_PRESENT
  media: uapi: cec.h: add CEC_EVENT_FL_STATE_HPD_PRESENT flag
  Documentation: media: cec-ioc-dqevent.rst: document STATE_HPD_PRESENT
    flag
  media: cec: core: implement CEC_EVENT_FL_STATE_HPD_PRESENT
  Documentation: media: document cec_phys_addr_invalidate

 Documentation/driver-api/media/cec-core.rst   | 10 +++-
 .../media/cec/cec-ioc-adap-g-caps.rst         | 11 ++++
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    | 10 ++++
 .../media/cec/cec-ioc-dqevent.rst             | 10 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  7 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  5 ++
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  5 ++
 drivers/gpu/drm/sti/sti_hdmi.c                |  4 +-
 drivers/media/cec/core/cec-adap.c             | 51 ++++++++++++++++---
 drivers/media/cec/core/cec-api.c              | 13 +++--
 drivers/media/cec/core/cec-core.c             |  4 +-
 drivers/media/cec/core/cec-notifier.c         | 26 +++++++++-
 drivers/media/cec/core/cec-priv.h             |  3 +-
 .../extron-da-hd-4k-plus.c                    |  8 ++-
 drivers/media/i2c/adv7511-v4l2.c              |  2 +-
 include/media/cec-notifier.h                  | 33 +++++++-----
 include/media/cec.h                           | 27 +++++-----
 include/uapi/linux/cec.h                      | 29 ++++++-----
 19 files changed, 193 insertions(+), 67 deletions(-)

-- 
2.53.0

