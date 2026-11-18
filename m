Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962713;
	b=MgcrKl/sf0XCRO+cClGkhCNoCy/QahS3VxuNgBbBs0/Q8By/8BwXmxLWJj9yX2f7DlsT
	 SNwyB0lHZYMiKQR1nfQns4oJ3ERrRN1zMwdjXBt7/tZXmAHaWwFmbMzgeaMK0ih/ApxgG
	 wF0Xne8FRJCkZn8aZ0LnPrOU0DruoBPLnyI2xJGe4TBhvMno71mS2abjmLpeBaT6hMtoC
	 kKQki5N8MDuvCrRPPdiXKEpYmM4cV0/eLDa6cNG3Spt84rGJAk5a4MmQiJxqNtbvkA2n9
	 wnk4jW28KodYu7ittMWN58/sjgmJj/5URE1tdLaZYCPDrM2A2U3Cfv/iLqIBoA3IQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962713;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZBVxHAo7/9YleCHtV1mEWSvjrDqDjQfMJqJcB9mj8eE=;
	b=t7/rVrAArOY0rNrKzly706u2IHSUtp1OJCAOuUfVOuF5z5TKv1gnur87tguLNj7kMEQg
	 EboWhnojn/VABxOoA5XViKXZYRrTHnB03Y6gwDLYVLm9S0OR2gE2cHQ5aBVI3FrJ4xKjy
	 NdYn4pz8QFx8jpUZZfTHm8eqYu1DTe+/KiLUoCZsHVJXqabCCXcIKlS/tIGsJAnfdp68C
	 ngQCdXHaUbce4tt5v/x9ix1nnyJbZ19uhDHuaG993ViGS9jMFUx4D+nnt6t9oPpuUiCT1
	 blFia2N/KluvmIroDipkIaDRZQU6OU7WQLj/IL5XUHq73Tg5zTVh6Nyi58lC3e6d75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=dQv4+10O;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E132606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E132606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=dQv4+10O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794962710; x=1795221910;
	bh=ZBVxHAo7/9YleCHtV1mEWSvjrDqDjQfMJqJcB9mj8eE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dQv4+10OV9D9yv9DD+0MKnBfc8enMgLX9yKl18VPvSlmNg1OXtxeLxlFAGaIyL2Z9
	 Apc5SwVVdT4f07c9qmWnxsP7kINwPbYs/BKaEfOUfSuqkcnctHqFLOQb2p0Hxe/GEX
	 wajWuNVQWYobb2ClUNZQt24rM87HcEy0GL0Uk+cHLjxz4AYsXhhTNzOFHhXCesZapj
	 vgEFygONjpgnT7Puoavcy6zYWn2eehyDo6GFvgr4iWTz9qeoBHRYHsUBlpCLEkf3zV
	 JvlobqNLq1tmpAf9KzhdlO/gcn+JOtbt9OkF4E72UN+cK00vC6HU3O+q9wn4bSFZHN
	 ZbQUnwSz08MAQ==
Date: Wed, 18 Nov 2026 00:45:06 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v3] media: intel/ipu6: omit sequence number from EOF debug log
Message-ID: <20261118004459.249226-1-valerii.sokolov@pm.me>
In-Reply-To: <aus0pXClb3bGAV_7@kekkonen.localdomain>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me> <20261103211031.1573726-12-valerii.sokolov@pm.me> <aus0pXClb3bGAV_7@kekkonen.localdomain>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: b22c5d7b61ad67edc652dc26aeaf37451dddb7f6
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When handling IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF in ipu6_isys_isr_one(),
stream->seq[stream->seq_index] is populated with the current sequence
and stream->seq_index is immediately advanced to the next ring buffer
slot.

Subsequently, when IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF arrives, logging
stream->seq[stream->seq_index].sequence reads the next slot in the ring
buffer rather than the slot corresponding to the frame, printing a
stale or zero sequence number. Since the IPU firmware tracks frames by
timestamp rather than sequence number at EOF, omit the unreliable
sequence number from the EOF debug message.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
Changes in v3:
- Omit printing the unreliable sequence number in the EOF debug message
  instead of reading atomic_read(&stream->sequence) - 1 (Sakari Ailus).
- Dropped Antti's Reviewed-by tag due to the change in approach.

Changes in v2:
- Collected Reviewed-by from Antti Laakso.

 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 5d95fb9234..bfe91232d0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -649,9 +649,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
 =09=09ipu6_isys_csi2_eof_event_by_stream(stream);
 =09=09dev_dbg(&adev->auxdev.dev,
-=09=09=09"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
-=09=09=09resp->stream_handle,
-=09=09=09stream->seq[stream->seq_index].sequence, ts);
+=09=09=09"eof: handle %d: timestamp 0x%16.16llx\n",
+=09=09=09resp->stream_handle, ts);
 =09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
 =09=09break;
--=20
2.56.0

