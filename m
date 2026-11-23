Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477445;
	b=Y+bTV5PsNj3zEgCXmDX+cFhspPCAc0POH1AuNpV7CnR+GDV1scjr8ypTnEAG4ooaMXkH
	 j7D0XwGm68zCuddVV8iiiUchoBFPUKO4hXPG2RKco6WdUbL7a14Ije7IAS5bqoCL/ITz3
	 pLvdnhkxuYfGP0aUlkD7vHtgvAaUYEqrk0SO9yPGweWfdlh6VP+kLHfyi4FsokKLUgcMX
	 0I1DUbZEc5EhYq59GA9qB59Hwfvc4ZhuCStVxuKz/3h0bYv4W2TNcnlnf251l3GqWkK2+
	 VyI3mnXcOsptx3y4M8fd9i3r5tovfKZ0VD/+HGvpNvUcnjb6sib1txmUmOOnig3ZRSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477445;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XsEVMvyPOdonXytfbApASL6TI/QJ/Qg9uNWuvBu4ZTg=;
	b=v6zScMggOD4hTcbE09VV2+uRwcOwjv0/f0MUgU29q61a7BC9EZxRFQsb0/xqv0wvw3tn
	 wuZxthBEqnEuTJ9Oyqx0rzA+nKxAD5oLXqH5sst30FbU3j8N8+KzFqdHkq2wHyvCcDBIt
	 mAZnf7Yv7Ts7tpkxy7GgSlcGet+p7Ql8Kzb6p3bWswcGY8IMYNyehGtcM85BYPqCaDt60
	 FJO1A9x29fyrmfzVY3QYN5/1b0YbQugLcKfpiYWn1Yv9sa0k0XeWBFEJaC9d17CsIFX/u
	 NE4NHV1OPmcuMEOZbCDwv5eXcUg2l0xoiQAcfWvgQQZTSRk9YyPIObI12b8/2ABLA/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPKiIrDz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAE606A321;
	Mon, 23 Nov 2026 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPKiIrDz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477445;
	b=npJLdVuAXfEf22kFjZDEfH98vX8xOJjdYm/5IzATyvBLeXVAwG5rc/n0lLJhYohbJbce
	 UfJeBBdXrPIvEbprrgCtK+Tu/4xG7s0SUPXnaFXaswiHFgpNUd6oIZrCQC0hq6426GobL
	 vdMbwjp7EeBWfXigkLKWT0RdOSJBAkBPcDs6s+t3rFDk5YzfoQhsuApOYUhZ3GoYCJRf+
	 2o+kwu8cFXeg4zdBaBJyYli/51pQ4SRCMqdlcJC4fzPQKPf2xpRwxiryBaxiHwyWHn1Jx
	 azlOkfJKmjtjffWpPAAdf/VhMlcrAfSsFV54WIVCmPBPTWOb3wJORV/Wl3EclyZmVig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477445;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XsEVMvyPOdonXytfbApASL6TI/QJ/Qg9uNWuvBu4ZTg=;
	b=RBhylYhtycfYzDW5BQE2wq7UtvZ0IJAh9W6YHabbFKwrz+OuZckFCQ2ag2pDExts9o98
	 jK/8xBHH/7qWbho7xR/9OchNgUXZug6r3BMnZGHiK9aAZGu8PBk2ND/ieQOROG5IKAyq9
	 z72d/cAg8SArmRxoX1f8PafLEHNpsctTjAVnZ1E2j/U1Z2kAG3awtdrfN7bECeCfFZG98
	 jJOauvDJtRO5+1P6X8KcFZyNwSHAgoAMSECAuCNZDSMxRCmLJ3/Elde3ytyNuyDnIBXqd
	 c0FDrPV6QsmXybQcVJ3LRJnZApibq+wWdrVs36jKZx35fJuG2nf8IWrv7b1sEm27uvg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A2AF1F000D0;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477445;
	bh=XsEVMvyPOdonXytfbApASL6TI/QJ/Qg9uNWuvBu4ZTg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fPKiIrDzy5HiRrl2Ms3GuSWlSm5yLAWrmU4UrmBUDCzYLQ9qEVJz5V1N27bgGGj5D
	 Zf0ZLvA4mT+D6EAeeNFb4frTmV3NPbjy+ZTPgWDoZwEwYPB8oFbbF1HJVDtNl3YwyJ
	 JqNHGshudBIn247In8QN76GCX/ZQL4o0g37QCdlcvyLn9QxckXn0H8E2652E8KTauS
	 tvnVeKOscJS2YKXNAMKO25NY2U5Ptw/Q4DOxoIt6RF79/q3UjQ1L5GbsOAA5eR4HmS
	 g42iFipWq5yIfDWRUZCsZVpYMu4uCKHPz/8buTovrlNqZgVRNRqp72/1EiaoLLnMPG
	 YCRCfn2XS94rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CDD84C7D6;
	Mon, 23 Nov 2026 23:43:55 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] media: qcom: camss: fix VFE/CSID/video error
 handling and register bugs
