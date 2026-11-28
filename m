Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880121;
	b=PokQmjgZ0vJCdYhUae3eJln0I7VDfLupxcOIYRI85Sl1ilFPeUzlDto8/kHJLrRyfSkR
	 uo7vKQb4DEIO+0v40kDDeb6DVQhhzqq17fV/ieHv+FVe+hc3LoRdmNfrwSp0nrcRS+pvS
	 fIzn3EIubbIq0dyD5jfwC0ZTkcHc2mZqLTMT8CM1Sz51dHcl0xKJCwXSDFdtzbWm/0LIO
	 ko4iJ7NbTQ2ELWuZKbL6ud2TOJgSfN7pLg+0S0pyXyo29MnnUpmtbShXOjuPQbcYu+TNH
	 ychqxROmOiF9xgiZz/SZwTCN19xZ/d6Ws3X7Vi+UzEfDbEyKIVpdNy9vFMoZjt+Huuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
	b=eaBNqLTC6tO9N7AwBS/9A9JET42hYFc3cLg4kyE9UFGZLe1DIV5RFiD6a+UejDkDgfbG
	 yZm/dvdDgdRAzwLFYgWTuo/EHlMMmeFnS2VT0+rqB6jIyAU99oXY8b3x/Bmxtt8SNVkTo
	 i/A4NEHIklXixne/ZemobCEpJooiDtqUq68b4IbnR6tb5Hy673gAKtLEzyCMV2bZbZU0P
	 QdvniztGtRv535Gax9aFQhrmraWzMU7kL7i8EFc/3uWm3P7bqLADRDpB7t2AloBs2zGos
	 sPFHL/xtSvow23XAfzBazsju06Qmd0mPgle6ryfx1CrDK1Kt39FYjsh1Hcs7fWFaFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSzKkzeO;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7C606A321
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 15:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC7C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSzKkzeO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so59834485e9.0
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880119; x=1796484919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=eSzKkzeO9z6ZPH/q5qorpyPTPn4WuZHmBVaecx4fZ133hEzbLQ8hzhw3e+1cL/jHV+
         b+aFf8/emiwyCttfw51l2cD36l6NcLK0RSxp7Lw5eNH4WkykPrjhQT+m8PjCa4hZx792
         IyddtYl4UjOKQBkzIcZERVJ4Fo5IB1dXbEV68i/2btl+IDS9LIRINnDNybb2qozYgriv
         fNKkKI21G2bgO5GsUBOMPjsvd56e5C/veidLUojEF615Rm2RugrIfnmEO/2h0osWG3zZ
         2U3BGO58ec1Uz1Wi+hwDr4NpFWkXwttBNOM+0YMzWrDxAxE8ZtDiNDUrpTyj5bv1Evz4
         gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880119; x=1796484919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gzKBHAENFoQ+wCxaZUD5NGLvIPO/pOAHR4djcvLRmA=;
        b=yDmY7y5ejfjAdLRnosOOzDRSWksiLKqLUYuD/Dg77o69YTSVOWc8c3LFhfn0LtMtZ3
         acbvRciKghIxU9CCyiirw4wu0IzCdCCmmNP4pnSr+LC5cKTv0p3mVrCPCwH3Q+0O2gUm
         RuG01SQXG5sC+3eL3PKnOip7G9dk1CpZ5o40dMWyGfaYw2fR5GQddUcLjas8dm2mvifP
         ExAgsHGla1E576uTycnnYf7u5RxO4HWSzYwl1wZqM1HM0CtDs7P6VsU90cGW+TXPvyiz
         VUWYazFysioCt3X19kfXjJYGLDzpV+RkEv3UUDzluDMAjnq+CN7UCrAuXCm3394VtaXq
         e4ug==
X-Forwarded-Encrypted: i=1; AL+hErG26XlsaTZVC5Dnp+QjGWgnwaOAMI9OaGuOEI0myr4EeGCvUXhiV6cA1OsJs1ISAc/wJvmbjlv3rSrZHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3fmOBa0zH/I7VmKuU+4yfOtdUzbM7LG7HgfBcfaNl3/70tzia
	qoWWSmnwBXJopomnKXltf/wSZO2ET6UMDyoazuGLOzfOys+b5Y+ijOn2
