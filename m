Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC81DFFB
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363832; cv=none; b=nLfCJF8+nDaLYVGVrSowAYAvMs5hWm/geod3LlrRLkgFDGq2rxQ0TtIvNvuk6teCmAbkloNUkNFdZ/WEIKWe8ifMU8gn129mFg40mBUPZQXn7lpYPYsTeBSb4m9DWZf2Oant94oER/cRjBP8Y0m7bs56joJKTXMzXRpkUPjFRXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363832; c=relaxed/simple;
	bh=6ZjKEyBbmPcbe24qPTA+D/2bGCpH25Z30RUGitkCA6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDODRBcVyUI9eEPqusMjvw3n0JH+Hf/am6i0KWwZ9CW4jqTIVBAF/Mmg/JFSFmqlqCly/NbhWBiGWwN0pNWWP/ivGHU+VILPhTaPnPVs3+wo9MgQBTbo4oFTOZzzavI+i5T/IjQqxkPgHeDmpkl5dhLPGJewQyN3CUaqvW7owlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYsLgxpu; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYsLgxpu"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5306abbdccbso12599811cf.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363829; x=1790968629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuvE+f2YVwcbigtaxoSqblfNR1nt2DA6GS6SXj46zY4=;
        b=DYsLgxpugfgwtX4lWFNqmgFozhf24/11rHlYg4+pfRRXIWWal4HnxAfg3RlpFffaqF
         fnRs6DxFO0wgPEozj1TKS3DRCuEeCkpCd8lDnYZHGi83+KRkrAF9r5QYvJ1HTkDE0AI3
         WM+3ZJ3x2BkSOpyisrvO10G2FYTfolKN4Gbe9Uj+0U3GMr5d01nIxpjVyWE2XkwRLzKZ
         pJUgVN88ABtvHYXquAj1tFqmJhlD2JZ9hkG11IrI9v7WhdsthEGIZbPVm8DjXiT3liZU
         N/9v0q+tiPAbAAedpp13rz3dIdQlLZErstDBhr0RVvuwz6ERAwE/Qlia87u5ZpkfF6ai
         4iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363829; x=1790968629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuvE+f2YVwcbigtaxoSqblfNR1nt2DA6GS6SXj46zY4=;
        b=VgH1OC+beeZB9LCYWX5FLPMUH8b7lmSUs9r6V8cjut9GaoVFJpSCefRxpi7JakYC6i
         A6GupOaesEEzBBh+wr6Bqa2SU4Jp5Kj9nYBTuJsJ+g5XH/OBYP0CuepY+wGtBUbDfWMR
         1zdqMhJi8KxgWtxr5B2kv+0OjoIdfgLQ9igqn9GTsr+vBKnHa15vzhcQGNi53ws7K3gj
         2C0GEPTl2SDsovLFqYCMOja/Chca0UGEBehvsfQ/DVVCHINDQfVCaGFC6sv+S0+TuOwv
         UqNh5qfvrYtz19Q2q43OOX4S4zs7FQCaUk7f8VGDI1mwd5qfiC0Ntu/oyAVT2j50gwfv
         AVGg==
X-Forwarded-Encrypted: i=1; AKwUvBwT0Bdnr+Ou8vTVHQFT7aESbfBaPuVVs+iYmNZG4wQbDfnX1s+LCbIYpq5IWpY58aXcd+9NaSX6EAtVYw==@vger.kernel.org
X-Gm-Message-State: AFuF++n1xn/Lvdkn/h6xmt0ADcirL46QZDJzVw71rt9EdKo71d7hjMgo
	E5BWNDb9/o/Wo/T5JksMIQH6BfUh9dc/8NoPjFrGkJXRP4L89RCIn5A=
X-Gm-Gg: AYBFou3luTzQZtMgIfJR5EkZVU3STdOWOO9rkXoLqm5PAsDOG8kjGNm4BAITsVXPvyj
	qrgSsRn+fN0X0L886TlknOL+et33lhfkXwCMCLu6u5MJDh7Ay59YNTaAA/dKwhUv4Zmzm2XG2EO
	2HLOiZ5LLW8qE8Eq6sSRShIKwxnfdpQttOgjvanNcP3ZrNsjTHarAyUkLqYSfup9ZYvMMmxdlEH
	XrDoElFgkDUHkLca2Ifp48wGPjPCkbwBmtiuMfyp05+WtMit3bOUhiuA8x844X6WxbNPRzbgLe0
	qoyxlsL/QArN1uqkw4V2vgoG5Eyr2BjYbJm2794sW11/qJ6/FYdbw5E5hJgKIzlLDmg1sZjaRsh
	J16Mr0uHmdAgO11No1uAsbdFnRAq3BmHL1fyueC/w4cUuyUt22ovCOUpAPXQG5/dd/g8qhLKlF4
	sqGv3MJXJY34vg1y38YYca+gFhD8A5L3MC1+cjlBUea0TSpVLjKry90VfNqOvZ315aKHjtVsSqw
	paugeE99cI6xjf7IyyVtkDV5vGE9ubaO/VKfoIa9Is8cMNeLnmRrNfpOX+Lh+r01nhj+o5z0H/G
	5BRxZ/OpFXHGf2D+hl7bZiyoJTCc
X-Received: by 2002:ac8:5f8f:0:b0:532:9af3:638f with SMTP id d75a77b69052e-5330b6ba05fmr59591321cf.27.1790363829240;
        Fri, 25 Sep 2026 12:17:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm23521776d6.28.2026.09.25.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 0/2] media: amphion: fix VPU core lifetime during teardown
Date: Fri, 25 Sep 2026 15:17:04 -0400
Message-ID: <20260925191706.3144437-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Changes in v4:
- Resend through git send-email after the v3 Gmail submission altered
  diff headers and whitespace in transit. No code changes.

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
