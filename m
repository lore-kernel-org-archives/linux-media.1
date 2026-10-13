Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60321D8E01
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791852654; cv=none; b=hPpksqeiovD05K1lj4c8EWomQVl3dkaU8yKChE1EeZ2H8oiv0oxiM7jYEb6AJuoM+PPabuq170Bj/vylc53F3EGKCGIqAS8Ks0MgTXM5GNp2TzEoJSNSEXTlZFeQfjTDeFMZEO6MctlT4nQQPexmHEqxrlH2+I4DygTnFZXLft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791852654; c=relaxed/simple;
	bh=7W28zXbAc258OscpulaQd9eVgbJEA5Vs10RJkU26jko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byx76lm6wg+NwYaeD8WPmkCEhmnjtFyIxPtvjtwNuUjy3RiBpNV3KnVi49d8VViSkAiMI/DFNck/EMLvvPGeFDeavbiEoYiP4Lmg+3oV4ZYzJWQmydjgaGAqtC45YZGdIhJb4a8X2gYlnLBablFRNWZaPVxaCnlplutjCJIPbAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=je0XxEVu; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="je0XxEVu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91054f537ccso29212336d6.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 17:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791852651; x=1792457451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06iyY89s7tmiZ8wG9TyA9bzi9/KFey6XFgp9yIv8oXE=;
        b=je0XxEVutnRNhcTTovnB5BYs3hwL8hTDTBpamYvYm74eACOKI5GikQnMrrotvda4Mh
         gNVONC5PVIn2QLjgPeF810EEVG/boJqclX+aiR1zOsVQgQ61KNJZhn6sl5BD664ZB1Bn
         DkVOQBp8UdyDk/bujkJiJBB90o0i5MQhvB2NJbR4h5QEIK9LcGxWc411UHSmMP/GChIc
         LGLqVFpMTME4Mgh4+uZCWrpO8JMG17VIBQ9aYgN+7unFO+mRfUc6bS/rLQFJWvEP1WjI
         p18D+AETMd4+MsoSvBE850qSTP/xy3iMIfc7Y2Qco2eHxNQX07Q2ZjTvvPZIgzv/P5aU
         nu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791852651; x=1792457451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06iyY89s7tmiZ8wG9TyA9bzi9/KFey6XFgp9yIv8oXE=;
        b=zVWMcpQAKKSZidTxVsOMdq4bZKHWg3c39Y8ffMrENqZEigIryV2YQ6UA8TenGb97s0
         51OITOcAkPkimferf58dCn1ecQ3XANPZVpg/MkcvSgkSGUOoNZib9KuWAPDDeROtCPo0
         Ct4axzEpm13MSiBQCGKeOb8AGbe1DIjWk/k+qJJ24E1EL2FKdfg3/kttZMH2wTzKXZJW
         EfkvOj7kwlFyynz32qYGbBvHmA7V0IB/8uOh1RGq+It1GHF/yB/D3LZYgjepgELTQz72
         CxEKqv2qYxaG4DvVFCH3ETy+qsrLG5nOp82yIBDQiDSvuJIQqv2AbUhZaIlqCaf43w2V
         7uBg==
X-Forwarded-Encrypted: i=1; AKwUvByYNfTR4vrfl/4lM/HnxGdHEaDb530gIKhES1hOQ2NaOSrZjU5BsEIsGFUGD64fcFb5QLGoIMkEA3PCiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLt8nKEVUPI919EqiVNkRlxhjapw7gP80Xn6dwXYiSBCMGPNTvE
	3qRlL70KOU53T92DPpbTdC/JQRnBnLvnKqUUSe4rFw4BoFbpLJ3XCDXZaZoVYT1Mhdc=
