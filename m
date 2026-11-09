Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242063;
	b=Rf69KsqElrtrf+qgJ/J6p6Ye/mIK6RiST/xJqR4kSqL/irWOWdo4/DKbtZW/ylP4k55p
	 AoqAKtwllGnDvuHQouQ9/nvzBJ1cNAOrx24IcPFtrBzJENhHvB9BUOBIYDZvsOpigXnxB
	 XYloI95RWmt31QhVoof/GBOZ54wmzk5YHDVkb5aonCdTgrWZcmdzsjFOW2Z3OAXrcEvzL
	 pFstL/7pQI/eIDzi7EvlI+KImywsgj4dUNNb+Csinw9IyCWhlZTiY8cW2sgwe0NgUZ8SU
	 XLUj884TEkIncjCL0ieQTinFeBfVxv1Bgn5Q+dL11HIpAV9KiDbPQFeUc5rsATN0O0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
	b=fSGvjZFJ+7ZackKS8477TaFy8sfo3tqjMRM/VpjtD2XvcdV/1PNsS/YK+LhO2srcJjEo
	 tYWw6VqGO60GZu9U5cjjCOLPNQJ2AX3jrzyW433/Znf0cwLP/pPwyC4Rk/VKFPFcx4jz2
	 TLMRpB+dEtziREqadyqlCgoOTfIfhpVQIqk2AW+6U7z5zQrB6XwQZkHg5AaOuVJfQvFfe
	 BX/OIho/87R0do/U6kjMZpULU5kBaIDxUofJ6tnXH44VoqcvNd76NaKESVWjlRvGDIzJF
	 pqbIZWVxY+kuMP8yaEIRynFzO0HnlmOiR4uLEeCqBMIMNuZiHdlKTEpziNFRs/TuQUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4mCWU8m;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E1606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4mCWU8m
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso715224f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242062; x=1794846862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=x4mCWU8mmXnl3LLBdoTqcB3RuNv0n1+H3dzghvwZ0PithQOwP0JtmZN+sbHTAnmwbD
         VNYyoNrNGokWVcEyttMwdtkMtrX7u3iPcCgK7xcPcDe5lJm0tykkpv3PointI7HRyGUz
         X+lkA2GtiOc06G6dmKzFhqU63q3Nffl0rI/BNOiZI+0XdvdfwOVhJUP0vZOpNWvsrkM/
         o8UxpS1K39JqluaEulbWKOl0srp2GQltBXBr2TxujujhzFP4+VupVDG2DZ1Gi9w1XeNv
         0xPMkhgxitKIVipgbBAWEHs3Lwuz5ukWryGSlklJZhk3DxXEB+rpAnEtp+PSV91+UBaY
         lFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242062; x=1794846862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=2Ydw8TnXxczHGTfjspzVyMFQD4/mmNlDDcThQw+dHQyudgbt/K0Q/T5BflnZFKoJY7
         Fub5sbVfN0yBlhqm/0lz/NNZGJeqLzIuAixmCQBQz2rW1nd8lrX0/XKMtCVABQeG6hbN
         IHQJJWJpiDBaRBK8bv5Zm+ooBhZhDeOuMRzZ9Ah7kWeYt3lQky0PZtgakzYs/UuRcy+O
         Tg76B2gfNOyZUyRwlgJVXI2e7AVJGnEBmwHCNxyL4Yfj3c7GZXeJ7/V+Efq2xrKhPYsT
         2oARVq+ofNS7zdtH5dXVgz3sqAJr2phKr4aY4I5XEPvX24m+664i8dCdVojLU/Lzu7SQ
         0PYw==
X-Forwarded-Encrypted: i=1; AL+hErG4w5wUnSIOlReVnz74bOa2uJ18Kq10yySwv2xeVvOoWexQIbNVbgdWrNXXvhZlfmrwAHogxOgUD0icqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8V/yWL3rtX6T4RSCVvIYx/HYbvZaeiwgKL3G8tmc2JRHID/2Sj
	AMhhiy+sMmHxP3Uv3uuQPx8JUUOPd3CJffGc+vhExAih7FDQOlksHdg=