X-Gm-Gg: AZFdTZeSMcvQZEoXXWrdUvMUf+UglzJg8LZqrg8OzeCHYsqEQnko0u7j6M3+UzwRKZg
	Ob232jl/1bBQQYTZJAu9kKWgLhcnNziFjp09/m2XbNOIKp+EyNodJSZSoxQHy/2ZNDwdhJcdhbj
	UX6xEXpU9WhRWERCblMNGg5UbBLf7Sxhc+Zfjl029+I3JwFcgN4mg9mYSkiPcgOCHjpkQ4oA7/6
	m8Fumghf+bCM9azcmKgdly0UJFpAuu1AWjDX2IO+s1bzIhS7WFWZh1o9z6iBoHKhMKiQXYYVQKl
	vASlaiC09T93I3tXjkAQLIXJqpU8LobRz+7cjl20Vu0ptik7KbgJhZzS7fJYmpbcleQund0Vd52
	0QnCvqwyqZa4PDKjchS/2Jw62JEhTDWhr57ZQD+nOR8e3u39Jb8O41E7kkW1I/N21q58qvJVKGt
	DsjoQY4LoPA/AxcY6BYUTml26dpUTjsVOGsQ72ZF2EaHyOi8uC+wLrp9u5Ju/UHaZ3PqPFHkKrZ
	h11DdklseLCd89rsFooZz3WW/I8wAOwSRyeMwdlUl4Qan9iUVuEwFH6m9w7IdpbhPyBuPKtKjEh
	YIK/o+sqAJ1cmvwne/B+DI3J52t5HvdqCeEqCvd2
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr556620835e9.24.1795880119211;
        Sat, 28 Nov 2026 07:35:19 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:18 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/4] ARM: tegra: Fix warm restarts on Tegra20
Date: Sat, 28 Nov 2026 16:34:56 +0100
Message-Id: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBAF0KtM/ppJ2oqE9CrGBdSpDAsgnWJMC
 Hc36vJt3gGTomKIdKDIS03XBZF8Q0jTsDyF9YFICC503oeea3Bsa65cxKRyHlx/SW5sr9KiIWx
 Fsr5/4e3+t+3jLKl+F5znB7VTWRZyAAAA
X-Change-ID: 20261128-t20-soft-reset-fa083c0b45e4
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=dU0F1WkbTG8tFNzFBXxX/HgRAHkTJjQlSwyPPAIbYfM=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl/UBP2p+Kpy3rF/9YXNZ3e8iixmz5b98nOivaGb/b
 5JvR9jejlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRD/aMDLs+LZzxss7hRKui
 3pyuTSq9LS3/3ynsOPfPWHdJtlVgwFpGhmt7Ty4T0W3/9cbL2pVdJNx1m9NZo10d5yd0PYhasMB
 xIwMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On Tegra20 boards with a TPS6586x PMIC, every restart is a cold restart:
the PMIC restart handler has a higher priority than the PMC one and
power cycles the whole board, regardless of the configured reboot mode.
That includes RAM, which makes pstore unreliable, and was the main
motivation for this series. Testing has also shown that warm reboots
are more reliable on my TF101: on cold reboots the board tends to just
power off, which breaks automated kernel build/deploy/reboot loops,
while with warm reboots (and the latest U-Boot) I haven't observed any
boot issues.

This series does three things:
- it fixes warm reboots on boards with a TPS6586x,
- it registers the PMC restart handler much earlier, so that kernel
  panics that happen before the regulator driver is brought up are able
  to reset the board,
- it improves the old workaround for the boot ROM hanging on a warm
  reset, which now also covers emergency restarts. Without it, boards
  that don't have a PMIC restart handler, and therefore reset through
  the PMC, hang if the restart was triggered by a panic.

Patches were created with help of Claude. I've tested them on ASUS
TF101.

---
Patch 4 is a cleanup of the old workaround, requires patch 3.

To: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Artur Kowalski (4):
      mfd: tps6586x: Leave warm and soft restarts to other handlers
      soc/tegra: pmc: Register restart handler from early init on ARM
      soc/tegra: pmc: Power up VDE partition before restarting Tegra20
      media: tegra-vde: Drop warm restart workaround

 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +------
 drivers/mfd/tps6586x.c                        |  3 +
 drivers/soc/tegra/pmc.c                       | 99 ++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 40 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261128-t20-soft-reset-fa083c0b45e4

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