X-Gm-Gg: AYBFou3nMMsfpDrj7ubpgQ2E9FWS9HD82dS7ZLKp24V02MHIU6i3fzxpKabik657KM+
	xNNTew8ukRBII9lngQENUyNQPdRubMAW9d8bLS7XwJAiIMleSgt0NYHHGKbqGqaTP3A9ixHQrgQ
	lALSgaNf7R3f7P3kDi99BTKhQNvm0OLjyUWmYHA5m64K1zS+6U5BsqTOZ22Z2yRy8hkM0UDb2P7
	PQGveG1hBf8s4LJ3w4KyIzGOR/9zEMkMV+A2IQdWFkomJYqX1C4ny7PIdoSrqusD4p9qbSNyATC
	vCZbBlWbXr5GXiWwrwdqZlHCm9D/onH1k8CxKksfMpJBBIJTSDNR8iY3zNVgGCBypEFOZmsWnIL
	KXudUStXofeWM3a3tgpV93k0fGx4wstsUBo9OCuy+Lz/shQpEwkhWiQ/+vENyVy95XfNDlXTxnM
	33yCoxGoa482mhFpr5KAjd7JnTj6uQmHdJ2frK3kZg9q4t9TxFMAHAh2Y69oxbw0B1YZ7JuD4mf
	wO3+L5RiCvdELWdbyfR0x9byIVDPbvdpgU0JkPH6hkAuRWcZ/ZFhMUDM5DXb++9/YvWt8mAFyRw
	yYoQ26wA3go58RykkuZbre99SzZ5bG/jqjQl2Z7L80YtcpTATrh9
X-Received: by 2002:a05:6214:f09:b0:919:518f:3a92 with SMTP id 6a1803df08f44-91b5549984bmr185414706d6.17.1791852650672;
        Mon, 12 Oct 2026 17:50:50 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9ee98365sm704226d6.48.2026.10.12.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:50:50 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ramshouriesh R <rshouriesh@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] media: ipu6: Don't require an ISYS reset after stream stop on IPU7
Date: Mon, 12 Oct 2026 20:50:48 -0400
Message-ID: <20261013005048.8601-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IPU7 every stream stop finds buffers on the active list in
return_buffers(), so need_reset is set and this is logged each time:

  intel_ipu6_isys.isys intel_ipu6.isys.40: buffer list not empty, needs isys reset

It reproduces on Panther Lake (IPU 7.5) with a plain capture and no PSYS
involved:

  v4l2-ctl -d /dev/video16 --stream-mmap --stream-count=10

The frames themselves are fine. With a single camera the flag is cleared
again right away, because the ISYS runtime suspends after the stream
stops. When something keeps the ISYS powered, such as a second sensor in
use or its PSYS child device, the flag stays set and every later open of
any capture node fails with -EIO:

  intel_ipu6_isys.isys intel_ipu6.isys.40: isys power cycle required

The staging ipu7 driver has the same loop over the active list in
return_buffers() but no need_reset. The IPU7 firmware apparently does
not hand the queued buffers back on stop, so leftover buffers are the
normal case there. Skip need_reset for IPU7.

Tested on a Dell XPS 16 DA16260 with an OV08X40 and an HM1092: repeated
start and stop of both sensors, alternating, with the PSYS in use for
the OV08X40. No reset message and no failed open.

Fixes: 3c2f7033a924 ("media: ipu6: Warn if the active list isn't empty when returning buffers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---

RFC because I am guessing at the firmware behaviour from what the staging
driver does. If the buffers are supposed to come back on stop on IPU7 as
well, then the bug is elsewhere and this only hides it. Based on
media-committers next d7e7bca71698.

This came out of retesting the HM1092 on the ipu6 driver, as you asked in
the other thread. The sensor itself works properly there: v6 plus my ACPI
patch binds on CSI-2 port 2 and streams Y10 648x368 at link frequency
180480000, and IR face authentication works on the frames. No ipu7 format
patch is needed. One thing for Ramshouriesh: v6 no longer builds on
media/next, set_fmt and get_selection need the new client_info argument.
I will send v2 of the ACPI patch with these results.

 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 23d00e1..4a5f518 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -463,6 +463,13 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 
 	spin_unlock_irqrestore(&aq->lock, flags);
 
+	/*
+	 * On IPU7 the buffers still queued to the firmware are left on the
+	 * active list by every stream stop. That is not an error there.
+	 */
+	if (IS_IPU7(av->isys->adev->isp))
+		need_reset = false;
+
 	if (need_reset) {
 		mutex_lock(&av->isys->mutex);
 		av->isys->need_reset = true;
-- 
2.56.0

