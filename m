Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059122C237C
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291621; cv=none; b=GvfL1r2/T8Sj2lhM36cwjsywy3IJ9+8YNk+Fib0WPVp9hmZqz34eKyxgFRW0nqnpytD5dzlniPfCJUZr3G17VHGIg2C/5qpvm9ULLjfVZb3Q/8qysTxZqkvkKgxg++kSoZFNMHZ8l06fKdK93VPEFcBsdOZISBHIMGYjwpkeRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291621; c=relaxed/simple;
	bh=L/rz686i3x+RUZOvwJlGil8/fc8KWkc+EpZkgvybyLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aopz6uLJk8//ah6DfFBoik7XzOo+zjGcESponajcGMTy10unztVLIa5j7uTNCTKhbVTPjdLTZxRKZHjKX/xyhvJpkLMnovnxaAW5frb1HT3wOeLMoYIywfHQ6RSq1kXiOhK4ZXhfvCw4b7kLif3fCwLo/Qq+RNE/w2De2QEEtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzQqAC2g; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzQqAC2g"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53634b8328eso9032981cf.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792291618; x=1792896418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgrg8W6lnkrXwWeLJ4XV9VoZQLYHNzAPN0f6A3bXfzc=;
        b=QzQqAC2ghDvfgnioeHY+Pw3cnTvcYm4Y2H81llUUkEaQ1SZXMZSwf4dtPXSEhH0CvC
         KS7mD4uy+OqADPs3+SCHqOp/rz5nJPn/RukBqm2uPLRxjmE3x0FDsB+cvtBLp1AugiMM
         3rfNVlj85BraKhX1SznppT2Z+huCf+uN9fEGDs0YUJf+XFjte4HLosSvP/PW+WhV8QoW
         9A/1x14uFqQjCmOLxBruHyjLg51UDnEI47unJpAbS+KADPILJXyJge5cgXy2N+dkboXm
         v46JVVa0DOZYvQKvmat9Tw+uRU1IpGBYyzOfFCyCN528r8LkFrkcN8hdkVbyMhjVhrQW
         hivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291618; x=1792896418;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgrg8W6lnkrXwWeLJ4XV9VoZQLYHNzAPN0f6A3bXfzc=;
        b=Ku7rVYlgJYVL4lcNplWbVYYGDwsVT1zSBbPkW/5sqVLac+kxKIOexQp3QUXcHI0gBm
         LGdQ4d1VnyzInuCxnJz7szuBSz9d6M7MEvkNGkw3nm9DnOcZ7lcdplP5+MZ46sUG7BI8
         3Ly5wYxvdShJ7+2Z0YuSxBnUcGMBmofXGzNG13ktUnMNJfvDx7U5QwPD/mcHAp0+BSaf
         874LZXgYI88Dyxf7IJEymQtOVoscYGJ5EwHDqGKNeA9CmhdxoXAI5oeIAL1iZOnoX6U8
         QaSI2LTCpm28zz94RQ2HFZkgbiHFez62XaS8TdQr/5U5lOPaoGjlroEJAm8zstSre2QM
         VeQw==
X-Gm-Message-State: AFq9FYIqfke64kgTAnXZzGb6iKa11n1U9MECLiYOm0SlBD3vYJs0Bvy8
	QJymjImJhLPpMnSTtMo2GBS+Hh/kv+bpdTyWI/g1nvjPaU6+OZAgLtQ=
X-Gm-Gg: AYBFou3L17dtnLPZjrvvf/B0N6vsUurq6JyqKOtNr8AkV7mdpU+FCL24MRHD/BpFthE
	xjX4zzk1b+73kkfn1veIOD/1ObUTJRrm0KYX2dT+lVCIWtwHfiL6U+UmQF4Nl4QPu6p0o58g+Wv
	dlSTqSiNXJzX8XbHhHcn1kaYqjmI1G28aiz8TWgF/ShekV2/F2ynjVCRv4dM4HqBSrc8oev7VLa
	dhtT/TbIF8przR3xKRZ29+g2yVrjGIi2Qd5GiHCOSu3GI4a0HBvK9RwswyVrifZkTzuMrDrhpKh
	eSPMBbWkaqwzp8AVYd4gBzAKm2IUf4GcoxMn/hHBzAGGivC/zxvz2qp2lfK6oYhUx8inIdO7pfD
	90aVv9WUcFRAV9S8XdDTQGSt+bkBik2an170u4rkijbI2B9b9rvbpf3O8M4M1IxDtmV5sVr0wle
	36E2jTKl0yXKF4VwIZRbDJrIfOv8+9vnDI20C/xV83AcIAbNWRDbhx0/0g82Z7kX5WDZPZiGXBR
	0ntt6kBOUf3kdXJ6oG9xPt9eVhLP+VfnY/crBEl/wR1YV9PovHWdg3MBmlUsSFY8PC0YZHLKC+2
	X/E5AfCU7Gx7qAD1EsY6bKjh6qkW
X-Received: by 2002:ac8:7f06:0:b0:535:f9db:4567 with SMTP id d75a77b69052e-53646103232mr63060221cf.64.1792291617890;
        Sat, 17 Oct 2026 19:46:57 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62019456d6.10.2026.10.17.19.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:46:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 0/2] media: rcar-isp: fix core registration and IRQ lifetime
Date: Sat, 17 Oct 2026 22:46:52 -0400
Message-ID: <20261018024654.3913088-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ISP core IRQ is registered before the RPPX1 object and interrupt
handler state are initialized. On removal, it remains registered until
after RPPX1 has been freed. A handler can therefore access RPPX1 outside
its lifetime.

Patch 1 prepares the return-value handling for the later IRQ request in
patch 2. It converts registration-stage -ENODEV to -ENXIO after cleanup,
so the parent does not mistake that failure for an absent optional core.
As requested by Niklas, the caller uses only the return value and does
not inspect core->base. Resource-setup results and the existing
channel-selector fallback behavior remain unchanged.

Patch 2 requests the IRQ after its dependencies are initialized and
releases it before destroying RPPX1. Its code is unchanged from v2.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

Changes in v3:
- Replace the caller's core->base check with -ENODEV to -ENXIO translation
  at the registration error exit in risp_core_probe().
- Keep resource-setup return values and fallback behavior unchanged.
- Describe patch 1 as a prerequisite for patch 2, without assuming that
  the existing V4L2 registration helpers return -ENODEV.
- Keep the IRQ lifetime fix in patch 2 unchanged.

Changes in v2:
- Split the error-handling change into patch 1.
- Explain the RPPX1 allocation, free and pre-lock IRQ accesses in patch 2.

v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.com
v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Myeonghun Pak (2):
  media: rcar-isp: distinguish absent cores from registration failures
  media: rcar-isp: release the core interrupt before destroying RPPX1

 drivers/media/platform/renesas/rcar-isp/core.c      | 16 +++++++++++-----
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
