Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101473;
	b=NP+Knk0jOtnu8qOk0pUSd8R2ML6Z2cKRcggnHkEt6pTJnyu/KdlZ8IjLWl/kV/c5aWo4
	 WIKm5poy8O5zCA89E3W7F6TARZ5AvsmeD1af6iUEF+CcvywuXOd1i82dzTT4a9EiZpmlV
	 5AjRQoaqKZSNeAL2N/9B/Eu24nIfeGGx7RciJSSK0SUiwP3n/yuPIkEvjSnpWQmxYuUOm
	 bC77oBw/dN1s7EZLkxUkbrRGVwXZQkVmdDQxo8UB2QJvtDhx5WBG+dLT05YI7YdQvAxIF
	 ZaTdjLU7m4HK1ZcI+vFGr4afCTaIbvm+nlQbF1SNefUjZbjoNBkcoJU3HIWpnCPuMlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101473;
	h=DMARC-Filter:DKIM-Signature:To:Date:Subject:X-sib-id:Message-Id:
	 Origin-messageId:X-Mailin-EID:Cc:List-Unsubscribe-Post:Feedback-ID:
	 From:List-Unsubscribe:X-CSA-Complaints:Content-Transfer-Encoding:
	 X-Mailer:Mime-Version;
	bh=aZoT8Rsgv6ZRpZog2Yv8ZExkygxeRKZGgV/LAEavvwk=;
	b=i5ifztalqRNruEyh9l6EnDpZsWAHLZZDA1nB+3tn7OrDvzZwwII2/SggVhNsSuzSaXi/
	 sa9p7sIXtFfEFjoasqNjdOkFpg+NQ+sIhfDl/PxvCTtvrIGttBF+KcqdSFZcKAgSCIdAr
	 Y/U2j4drmTAKSlwlJCrwjtZURVTfTN1/p2POcGBzV+MVcqIlLEJjHR/iEJ/k6TIafmeBP
	 PTfdNcaD3O/XJ3Tt6xkQAgRqCi8JG/TWW/jPd+E+EhA6TwgrPIjCPak+f0OF4TzXAfHMH
	 Wxq1aFk249FanQvO1brEZPotXEJY7m49bej3AgLrP7T8nlt7kL+COJD4yqU3bbMYkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gx.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=pkpGcunl;
	arc=none smtp.remote-ip=77.32.148.24
Received: from gx.d.sender-sib.com (gx.d.sender-sib.com [77.32.148.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD9606A330
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 01:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFD9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gx.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=pkpGcunl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=aZoT8Rsgv6ZRpZog2Yv8ZExkygxeRKZGgV/LAEavvwk=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=pkpGcunlwfsLX85rxk4wnnnXDtSqDQgwQdqM1zOMgSAWbHIV4k+OWIlkUXoKNDq6TyghaFJTlVd/
        9rzaQr1Kq7Z6CYDkz72r3SQv9ElNmipZjLVIH4reKM2yqZekf3QCj/3XbKEToHK7jPYgV2mO2NnB
        7QMPijZ/CkCdLtrw200DnVJJl4AGEdzyFNo+S1rA3sawoyma76utHMvkLYD+2QRBNCe9FIw41UjM
        U5ilil8JcnVEb5FhuaPpHPm5QnYmcxVDRqKIjVb0CmMNIRLU0BoifFBKKjKnq4da4zTq//zA7pte
        0PcWM3lSCJUURx/tFrMazWsYSNCnNBqZsYyNUw==
To: <linux-media@vger.kernel.org>
Date: Sat,  7 Nov 2026 17:31:06 -0800
Subject: What should bridge drivers use instead of __v4l2_subdev_state_alloc()?
X-sib-id: jO7KjgaLpm6PIkIJvZD7S4OioFGVbVvWRR30Wkq0Ir8fdhhJuxnymlx1RxnrtVUlMobaH8UtV8zBjB3x3QBOXcbAKLFM141u4uPBpQHLj5A0P10wGyxInwDYCW1FSt3oXEqxLzSuB90dSfww8WLHOghsVpIfnvtGjKo6eXkKlN9CMPb7hQMMkvXK
Message-Id: <20261108013106.1162346-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108013106.1162346-1-DelaySystem@tubot.lat>
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZ348MjAyNjExMDgwMTMxMDYuMTE2MjM0Ni0xLURlbGF5U3lzdGVtQHR1Ym90LmxhdD5%2BZ3guZC5zZW5kZXItc2liLmNvbQ%3D%3D
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,  "Sakari Ailus" <sakari.ailus@linux.intel.com>,  "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,  "Hans Verkuil" <hverkuil+cisco@kernel.org>,  "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>,  "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.24:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0


Hello,

While working on drivers/staging/media/tegra-video I ran into the FIXME
above __tegra_channel_try_format() in vi.c (added by commit 40aaab9d773b
in 2022):

	/* FIXME: Drop this call, drivers are not supposed to use
	 * __v4l2_subdev_state_alloc(). */

The driver needs a scratch TRY state to negotiate formats with the remote
sensor subdev from video-node ioctl context, where no subdev file handle
exists. I looked for the intended replacement, but:

- there is no non-dunder allocator in drivers/media or include/media;
- v4l2_subdev_call_state_try() is documented for legacy non-MC drivers
  only, has no in-tree users, and allocates one state per call, while the
  driver needs one state across enum_frame_size + set_fmt + get_crop;
- the active-state APIs have the wrong semantics here, since try_fmt must
  not disturb ACTIVE state;
- the same FIXME is still present in mainline vsp1 and staging atomisp,
  and mainline stm32-dcmi still calls the dunder directly, with (as far
  as I can tell) zero conversions since the 2022 rename.

So my question: is a new core helper the intended direction for the
bridge-driver scratch-TRY-state case, and if so, is there any guidance
on the shape it should take? Or is there an existing pattern I missed?

If a new helper is the answer, I am happy to implement it and convert
the in-tree users.

Thank you,
DelaySystem