Date: Tue, 24 Nov 2026 00:43:52 +0100
Message-Id: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2Zp204B68j8Mh1IWWGOp6SLRE
 P7dglePLzNvZgGhxCRwKRZINLNwHDPgoQA/uLEnxW1mQI2lMYjKuyCiOn6TKOvKynhCoy1CNp6
 J9iALt/rH8mru5KdtYmsMLFNMn/1uNlvv//JslFbntrMtNaeKHF774Phx9DFAva7rF9nXceO4A
 AAA
X-Change-ID: 20261122-camss-fixes-4a671ce21042
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=2793;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=vYw1nPh4Klj7yHJJhzQwQj3DP4trkjzglC80GQbAh9g=;
 b=f6LOdyOpXQ6PZYXfnrU/+X9zNYMIEEJmIqnb9ruI3YgBRDuFFTxrGwH+szN/WIP4+WOJdRVKg
 sAM+MRsWE1GCZHVajo4+Tc2vcxZnWCJZWam8F5BDhRvfnwcJl37twud
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

This series fixes five bugs in the Qualcomm CAMSS driver found during
Titan 175 (SC8180X) camera bring-up and code review:

1. vfe-17x: Check VFE_IRQ_STATUS_1 (status1) rather than
   VFE_IRQ_STATUS_0 (status0) against STATUS_1_RDI_SOF(i) in vfe_isr().
2. csid-gen2: Change `enable` to bool and use BIT(RDI_CFG0_ENABLE) to
   explicitly set or clear bit 31 in __csid_configure_rdi_stream().
3. csid: Release the parent device reference via parent_dev_ops->put()
   on all csid_set_power() power-on failure paths.
4. vfe: Destroy power_lock and stream_lock after unregistering VFE
   subdevices and video nodes in msm_vfe_unregister_entities().
5. video: Factor subdevice stream start/stop into a shared helper using
   v4l2_subdev_enable_streams()/v4l2_subdev_disable_streams(), unwinding
   partial start failures and continuing teardown on stop errors.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Changes in v2:
- Patch 1/5: Drop Fixes tag since vfe_isr_sof() is currently a no-op on
  vfe-17x (Loic); collect Reviewed-by tags from Loic and Bryan.
- Patch 2/5: Change `enable` parameter to `bool` (Loic), drop irrelevant
  sign-bit remark from commit message, and add Bryan's Reviewed-by (Bryan).
- Patch 3/5: Collect Reviewed-by tags from Loic and Bryan.
- Patch 4/5: Collect Reviewed-by tags from Loic and Bryan.
- Patch 5/5: Rework into a shared camss_subdev_pipeline_set_stream() helper
  using v4l2_subdev_enable_streams()/v4l2_subdev_disable_streams() and
  iterating entity sink pads rather than media_entity_remote_source_pad_unique()
  so entities with multiple active sink links (e.g. VFE with CSID + params)
  are handled cleanly (Loic). Dropped Bryan's v1 Reviewed-by due to rework.
- Link to v1: https://patch.msgid.link/20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com

---
Robert Ijtsma (5):
      media: qcom: camss: vfe-17x: check status1 for RDI SOF interrupts
      media: qcom: camss: csid-gen2: fix RDI enable bit manipulation
      media: qcom: camss: csid: release parent device on power-on failure
      media: qcom: camss: vfe: destroy mutexes after unregistering entities
      media: qcom: camss: video: factor pipeline stream start/stop into helper

 .../media/platform/qcom/camss/camss-csid-gen2.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  48 ++++-----
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |   2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   6 +-
 drivers/media/platform/qcom/camss/camss-video.c    | 116 +++++++++++++--------
 5 files changed, 104 insertions(+), 76 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-camss-fixes-4a671ce21042

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