X-Gm-Gg: AYBFou2rA1F1kdaZcRbvYxZUINsw+KgKD+47T5hvz+mGyfDyzS0/WOLuoZOM8tNO+RV
	JPJ3GoQzvm0bqVhMBAIqNb33/XfY4RW4aa4S0KkIfW5mwywlmQhFbYAS8MTbt8a0etYFF8HATi2
	p5M9XuilEzTxJLr5UVEbkqXSnwYrJXtRqUYLXOfbi8bodoaqXi3fpjvllJEPcmoU14DnSUk9+s6
	oqqTXSTwNEd9CXefMA8OBOmsWraNN8OoGespAUkM5scBTiHRLIXcgg7W54lv85LVcmFLCBu4+Pp
	DtsQNcaEb754+FwYU6mCpnGGJeNpn/NvNSERYoM1welhup5mGY1llnI5QAwBRy6jVUgoXn0Dm7M
	6kl3KTXJAXGm/xKnjCm/7wvPjkh1IWUcsG1u5/+cmIaaRKRkeGsz5O9a1UlSWdne+MCrr5oKBcP
	6MTfmK2uDJ47+T9meq/VdoDQ0UNtHNhX9iMw3FDxDinLMWgOVp6/UJpQrWaMSdnOLZTiSSHX56d
	ElEPmy+Bqw8WHwI4H3QUyBiZNIobY0C8xF3K/XOl0SpMpFGWuLo0/3kesW2ARHJOUsmAqomUmkn
	COu94t4wszbZmCkMUn97+R1I3EmwQiCq5wJFPJ9yUxI2VZQ+BqCqOCq3zHQ1LxoU2SjswxwPlq/
	ynWSa/bqcCVeknBhvT66kJ/xh+HbhpXynZtTE+o0245wQFXmaNqrdKVHQL4NVEoCOJ4YBEjZhxw
	==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr46827f8f.3.1794242061567;
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597ef6db0sm11269050f8f.59.2026.11.09.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Zagursky <gvozdoder@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:30:02 +0000
Message-ID: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

Since v7.3 the built-in camera of my Dell XPS 16 9640 (Meteor Lake
IPU6, OV02C10 behind the Intel IVSC, plus a Himax HM1092 IR sensor in
ACPI as HIMX1092:00) is no longer found by libcamera. It works with
v7.2.8.

The cause is commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092
IR sensor"). ipu-bridge now adds an async connection for the HM1092,
which has no driver in the kernel, so the IPU6 ISYS notifier never
completes. The OV02C10 binds to the IVSC CSI sub-notifier, and its
sub-device node is only created from the ISYS .complete() callback, so
it never appears. The sensor driver probes and the entity is in the
media graph without a device node, and libcamera skips it:

  ERROR V4L2 v4l2_device.cpp:92 'ov02c10 20-0036': Failed to open V4L2 device '': No such file or directory
  ERROR SimplePipeline simple.cpp:1930 No valid pipeline for sensor 'ov02c10 20-0036', skipping

This is the same problem that commit 7456b40bc992 ("media: i2c: cvs:
Add sensor node in bound callback") fixed for CVS in v7.4-rc1. The
IVSC path still has it.

I can see two possible fixes, and I'm not sure which you would prefer:

- Revert 4fdb0342f05e. The comment above the ipu-bridge sensor table
  says not to add sensors that are not supported, and I found no
  HM1092 driver in mainline or linux-next.
- Do for IVSC what 7456b40bc992 did for CVS. I'll reply to this mail
  with that patch.

The second one only covers sensor nodes. As far as I can tell from
the code (not tested, my sensor has no VCM), a VCM instantiated by
ipu-bridge still gets its node only from .complete(), so with an
HM1092 in the tree a camera with a lens would lose focus control
regardless of IVSC.

Testing, all on CachyOS kernels. Their ipu-bridge and ivsc-csi
modules have the same srcversion as modules built from kernel.org
v7.2.8, and the test modules were built from kernel.org v7.2.8 sources
with clang 23.1.4 (the kernel itself was built with clang 22.1.8) and
loaded unsigned, so the kernel was tainted (E):

- 7.3.1: camera missing as described.
- 7.2.8: camera works.
- 7.2.8 with only the HM1092 entry from 4fdb0342f05e added to
  ipu-bridge: camera missing, same libcamera errors.
- Same, plus the patch applied to ivsc-csi: the sensor gets its
  sub-device node, libcamera lists the camera, PipeWire exposes it,
  and "cam -c1 --capture=10" streams at 30 fps. No kernel warnings.
- 7.2.8 with only the patch applied (no HM1092 entry, so .complete()
  runs after .bound() has already created the node): the sensor has
  exactly one sub-device node and streams at 30 fps. No kernel
  warnings.

I have not booted v7.4-rc2 itself. The patch is against v7.4-rc2 and
builds without warnings with W=1 under GCC and clang.

Hardware: Dell XPS 16 9640, BIOS 1.4.1. libcamera 0.7.2.

#regzbot introduced: 4fdb0342f05e

This report and the patch were prepared with the help of an AI
assistant (Claude); I reviewed them and ran the tests above on my
machine.

Thanks,
Sergey
