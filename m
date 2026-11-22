Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354555;
	b=VH549qaQv3Yff4Hf3/aNjUDueKQ0/fbk9oYTThCMt5FO6AYEsk7lJT/FRCy/gKiIi8MV
	 spJEWjuvM46BSXvNcwOEPsQwZ1w5H5CZoYOsh1+3DpWmIC9Y2hPqqqxFDOxgWCvuCSamV
	 Hemz+HDOOzrWP71d6IMqbKiHHCqYo+PhrQfOJHbcDpzrdr244kJgliWfSMnRPRTiJecrU
	 mVOWKZyxJgN42fZQuzjALNHw9phbkGk71o9a/k4vvq7W6dAWA19jlUY3mCcLgSBJRMQq9
	 18hCdhVsolcRzs5EhZsczWLDIfc1ORYqhBwYvZkFVIzEKXmPgMermad+njAqaDwCU2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354555;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=gTa1gfiesdccDDoKSNuLMBrMpOS4yceS0kNOeX1njwk=;
	b=lWDHlU5b+s1XnSWmEqeNMFkf2odkOfZCeT30+cffbx/3JK2teZMcZg8YBAmEC6I/3f5z
	 XNE3rQJULSueKx6/OM5djkwj2E7/Z1ns0Khm+Tllytz9MPr02dDO5ubm1A7IVKS2qLF/R
	 i7XeWbGgn96LoR1+aij3tvswZ0mFZb2sZLH/yxnstc6ajA8xzAxO4Fp8+NllzuUe/is6s
	 j2bvfkCvKTCn/BT9o8dc8j6edRR0EGZi8G2zDHiRTmxbmyjoswRbn/4Mf4B2q63YQeKAz
	 RWx0hYgRy0LyALhxXe1mJTRkcI5NtiWFBWHUvYeUgF6PEuvmvY8ZQrVxG6EUuzDeMGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmUm4v16;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83FD606A32A;
	Sun, 22 Nov 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmUm4v16
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354555;
	b=3o7PEYSq424WsA7tBUBFQglaY4UuhVXKTb4CvJMNmjL7k6JIhU0KDIwVQPgwOjM8LZhK
	 co2R48Fsa7M1cl0Ds0Jj3IdyP8cth6EfZJKuAEpPbTlokNhfVpJ/9/ETTVpgkQc33cg4r
	 A/wHnQeRzsuXZOt+0kgjq4Lp9F+XKQ0FmeMu5J6gw/oOSjz66eeIAhyEymop2r1d79lcO
	 Cdu8qy58h2pLyA/d/yHa5Lp8gkiNWbLQ7yOI8UogRgL6qIVQHEtnErdRNlEAR1WtdccC5
	 i16zvPBxqzi5WXCMI7oQI47SHgzXSLybjDm7iEcEFW2/HOqGrzjpbfUEm4Eb/QSbt4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354555;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gTa1gfiesdccDDoKSNuLMBrMpOS4yceS0kNOeX1njwk=;
	b=DTjHOjU3Jz0vNXyT3TGykL8FFnrn9zfQ3NV9fqWsIgKUXLI+poP5W991zaJIV/9S8mmR
	 N6f/pt4xDfDw3RbgNsyIHcRvIsX1C/aN+HU9/nNZG+4hhXvIZ4lSU0Jbmd2WPgTauCgi4
	 aOEy21HPhCDYSm+JqThRLZ4K5B+HtUnivLozRNWQ83eSzwlu8O35zriJTRige836zdmmg
	 8V2BPkBAtlwuyyeoYLYkog9JEy4Ri442IjEHnXtSy/Fs61WwpGRToqpwgsROIgoBqSwai
	 zCczNVG20pBQkRldriwADcPl+WP0yK7f1QQNBb4GU+MStOO1B66KhfgdHkPARIguqrg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A71701F000E1;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354555;
	bh=gTa1gfiesdccDDoKSNuLMBrMpOS4yceS0kNOeX1njwk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LmUm4v16NZ4Xoh3pnf6bUfkNfLJmKIUX3YL0csTmhtNBDSeVizS2zvDAD4Oh9EUKh
	 3S46fCTu0xR3zxCD6iXOFuK/4n/18LoPY2OQ3Fq3jMa/GwLvoYm1QCh6ZbLreYsUZk
	 hPg62+zFIcOQQ7+TEQ25hbTEDjwo7qa9YrnvxDtyfXaQfv+clECRgO/sx5TO7yoVWt
	 QV/eL+r6zOhIDcifeSyutBmGfOXNmY0+8xthrjUmI6uChslBK7SCsoZ02SHTJM2IJ5
	 FNlV87kp0l2ZLLD34d5Pf1tuxCArGBoJHASwtwV/23PffXQ8TxTxlW86UXycDkJII/
	 69KgFmFYvXHYg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 331204C09B;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH 0/5] media: qcom: camss: fix VFE/CSID/video error handling
 and register bugs
Date: Sun, 22 Nov 2026 14:35:48 +0100
Message-Id: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNsy00a5FTlYazDKTztIyb1bH
 D59vd8FykFYoUwuCHyIyjJHYJqAH9zcs5E2GiijHJHIeDepmk5OVmNdXqBnwswSxGIN/A0xqOr
 fujcj++29gPt+AGjUdp5vAAAA
X-Change-ID: 20261122-camss-fixes-4a671ce21042
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=1887;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=l9V4qs7Oo4FeqxWex4yYz7xBczsyHC0FN5r4HT7Uh2A=;
 b=/mJTAKlGb/Fwbur7CysGc1PHAGsC5svVFDUaigE45HuIgMu3gFtZqTlFzTWWk0TPfCb7tlmH0
 lWTmshpaSFhDP+yIpz1iVv7RYJp9jDKPupXCeVyrIbZNFqRbERT9y9p
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

This series fixes five self-contained bugs in the Qualcomm CAMSS driver
found during Titan 175 (SC8180X) camera bring-up and code review:

1. vfe-17x: Check VFE_IRQ_STATUS_1 (status1) rather than
   VFE_IRQ_STATUS_0 (status0) against STATUS_1_RDI_SOF(i) in vfe_isr().
2. csid-gen2: Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear bit 31
   in __csid_configure_rdi_stream(), avoiding signed int shift overflow
   and ensuring the enable bit is cleared when stopping a stream.
3. csid: Release the parent device reference via parent_dev_ops->put()
   on all csid_set_power() power-on failure paths.
4. vfe: Destroy power_lock and stream_lock after unregistering VFE
   subdevices and video nodes in msm_vfe_unregister_entities().
5. video: Roll back already-started upstream subdevices if s_stream(1)
   fails partway through video_start_streaming().

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Robert Ijtsma (5):
      media: qcom: camss: vfe-17x: check status1 for RDI SOF interrupts
      media: qcom: camss: csid-gen2: fix RDI enable bit manipulation
      media: qcom: camss: csid: release parent device on power-on failure
      media: qcom: camss: vfe: destroy mutexes after unregistering entities
      media: qcom: camss: video: stop started subdevs on start_streaming failure

 .../media/platform/qcom/camss/camss-csid-gen2.c    |  5 ++-
 drivers/media/platform/qcom/camss/camss-csid.c     | 48 ++++++++++------------
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  6 +--
 drivers/media/platform/qcom/camss/camss-video.c    | 27 ++++++++++--
 5 files changed, 54 insertions(+), 34 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-camss-fixes-4a671ce21042

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


