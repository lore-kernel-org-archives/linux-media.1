Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003155;
	b=BtjvXIEusl8RPFqpTrQyy5Iy7QDautYn6DFAKBZe09XC94j1ajlBiEg8KkoHdaEtMPqw
	 5vNA8k2ETwgb1ilULc9oFJhrxkhql6RzXjNXqF9grc1lm06ro6S32t17rILy6yHP0HZNr
	 apCPZdxrNTd2H5TAXyxbfRrvQQGl4SR+fO3wEc+em9O9pMfK4DAUGcawRSRkUMdyiK3qx
	 Gw8SLcDfbr8+JT4EuLlLHSrDoYw26+dF59dk5ShxUDPf7Fl+UTZ+CFdCj1d2ZayNQWJUj
	 INrl/GDK+jBkBIEY6mdTKDPwFOmhMzCiJlKiBZx9+k8HmsBi92N8smKsFyV3FzZPaRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
	b=twPvhK3B7OxdEXQTRMJwKzRXbNEbngRJ5X6MTLuDM4cb8JKoMgeySVQsz9aVR53twYK0
	 dSE2ArXiu5KR4iTsFEhtCzICqdpk9qvJb9gBaG2zLtK88StYuB6v/7wTE/ms5HMU4lffC
	 Nt4Q7yhWRJJMqKPH1jVMkQ+2pUKW2xj49G4uFIScmcC3mZXv1EDQwxsXAK3YuciApO5uk
	 xeuGoWVUHxhugL0QdNFG7skGPhndL1uscODaWFqe85iF6dyvO/Ix/sP1BWMZAta99pcBA
	 NSh3fUI76D92irrkRbxjjaO+e8MsqzlrfIrVAoFzYHRIbon34/Y438wLil6K8H5e15w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeDkfV1X;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43EF606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeDkfV1X
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23714645e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003153; x=1793607953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
        b=CeDkfV1XfS/6dRaMvzJ864AaRT5CsTHHS5gc/xeNh33mV6z7lrAobckfyemgrFQKK/
         FxrDeQE8cgBFP+Mg21zUJD/qwXJeBTCE2on3OLuBLKxXNY4ux4tgmW3fRiVcur4TLief
         9CsabOFBoS8lrxQTB77bVDSmlgUw+jN0+o9T53xNxBeKWPmaauo7c2wHm3lteHrR5q0a
         6czWLZ1JN/hFs08xV6RUUHGoyf55R7wRstwyI2RvsChABtG6McWDEFpJANG5XGaWuXBW
         eijYlPXYiPQ/r8/OxCducJpQgfcDNQEXIio6hSiwrWjPbonXcgcSXp3VcmYr/ZCV/qem
         U4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003153; x=1793607953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
        b=Eu8iOmazq0lsNMXqF4og6PCoeXlZus91I/CZNhr7wrjNEEEOTB/FaWHzVeb2Ej7wJ+
         Ip3Z2czacOHirk0uiAWmwPkwXJRzYMmNPBwwrk0cVEqXYTz9fuR0claMt3FKWFvHQU9E
         1LuMzqgHYN7iitMTo0G7zJttPw1toi5oHeMvqGfLfYdPiR+hbeSr5piZSoXTB2jdi07+
         lpbLLwXsI/nFC1td5j9tPx9IhVAXYwiOG79Gnekft0OTLuEF2OBndsdVie/unLzSOsU1
         NsFgMFXiYZWUoG0L/SSsOBCXNvgINi10le/ZVRE0A/b3tRi/D10rZm2HNS5w+QMWD8qQ
         UqnQ==
X-Forwarded-Encrypted: i=1; AKwUvByYhRsMfEAxHLTrrPZpE7yI8tvXuar7UpPDkxjVc44UDK8b5U9s8dkUeX7zBYf40dF6MLSX5TtzHCtxQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIeoJcT0s7IcuS9/GdfUNEhFNKZyIHnPyU0ftfOFKG6EyAWwDIP
	ZUOSV3yCdHOPe3/lnBiLNsr7uPILRZWM916aAvQwWklZiMQskz+kx+I=
