Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366061FF7C5;
	Fri, 26 Jun 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486826; cv=none; b=B5a3iNh2mwQre8F+lT/Vui561mz+d631g2lNxvSkzK0iMkQdXfiZC8jT7+KuV5rCzSDBMZQpSR4tHDWZ4x3L5/SQbM4wSbJIKqU9yVUm/cwdPRj4awoaI/pgtIHAUWcey9mYeEYiilmCBu8R3BU8mg5QK/AJ5fIg04j2H89GMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486826; c=relaxed/simple;
	bh=/ZeCNbT9Q22nqC60XDIjZQywjMX1wtsvaJ+ibxeTJzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dMJOCRXEZAQAG4kmQzFbmVgMWAeHdrQpOsCnDHfAbP3ifCPhaI2YxmSBhIocF/AYjhmePRAVVm2p5PKX5bBfOwinh6mCunTw0BCtV3G1ezvDrbDUAdnRXL1QYKgYdkcjV7MnlmxVr2avVdnTmeX47WYdSLldQtdLYjFKuqQ706w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FZPKW5Zq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FZPKW5Zq"
Received: from [10.1.1.1] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD0A21E6;
	Fri, 26 Jun 2026 17:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782486775;
	bh=/ZeCNbT9Q22nqC60XDIjZQywjMX1wtsvaJ+ibxeTJzM=;
	h=From:Subject:Date:To:Cc:From;
	b=FZPKW5ZqgR7xXBRjd38LNK6EVxvtAGi1IfB4oSsc3CPsMvqTnlfu3XlXoMz39fwTv
	 w+4L4KjRWq3pUmXXC+ih2islKzflHdIBBZAv/2CC3a+cgmyyw/m1QpIboBEJ65vcoA
	 HCHBOfQnjxi0pVtaF3zzW32KHnClM6L6lgxryprc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/6] media: v4l2-isp: Add support for extensible
 statistics
Date: Fri, 26 Jun 2026 17:13:19 +0200
Message-Id: <20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCXPmoC/2WNywrCMBBFf6XM2kgSbRBX/kfpIo+JHdBEMqFUS
 v/dWHDl8hy4567AWAgZrt0KBWdiyqmBPnTgJ5vuKCg0Bi21kb08C1wqJib3QMHVVhZRB+Mweq8
 8Qpu9CkZa9uQwNp6Iay7v/WFWX/uL9f+xWQkpUJl40sZdgg03Cmg5J5dtCUefnzBu2/YBhEYzg
 bcAAAA=
X-Change-ID: 20260504-extensible-stats-f2d6befcc1ce
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=/ZeCNbT9Q22nqC60XDIjZQywjMX1wtsvaJ+ibxeTJzM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqPpccjWua4OuXUsE99PzdVNvpZSoz4HN4paJAf
 c4Ab4SEtnOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj6XHAAKCRByNAaPFqFW
 PE9dD/0elNU1Xw+hClJ+dhBgAVxMdYi+RABqyK62UGfS32mqzlFpPqY2jqErqfub2T55F/czzKM
 HQpQrZ/YTWgEFNKHN9gB76XQaxBUS5qtQ2Mgzmf1Ub9m6VgCdHWbPu+qO/Q6F1QpmA6kZflh2Zu
 EOyL4IpHX442XjaEnqjT4kCnuRZbZdFxc74scrZ96ZBWZgZk+Px66xETiz+5mtDtHJzNFIGDdUw
 XGeG7qiB4v1FVwQYKOtWf3SVzPKYC6dwVaHP0AKpOd6P6wgQExyalXGUUs96xkQ4uX/0mvfZTHd
 BYSfNn/N/MI9Em0crcHg73NGa+R07hG0xNAzCIvtzkM3PUa/TiGjBrYj3dZOH7ee7WGFr1e3jA4
 X5qhCZ82Tmm9v61IxrvZ6F8skRCdSBcjhp/IYYlOm5Pz920BhxPki830/4juZC3Vq6pVH4KZJLC
 rFDK4mLY0v+AGgtgHBUfUTX5V2e6tL8w3619q2yS9N9BKLhwdwPLzqQDHG6jRXeZmRXvs2hX5Tx
 PZyOLTYZLPLcBJq44BhJfe1PJaiPvlt0oPsewybSXRg5fyQG6/UO03ba4rjMHORwNH4vFnBSTT0
 3gcRsnNMIVgVe9MUmp5KciKWL8KlZvZwcsNgOH9zjCvwnhqfaWPaEoUEu5SSePmxHG1f0nIdRJC
 ZvlZw4CkUUkBZyQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

This series breaks out from Antonie's
https://patchwork.linuxtv.org/project/linux-media/list/?series=24043
the extensible stats support and adds a few more patches on top to:

- add support for per-block validation as suggested during the review of
  Ricardo's
  https://patchwork.linuxtv.org/project/linux-media/patch/20260504-smatch-7-1-v3-6-fda125c30058@chromium.org/

- add two helper functions to v4l2-isp to ease handling of extensible
  statistics for drivers. An early user, based on a preliminary version
  of the patches is available here as a reference:
  https://patchwork.linuxtv.org/project/linux-media/list/?series=24703

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v2:
- Collect tags
- Link to v1: https://lore.kernel.org/r/20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com

---
Antoine Bouyer (2):
      media: uapi: v4l2-isp: Add extensible statistics
      media: Documentation: uapi: Update V4L2 ISP for extensible stats

Jacopo Mondi (4):
      media: v4l2-isp: Rename v4l2_isp_params_buffer_size
      media: v4l2-isp: Add per-block validation callback
      media: amlogic-c3: Implement per-block validation
      media: v4l2-isp: Add helpers for stats buffer

 Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
 drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
 include/media/v4l2-isp.h                           |  94 +++++++++++++---
 include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++++--------
 6 files changed, 294 insertions(+), 80 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260504-extensible-stats-f2d6befcc1ce

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

