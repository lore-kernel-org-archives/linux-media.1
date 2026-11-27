Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811424;
	b=xIoddAf1Y4GLwPcpDwNZzTmPngUZPiXcpajrhCzJVq5pNszdpz9BOiwY04hziZQZEgXl
	 kfUpyjHlGZBm2xCLAbzsvrZ+n/fEE68319M15Yb5q2oJevuVWRmdC25GVXNcoaLaQCOIa
	 sXOccK0lPA+b/mpznYxEXYMUnRwHdaefIaKTWvZreq4j4jmNAzWxqf+couHZoB+1Md0r1
	 UMQZdOlrLSfwUHOxbiyr83xzxB/4PCAkm8OslQRuwYvQGSc2qPg2FajcbvcCHgHtKcT4O
	 i7fLLOIZVCN7yKkw2G7HW121PWS1Fta8frS4RnGKMBTwtqfM3A9YhQ8GPuHUzdxWCqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811424;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=canfWddXOKJK4R8AC3MG+SOr2FxQSKIW+e/0Ee1s+Q8=;
	b=Y6/7A3CtIuSgNjHREBoOZNVgErZ0wERwFw2DO8jWkvAjGVIFMAVtTkgRZhFTxwcLsd0k
	 qcelF5qyqf0QbtGaddL6W2+ZTuS8Glil5PLf9Er8n2LAwkapMfVo92eZDSjhrh5e+Lhe6
	 /aiv0iZqQWmVa3AV4Xt+vcg/pORBrkE//jv8lBLHDhOYK1dytNWT5qhv5jAFDKugJgFSh
	 IJk0+xaJlwhneNKrg+YWxFKnQATjhd59GaPjRA8PFbpTbu0CbvxosaOHEfcYB0fuxqEhy
	 AxwZzvcBAfOQVGL08aKC/8iAxYiU9vijt4Gp4QHSzxsKIQNtSl5MVBeeK0vw43RR4rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzvITC4Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A1606A336;
	Fri, 27 Nov 2026 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzvITC4Y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811424;
	b=rvM5HST52n1FMEvbdhUX8fto7Yueo0sCkvIBezzgfyjgtF37vJIcakhDwEa8YrRCIZ5m
	 4nd5Y4p/t/tj5MIjgBsHz7n6Ab7v/AcH40midcpNgfP65S3Uj9l7IfL/PU4dOAfqBLIRM
	 x02xHoBAVH/vrnt4GJoigo0kVocInwzqPKWDyOx5ikEwl7d/pSSbrPAKFJUh/IeN+ODN0
	 s+1MDZZkhdC8W/WV2SkEB3MAm0wevhZEX0e6MI9q+fq6NMbZS0fIQY5cPXWt9uznoewLc
	 7QrySzVun8ImgS0xQ76sSYDhYn/zEHQI9/ugZ5y9vDdUXAVOuxk3LipfLk9u64xJ84g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811424;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=canfWddXOKJK4R8AC3MG+SOr2FxQSKIW+e/0Ee1s+Q8=;
	b=D8oFQut4MVAr5j15E01vvhXMSdMBChlGyR+JUwTp7VD1Ai+zwzBLH563R+d/NBMReWzc
	 J/DWC8AXTMmZ3c+BTfiGrwx5HGo4NAIJ6b1zyK1GoXmX0MtJ9NqIz52eCASbZvBoSLRNu
	 2AW43K4X/SbeW1XqyuJYFo853Xp2eRXGYEnmv9SQj4+PzT3m9VOfgsnY2Hkw5jgf/l+2Z
	 1nRgeUV/VQFyrpWTROIStyp/YMx32NBdblCQjgpb/axR2ESpH1UR0KXy7TOFuJHvONPwT
	 MNTDW4iimo27gaNrZEditnv7O6POzeJmli5LFgstC66NF8whCX7kDirGoWysEGsLaEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A34841F00893;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811424;
	bh=canfWddXOKJK4R8AC3MG+SOr2FxQSKIW+e/0Ee1s+Q8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RzvITC4YpRh6Hl9wk3jCKGUHRoCOANrL7gkqbeVLw2TYbjRcxEZJV2EjO+jaeopth
	 klVb10RfOubbn9sREaRbkpMNS0L75n8fjeW9HLLuXfBIWOjhgCxzSG1H4TMdEci8yN
	 SGpXLLEzLjbJ9UK6JK+tbaNbQkCq5ZoA/dQvWThA0snIPZglMXX61UzSK6otm3bhKR
	 5ieKr+u8qlf4wF1OVdckTP/qQGuP+mwzn+GR7Cer2q2FFWR/LhDVIcx2ZuVvB+n+40
	 k0PhpCpN1ETKNCNIj59wjPVuG3qnRpAjNLbI0ao6ue+8e3aqtRbJGYAQeJTCGM7/OP
	 JHCC1bf0PDZNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 210944DDB1;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI
 clock, and strobe OE
Date: Fri, 27 Nov 2026 21:30:12 +0100
Message-Id: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFToCWsC/x3MQQ5AMBBA0avIrE1ihiKuIhbKYDattNJIxN01l
 m/x/wNRgkqEoXggSNKo3mVQWcByzG4X1DUbuOKWiDv0qWNDGK/graBbvLuQ+p4bssbUViCXZ5B
 N7/86Tu/7AZK/S3xlAAAA
X-Change-ID: 20261127-ov7251-strobe-ncont-188241b553be
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811412; l=1347;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=sh5vcsf0vWaLWJozQbA8jgzmmNs5/qohRCr+09epJjM=;
 b=T8+25KV3fxI+T79n7ZnoVUHu4xSx/l0cyDLOPM+xPdGqpJCTJklmVNhiT5qeV0oy7D6Ggupop
 /PNZ99hWtwkCtnMDdVuYwGZbUTkg8l9qz35TymmITnvpDZpOjLRJbqJ
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

This series adds four cleanups and hardware enablement features to the
OmniVision OV7251 sensor driver needed for reliable operation on
Qualcomm SC8180X / Microsoft Surface Pro X:

1. Wait 5-10 ms after global initialization (software reset 0x0103)
   in ov7251_set_power_on().
2. Use pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend()
   in ov7251_s_ctrl() and ov7251_s_stream() to match the autosuspend
   configuration in probe.
3. Support V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK by setting
   CLOCK_LANE_GATE (BIT(5)) in OV7251_MIPI_CTRL00 (0x4800).
4. Expose V4L2_CID_FLASH_STROBE_OE to control the sensor's hardware
   STROBE output pin for synchronized IR illumination.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Robert Ijtsma (4):
      media: i2c: ov7251: wait for software reset settle in power-on
      media: i2c: ov7251: use pm_runtime_put_autosuspend()
      media: i2c: ov7251: support non-continuous MIPI clock mode
      media: i2c: ov7251: add V4L2_CID_FLASH_STROBE_OE control

 drivers/media/i2c/ov7251.c | 79 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 5 deletions(-)
---
base-commit: 10c156a0a06c0a255cbd13cabad649fd8d604b47
change-id: 20261127-ov7251-strobe-ncont-188241b553be

Best regards,
-- 
Robert Ijtsma <robertijtsma@gmail.com>