X-Gm-Gg: AYBFou3Pk0WW+F1Sc5tADdUZ6Nel//FBjvzQrDR20JOKlvw3mSigjF/qbNEFglGRaW8
	IMbpt/PMpyTKgT9vPILbMYWq98t98mq0B3n3z5fAQaA/23cHW0+7Xeia7jjTv9kFhXxatUm4bah
	6NVOgFaWABpiFkAM6ylgC+iNTEV+yVvHvUzvc+YEIJgqJJzKtaqsYaB0O6DSnymybYoQCAuXKjh
	M1W7ngCBmDdv7k/RTI5zASeVHLfdrwVN3hvC5r8oLPYEHehrDmhWQtQ4vdD6ZrWMQ3IVDpAqqVn
	Id6TrG/wg1HEt2MFxnpQ8fXiyroQfxs4fh7A2+eM/ytff/0B2LJS5Yh2WgEwj/4NcHb6TkEor+R
	4YHjkrnXpXvyV9OalwD/FonlW9F4Ht5M6VDv6YHOdf7I+ScwlB+zEEYEh4FQZCITcfcBz9iICdm
	RjyAsG6ILRvQ5J4Euv/5HfygHBrOzt+6CW39orL958NvMEXU6aBQP4rtB+vAeMJkqcEXY2Pkxmj
	qe/XB5pQ6iMjiQhNhPJfr3JNvObv+WCpIOz/dZf3BMxp2WYRhgWnDlCxyaB03eLwNQXs4LfbFFs
	Uoq38DsX3bxK2WvT9QYvW22/F1a20fFe4KSP
X-Received: by 2002:a05:600c:c173:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a35acb9b05mr94608505e9.35.1793003152709;
        Mon, 26 Oct 2026 01:25:52 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm211058215e9.1.2026.10.26.01.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:25:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	fernandorimoli11@gmail.com,
	lsa.uz@pm.me,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Mon, 26 Oct 2026 09:25:47 +0100
Message-ID: <20261026082549.662885-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

v5 fixes a reference counting bug that 2/2 had in v4, and carries
Fernando Rimoli's Tested-by on 1/2.

A correction before anything else: in v4 I wrote that the Surface Pro 7+
was leaving my hands and that the patches were compile-tested only. It
is still here for a few more days, so this version is tested on it.

2/2 as posted in v4 dropped the reference software_node_find_by_name()
takes, on the grounds that the node is never unregistered. That is the
wrong half of the story. software_node_notify() resolves a device's
software node through dev_fwnode(dev)->secondary, which the IPU does not
have yet when device_add() calls it, so it takes no reference;
software_node_notify_remove() does resolve it on the next device_del()
and calls swnode_put(). The reuse path has to hand its reference to that
put.

Measured on the Pro 7+ with a module that reads the kobject reference
count of the INT343E node directly:

  v4 2/2 as posted   4 -> 3 -> 2 -> 1, and the node is gone from
                     /sys/kernel/software_nodes on the fourth
                     remove/rescan cycle. Reproduced twice.
  v5 2/2             4 -> 3 on each PCI remove, back to 4 on each
                     bind, over 16 cycles, children intact.

The decrement happens at the PCI remove, not at the module unload, and
only the IPU node is affected: the sensors' own nodes (INT33BE-4,
INT347A-1, INT347E-5 here) hold steady, since those devices are never
deleted. A remove that follows a failed bind costs nothing, because
there is no secondary fwnode left for software_node_notify_remove() to
resolve.

The series itself, on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19 at
0000:00:05.0, OV5693 + OV8865 + OV7251) running 6.19 with the equivalent
change:

 - without the series, the PCI remove -> modprobe -r -> rescan ->
   modprobe sequence fails exactly as the 2/2 commit message describes,
   with -EEXIST, and the cameras stay dead until a reboot;
 - with it, four cycles complete and all three sensors stream after
   each one.

Two things that cost me time, in case they would cost a reviewer the
same:

 - modprobe -r intel_ipu6_isys intel_ipu6 leaves ipu_bridge resident at
   reference count 0. Without an explicit modprobe -r ipu_bridge the
   module image is never freed and neither failure reproduces.
 - the reuse path logs at dev_dbg(), so it is invisible without
   dyndbg=+p.

The asymmetry underneath this is in drivers/base, not here: a software
node that becomes a device's secondary fwnode after device_add() gets a
swnode_put() at device_del() that no swnode_get() ever matched. I am
accounting for it in the bridge because that is where this series is,
but if it should be balanced in software_node_notify() instead, say so
and I will send that.

Unrelated but worth flagging: Sergey Lebedev's "Add the Surface Pro 11
infrared illuminator" series touches the same two lines 1/2 does
(dev_properties[3] and the "lens-focus" name), so whichever of the two
lands second needs a trivial rebase.

Changes since v4:
 - 2/2: keep the reference from software_node_find_by_name() instead of
   dropping it, and say in the comment what consumes it;
 - 2/2: commit message notes the reference counting;
 - 1/2: Fernando Rimoli's Tested-by (Surface Pro 9);
 - tested on hardware, where v4 was compile-tested only.

Changes since v3:
 - 1/2 and 2/2: commit messages cut down;
 - 1/2: lens_focus moved into struct ipu_property_names and link_freqs
   into struct ipu_sensor;
 - 2/2: reuse-path comment shortened.

v4: https://lore.kernel.org/linux-media/20261010155626.2766298-1-dmanresa@gmail.com/
v3: https://lore.kernel.org/linux-media/20261008132614.2456716-1-dmanresa@gmail.com/

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 34 +++++++++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.43.0

