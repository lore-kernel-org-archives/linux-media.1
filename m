Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47038657E
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425779; cv=none; b=fHRKlSOT0zn7r1aIgt07W3OS3SGZuqLjxu5epK1j6OiKFRqYO6mNCjOERiF99JkRIY4gBcR41UMfCmGTOz21e1JcAqJ5mMRA1yXAOfABf1tEVasn4g70L2Z/cTaSsTEEcOV/fRkUBfjQ8zT5w9JPwJK3Gd7XybEQCa1Q2SLomaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425779; c=relaxed/simple;
	bh=prl3a0vkf/T6ZwK28gJkETuegr5G4y5J6+1qLJNyQ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2P6xW+HzucJa0iIrWLM4RoYYdhIhZSchIr2MctZ7MzZcFwBWq0Pl8wtEBmI1qHHmfAbq1KRX8NSAD2mUojDZSrlYU8TeSpJpSyY/kQ+/FisAMsfm7zSuFcJ7Evv7lS3tu4GA46EqmoSiEyjAa9NPOAAwvTB5H5k/LK9ii+gfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhw9SgWU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhw9SgWU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso11112825ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425777; x=1786030577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=mhw9SgWUY2LQYDhrB415pOv9rupXaJMIxR4t7lgpyUaNLLDqydv5QaA0bIIZdnnYSv
         DEtCyAmQCMFKxdXfPf9MCL+91ukbwbcTka3XoVnQ9++QCC4J30LoDGVBipMa0rhYcC67
         eIi+WTbj7EgU1wsrfhkrAS5OIRTKwoK7Rli2VVixL873nlTuCKiDCz7r9kZZupPUu8ta
         ifBau0F9zY86hRRh5Mdd3taJRilkT8PZxwbPBXjmOT6dpZvu2fyqRNgkIcu6VLPdZupM
         wsUCSrQateVeVrwEUYwdIdThx8q55a7209F/re3VhiIRUvYXx07dEkMz44h0aniW5Vdc
         /xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425777; x=1786030577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=npr4TIAPIgZhDd7QKhiE31HPj8fPLUNiS5UXlJmSxWcDvwczLQC6aOuXL02Tli3Wl/
         DEO0cJRZiDoZVVq6oPePCp/sq7Y+u4D1/pjCGglBoOg2x7FycKzoz4fDKitXE1b1y5w6
         AVvPo6K+8sDw4sm+cqyn0gH70LNPHaTIKrQYyvjIiGhkhgXU9dl0Qlku24/vuZoy8AQm
         EL000rgetllXGx6MB8bMBRdhKxDdiyISoSaN/sFD8Abz5nobvyyobL9AGWHeL2DtcfXb
         CoiASDSfdUoPdEqG0ZJMON50eQbFpSVU9pSyK++mm8cpgl8ukIe0Rj5YzVcRULXxU73e
         ddqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxzAx1P03PYBaBNciSu/dN141fJu71lZnNCFGOkuXFeJvCQD1p880lzY6Mke8H8FNnsO69Px+itN8Vog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSPUIa3ZlSqtvttIMRQGpOVPWyPFAECx9j7TXAiswCZGgwNRl
	lJncZcxncJmDQAJsRth67phwMFwl0QFi/yaGH+k3RmDjPM5HbiW/veFD
X-Gm-Gg: AR+sD10/+aFKz2vJaBfFHGzQThv9lymRUdnt/iNLwiF95k/v1K2SbAJEHjHHHfjC6CJ
	u14jaqsIwsq4kgKvpNakPnZKYFXswGTjICR6kGOSkFmIJzjal/X4Qk7uKyzLAUtezx+31vGDRAN
	f427YUqwptLS2vvSuiNJf8UbxZv+ZB4pxYTRGAR8Dt7NXwhBeAD9Z4UaSJd5/QR9g6rJHwbEtIB
	L9nsPK3bdZhnIwh1ygaKTweS5Wa0FoFJWWUyA5rzG3eRL6XIvea/uYiwlXdKH1L2UsM7/kYXAME
	FzqZTrpeiCWy4WsE/zBzxKCLuar8Pk5CjemydeD8Rb549OipusNvw6phvZjhN+Djt943j2EUf8c
	u8XQQLeGgVgZgEBRGK5+dXNzMrYo9iNJlaJTUBXWbgJ9zx875OKbs3ZE0bbf/cKDi9iqWYmy8wa
	kIwI/sPEMfYzbGjzMBYGuB2V4TSd/XWpQIJF4XQGQki1zSTkM6A4UkIaoRrtvcyUbyxS9wxH5P5
	TzeauXVxfjgnKJDzBgFWeUEP/zaM0DW0cl0kT3ZH6e9RQ==
X-Received: by 2002:a17:903:1104:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2d03e9b6bd5mr5417115ad.16.1785425777367;
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.25.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46969sm28820085ad.25.2026.07.30.08.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: rkvdec: fix v4l2-compliance failure
Date: Thu, 30 Jul 2026 15:36:03 +0000
Message-ID: <20260730153603.5721-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rkvdec fails v4l2-compliance in two tests related to
V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
sps->chroma_format_idc == 0, which is the value returned when the
control has no default.

    v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
    v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
    Control ioctls:
        fail: v4l2-test-controls.cpp(942):
	try_ext_ctrls returned an error (22)
      test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
    Buffer ioctls:
        fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
        fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_q)
      test blocking wait: FAIL

Provide a control default via p_def with chroma_format_idc = 1 (4:2:0),
which is the only value the VDPU38x SPS validation accepts.
This fixes both the Control ioctls and the Buffer ioctls failures.

Tested on Radxa Rock 5B (RK3588).

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..37603f049788 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
 };
 
+static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default = {
+	.chroma_format_idc = 1,
+};
+
 static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.p_def.p_hevc_sps = &vdpu38x_hevc_sps_default,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
-- 
2.47.3

