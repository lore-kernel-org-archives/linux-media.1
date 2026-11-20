Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218078;
	b=166wgdkiCuhMHIa482++YgpEcecYwrYIJJpeeg1SLtrf6LPorgm4j2AfuYlFMQpVnr4R
	 PtFrZpae2xUvvQ2+gaW2F2b+PgRbfRZNirKkLUVBNXr7eF1CvdVQXy/uWOPm5fY9sk5pt
	 5s9av23hP8eOBDHqbOA/bwKN+bC4/dNUYgAri71LLB/uxZk+ng+mwujBms3aYdfpN3wYN
	 jIb3kcVX6okdGBA5svQvWJeomyuqlfUsbmYkfZ4GnN4AOoni179DqQ1HVHjCuetUpXZZ9
	 RfPmOJxXxK6PZ3jAV7g9PZSqgw6+5uMBbDk3S6Uq7tajShRxuUvkxyyYzashPM1BWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218078;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=oTx65kyCa42G6SI64CZNh6VFuumNKrrKM3+P3eJrU1M=;
	b=wnbRszc2UHc9xUta+rqw8sIdXeJMmB0HdvRk62WV8xjX4otT+2yhgc1cM0kHczn9XfAo
	 3DYfj9u7b69P6NzOZKzVTKlEZREHxLNPAsNL3+2I18U/xGZVWxw2XW8iGQfFaItBUHDAj
	 LQqIzie+0eJQzeaKbk0jh2nA0wiTsK02teTc3vfuccGE2PAj3dwUDFG5pEIjcyWPDoGIQ
	 7Nitt9EBlbgNCasFX055D5HSbI+Nz8l1L1Q6ntF6aOlNEnP7G/TmcjI0CMJZmyvoWKQWV
	 MQW6QGD/VABpuuyDTZJuQneAG0fGocI/r7iZM9YnqCx4If7j3ab7bbeaZfPklsyZ8rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D649606A33F;
	Fri, 20 Nov 2026 23:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D649606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYE8-000000002dn-3NMw;
	Fri, 20 Nov 2026 23:41:08 +0000
Date: Fri, 20 Nov 2026 23:41:00 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] media: rkvdec: Fix the HEVC reference picture set
 handling
Message-ID: <cover.1795217229.git.daniel@makrotopia.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series fixes how the VDPU381 and VDPU383 HEVC back ends of the
rkvdec driver handle the EXT_SPS_ST_RPS and EXT_SPS_LT_RPS controls.
The defects were found while bringing up the VDPU346 of the RK3568,
which uses the VDPU381 back end, on top of Christian Hewitt's VDPU346
series [1], which has since been continued in [2].

Patch 1 looks up the controls after the request was applied instead of
before, which fixes a use-after-free.

Patches 2 and 3 are about jobs which cannot be decoded because the RPS
controls are missing. The VDPU383 back end now completes the request
when it refuses such a job, and the VDPU381 back end refuses the job
as well instead of starting the hardware.

Patch 4 refuses RPS controls with fewer elements than the SPS counts,
and patch 5 limits the size of predicted short-term sets. Both fix out
of bounds accesses which userspace can trigger.

Patch 6 fixes wrong decoding caused by a short-term RPS cache which
only looked at the first set, and patch 7 adds a missing allocation
check.

Patches 1 to 6 carry Cc: stable, like the EXT SPS RPS bounds merged in
v7.3 (f0b9d7e5be06, 796b5c6d4f16, 052c5ed5a1d9).

Tested on a NanoPi R5C (RK3568) with Linux 6.18 and the VDPU346 series
backported: GStreamer fluster JCT-VC-HEVC_V1 stays at 140/147, an FFmpeg
v4l2request build that sets the RPS controls confirms the reads and the
short-term set cache, and the VDPU381 refusal removes a watchdog reset
of the RK3568. The same VDPU381 back end was exercised on a Radxa ROCK
5B (RK3588): H.264, HEVC and VP9 decode through rkvdec with no kernel
message across the fluster runs (HEVC 146/147), a per-patch A/B sweep
and a 30-minute stability run, at the baseline throughput. The VDPU383
back end has no hardware here, the code-only patches have no reproducer,
and nothing was tested on an RK3576.

All of this was done with v1. v2 changes the order of the patches and
the commit messages, the code after the series is the same as in v1,
and the tests were not repeated.

An LLM coding agent did the analysis, and helped with writing the
patches. A second instance, given only the code, reviewed the series,
and has tested and validated it on real hardware independently.

Changes since v1:
- Move "media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets"
  before the check of the control size (5/7 -> 3/7). A control which is
  too short is handled like a missing one, and this way that means a
  refused job in both back ends as soon as the check exists, instead
  of a decode with a stale RPS table on the VDPU381 (Nicolas Dufresne)
- Rename "media: rkvdec: hevc: bound the RPS reads by the control size"
  to "media: rkvdec: hevc: refuse RPS controls shorter than the SPS
  counts" (3/7 -> 4/7)
- Rewrite all commit messages: say what is wrong and what the patch
  achieves, without walking through the code (Nicolas Dufresne)
- State in patch 4 why the size cannot be checked when the control is
  set (Nicolas Dufresne)
- Rebase on linux-next
- No change to the code after the series

v1: https://lore.kernel.org/r/cover.1794645268.git.daniel@makrotopia.org

[1] https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
[2] https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org

Daniel Golle (7):
  media: rkvdec: hevc: apply request controls first
  media: rkvdec: vdpu383: complete refused HEVC requests
  media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
  media: rkvdec: hevc: refuse RPS controls shorter than the SPS counts
  media: rkvdec: hevc: bound predicted short-term RPS sets
  media: rkvdec: hevc: cache every short-term RPS set
  media: rkvdec: hevc: check the RPS scratch allocation

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 52 +++++++++++++------
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 11 +++-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 24 +++++----
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 14 +++--
 4 files changed, 67 insertions(+), 34 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.1
