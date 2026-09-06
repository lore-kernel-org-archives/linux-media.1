Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5838330E
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 07:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680380; cv=none; b=q1Js3P2vQ56/qWI94torG8XxSnVsnQpcaFD8mNZcK9iO4ADKdBvg9pD3648rpKMkYO7LXrRCOyauMst2QJvyfI6liRgXJ7QemRXNwUfbt/BHk1aehu4IZJ46+4qC0H3rv4ep1itAKqq3CyKx0PW/PfXz7iyubFSOs9I7koyaPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680380; c=relaxed/simple;
	bh=QRYVX3ffZ985ovzTkfBf9fkBgICaOYuci40qCtccwWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OD7NCw+shV/9Wjg/vWMG9/C+RSW0EqE5j5WtzFKit7aZBFXIpJ3KFAweU85+1a69VraXAGGIVZpC1/jtkVViqrK0+0C5ftG3l/V/DzIVT0XNYJlJKjKQPvpcSyyCiWeY56KvgJApyMdOAkV5M2MMkK9+0VUUdIAQ9eTwMUPmKDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY9VlG7f; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY9VlG7f"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1351230f8f.1
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680375; x=1789285175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVz5vFNXr4Sxa8HEvEEyMn/a+N7kN8guffUolshGPm0=;
        b=sY9VlG7fPEYM6od1qeC/hbfOH8nWesDdNG2Dz6NV3f00gN0bgKwngGcF5VhIpsGdQ1
         E71fWmZODcYq20jaEFbhnU01qXFQeS4FFhxiVIuyFFUMwjcd2n69m08OHIxzQ/CXv3XF
         YZM7aDIQgDFerKU+GRu0hsAC8g2tA2cy9yEUSxRVr3603NBmIoPZjLlDHNlNzYxIC5Ke
         7LcUQG6h8Aaof+anCUVJ66REkH8K/EqXUoDURkwNo178Ou9JHWVlNaOfhbsSrqTWEJMt
         d1y6StbkzGKWFQALrZ8YkpNsjk7hJYqdjOXU6Pzf/bJZsNr+Z7xkK12SNwNeIJoss/+f
         FO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680375; x=1789285175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVz5vFNXr4Sxa8HEvEEyMn/a+N7kN8guffUolshGPm0=;
        b=V9TW1o6Vj7+4dt6LRNbxZHSzrIUTaX5O5SeJbBMF6f+FEPweSC8POSYhCoT6Cm7NQJ
         WRUqZ4K/i65L7SR8t11Ej3bXe/YPpYp8Ffo2sLTzcZEKT4NwQRI1utz2YnlbwSb+yt2Z
         i8g3xWSTCV0GQZ5qZn8CnfFrA0j2P2jiNJc9QUrWQ+PuCi9V4fxJme7VMka7koYV4MoZ
         NKKlXjVUuZmFQhZzRdyHb/GYfX0VqS/8C26xHc5KDrK6d3Twa/2H106aQgkXtILZ1zwk
         i08UUcc1NWZMGzShTRlNcWhWAk5q3nTM2ZZEj+qmDUaRR0wEvmp0cOEUJ2lnZPeG/FxS
         DuXw==
X-Forwarded-Encrypted: i=1; AKwUvBwZFSzwPdDgXuajKQ4Ojoz27uC7mUykYl4NJMW+zlkE400T37WeBRc5ipzoYU77/0oj5Lx6Q1N0DudAIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mCNUzX5ynY9YOTnKbWJAPBCALYPBaegPXPG6jW4seItF6/Fgbt
	YX9OrgN5+64fc9vKEW13H03UoBw7wQVH3Mx+YHzmWG6eH5c59pxPLEQ=
X-Gm-Gg: AYBFou13FxG/t0iTKWNxoFNQAYjzDjk25sttaHHcQZWfWiaIYo9Q+y8YATItuqGa9BP
	YaKvMaeaeDaT3q53cGwsyL2JUsAEgQ+sS3MB6aEZX5n3pH6TyAd0tutiF6uYw2Y0VZNlZwGuJ5T
	yJG7xce+nLZZaUI9RCi+Noxz01TF3Mkyv0kMYmVuFrSpirJzSPNLpVuwgIDykSOUxEUif7lRG0s
	YqgCbkWCWzvcV3c23blA2eGVtKm5bHy50lfV5ulnvomjI2FAlMNI+j6YwOoxfsJa+dU6pZzOuQE
	A45myXVDLNZGkJCrcd5qQAZeUGl9oVQaFj4YnkGy5jClSzNX3Fn86oK9jhBFTlAZNKG1eB8KJJS
	fBcIzLYOVMkjFKRLaz/UU4dsGfTyi5bK2kT6rnNPGqLhGZd98mrhDxjsh4+eGCfu8XC9pF02qtd
	jzbWoa9R8Aud3NcaqBiS2oj99kWaCmtvO2ML/TKYVjNYVUak9cfOVZ9pFzaszMGV6d24q1mviiy
	W3yQH0Ji1lipTNu0n7pyLmM9NGyhjtQ14xqy1N854YO
X-Received: by 2002:a05:6000:2508:b0:485:8e8b:7bf4 with SMTP id ffacd0b85a97d-4858e8b7c78mr12129584f8f.33.1788680374997;
        Sun, 06 Sep 2026 00:39:34 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm19580358f8f.14.2026.09.06.00.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:39:34 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Sun,  6 Sep 2026 09:39:32 +0200
Message-ID: <20260906073932.24090-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026, Fernando Rimoli wrote:
> This series enables the OV5693 front camera on IPU6 Surface devices

For patches 4-7:

Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 TGL 8086:9a19, INT33BE; 4-7 backported to a 6.19 linux-surface tree

Coverage that was still missing from the other reports, all on the same
machine and boot:

- With the downstream unconditional 0x4800 = 0x2d write removed and only
  your gate in place, MIPI_CTRL00 reads 0x20 over i2c mid-stream (bit 5
  only), so the result below is your code path and nothing else.

- The sensor's 2x2 binned 1296x972 readout (a downstream mode, not in
  mainline) streams through the IPU6 hardware ISP (PSYS) at ~28.7 fps: three
  fresh stream starts x 60 frames, all frames unique and non-black, Bayer
  phase unchanged. A raw binned capture straight off the ISYS node had zero
  CSI-2 errors.

- The CSI-2 receiver error signature at stream start/stop (the usual
  "Transfer FIFO overflow" / "Inter-frame packet discarded" bursts) is
  identical to the 0x2d build over the same five capture cycles: 15/15/20 in
  both. Consistent with Fil's sweep - bits 0, 2 and 3 of 0x2d were doing
  nothing.

- Exercised on top of my ipu-bridge rebind series, with the
  "clock-noncontinuous" property name routed through ipu_property_names as
  suggested in my reply to 7/7: PCI remove -> module unload -> rescan ->
  reload re-enumerates all three sensors without -EEXIST and captures
  afterwards. The IR (OV7251) and rear (OV8865) cameras are unaffected before
  and after.

Backport notes, in case they help anyone else on 6.19: 2/7 and the table
hunks of 7/7 need hand placement (no OVTI5675/HIMX1092 entries there), and
5/7 changes the ipu_bridge_init()/ipu_bridge_parse_ssdb() CRCs, so
intel-ipu6 has to be rebuilt alongside ipu-bridge under MODVERSIONS; isys
and psys only import ipu_bridge_instantiate_vcm and are fine.

D. Manresa <dmanresa@gmail.com>
