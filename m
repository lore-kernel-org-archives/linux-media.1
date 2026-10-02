Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7430C164
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904614; cv=none; b=uAin6rp66NDwxJ2L66c85l+U4SCfYHXHq+M6GIPdll+Yw+ncQPDkbYZA/ZhAj/SR4BLoQ8kunYwdS6IC5YcQcvoJaz89V2L986B+PAVJ90HvlPeL6YkX/3qKoC13/uqXeJUsIE5FwNWnrwYBsD1V/C4My2K0jH44mM63GbUafVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904614; c=relaxed/simple;
	bh=fsKLv/xVTbMFD7uak8XY6n9jIoy2OnDgM+O3PvNdjp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh0IdtIzESDxPr74OMP6EbPOw5YgOAhEsPBTV3Y0SmETFSLySp56AiNQRzrHi/YAFlUouUzWVdMD4L1atu0U7RLYnP8EA4eq/azmAweQBaefSYBbGDQh8wIV1kJqhmXhfDNB1Oe9iHWYojum7OjV+q4jSPtfgghAl27iLM4Uiws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jgboHQYu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jgboHQYu"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98703227;
	Fri,  2 Oct 2026 03:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790904495;
	bh=fsKLv/xVTbMFD7uak8XY6n9jIoy2OnDgM+O3PvNdjp0=;
	h=Date:From:To:Cc:Subject:From;
	b=jgboHQYueCIjmUt4ojLmWHz5wWpCQcc91V0kIPOAnEDhwU5KmdynwJFMa+P0nDDB0
	 zAZBi6tsXdU44ZEY+a5BAH0j6e96YzsoTk9Nzr+A+XD+GqZgk0wQxbDCwnNaYDLvky
	 1G//KMbPH2oidj7ralqA6P7LG0ZAoex1RIOcenyg=
Date: Fri, 2 Oct 2026 04:30:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Kean Ren <rh_king@163.com>,
	Michael Jordan <jordan.mymail@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Wei Jie Law <98lawweijie@gmail.com>, Yunke Cao <yunkec@google.com>,
	=?utf-8?B?44Kk44Og44OG44Kj44Ok44K6?= <reza1234khan1234@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v7.4] uvcvideo changes
Message-ID: <20261002013007.GA101842@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The following changes since commit 4a069a763e8a86821edac4159f7c59a20015631b:

  media: i2c: vd55g1: Add ACPI support (2026-10-01 15:59:03 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20261002

for you to fetch changes up to 79dd149ff9244884f7c62356a9e499a934ed6071:

  media: uvcvideo: Bound uvc_parse_*_control to the control size (2026-10-02 03:46:57 +0300)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- Fix NULL dereference for uninitialized XU controls
- Harden descriptors parsing
- Add various device quirks
- Miscellaneous cleanups

----------------------------------------------------------------

Note that the media-patchstyle CI job fails due to a Cc: stable tag not
followed by a Fixes: tag. This is on purpose: commit d5f609963529
("media: uvcvideo: Force UVC version for Avermedia GC515") adds a device
quirk that Ricardo deemed a candidate for stable backports, but it isn't
a bug fix. We probably want to relax the CI rule.

Kean Ren (1):
      media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)

Michael Jordan (3):
      media: uvcvideo: Generalise the XU flags fixup to all controls
      media: uvcvideo: Fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
      media: uvcvideo: Fix up missing AUTO_UPDATE on the OBSBOT Tail 2

Ricardo Ribalda (6):
      media: uvcvideo: Remove unused active field
      media: uvcvideo: Add autosuspend quirk for AVerMedia Live Gamer HD 2
      media: uvcvideo: uvc_warn should warn not info
      media: uvcvideo: Use uvc_warn_once when it make sense
      media: uvcvideo: Force UVC version for Avermedia GC515
      media: uvcvideo: Bound uvc_parse_*_control to the control size

Wei Jie Law (1):
      media: uvcvideo: Fix NULL deref on events for uninitialized controls

Yunke Cao (1):
      media: uvcvideo: Add quirk for invalid dev_sof in Logitech C925e

イムティヤズ (1):
      media: uvcvideo: Make uvc_event_control attribute name array const

 drivers/media/usb/uvc/uvc_ctrl.c   | 117 ++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c |  45 +++++++++++++-
 drivers/media/usb/uvc/uvc_status.c |   2 +-
 drivers/media/usb/uvc/uvc_video.c  |   4 +-
 drivers/media/usb/uvc/uvcvideo.h   |   4 +-
 5 files changed, 122 insertions(+), 50 deletions(-)

-- 
Regards,

Laurent Pinchart
