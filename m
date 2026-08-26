Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E8426419
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750594; cv=none; b=PlOcnM2xHHseasJEwtHIkXgpaq5oAJ8XUhL0I8LVMy6rn0MDHa3pN8sgCZp10Mm9SpVlqBL8wKr5o8JNJezFCmQ6bB2BW0fIhIrZ125zP3BI3CHJJI06zvHSndmTPEX8hHoQydpOgtsnGqtCysK8CDlYV1CyZ2t7Il9VN08NErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750594; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFI0sJ4QLKGnxvE+WE41FN+xzpcZcCWzrS2z3FkuhYgsg2TDEkq8ERWkp++Tt5/RFjSs6hEMqKBdCy/GTVrKH3zERXLfMUhqG3Op2K9VykdeppZMSy3SXyKriIpQ/O32i7snJ5xHRvmC8oEguTO8LHtomE5/S42kB/lfgpeQh1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibTRWEMp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibTRWEMp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so892698a12.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750590; x=1788355390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=ibTRWEMplCUYvirEHALzbkzArGsObDxC7qYscA6PUXLkRcklRGl/JsPqst1HZtc7Vl
         EwP8KIK2qvjAo4r1ZpIloqRaNok3qJyH9iLEok8cSEzpu99ymOgUYl71zWeI/CUy0zO0
         ignqj5FqtcUx9IPSyJ51TMXZyhBe1mt/9cLpykpGHFHRtubZuaKd5eRbHi5FNhfN7w+g
         AYUeJRvLl1SpAct7BziyOyNUfFWhmJ05d4UYzHGcZmvm142SjI6sWge1//T8iyCWHfWE
         WEaczTGPwwewXJmYechX2oxxxTU6rVSrs/ij3CcwVV78j4NxNF0xfd1yNB7CTw+C/BQp
         TuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750590; x=1788355390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=PnGnGEivYf2FJwt1GAfq59ZjUPK8vtPgNVEuUjBXJPP7P+T12PFvs+sB0Za2giAN1v
         hC+w7EUc0bhA+SaJEBZFUUjDeHpfZVq+8Ow93XL5nVtUwtXjZYLWx/334ksndpXlqdgy
         VKeodxJqALQLiXanCP/H+Xbsn5/QF5yte3gU+CwiFYyjUSyWUfGfTS8D0PDrHmXciTsz
         0wfzkX5A51VGKTYJUuCp8X56YRJg9Hwn5QS4yE/yHKMW9zmICmLlJToTHFGtb0m3t+ww
         obfCU5RBN9n299Yiyp3UZ24bLz5MIYhFbNKa/agIi8GZG+jo+AJB+5x/2oMwgb7hjIiJ
         z2FQ==
X-Gm-Message-State: AFuF++nGjOmH3GSa0vwvDq9CIKrEv4MMa9QQa/+Q2VEaeCjNkfEVJKfA
	2tl4MBPG64iiMyZEIaN4af9tfObx8UqsQt6BUYaFZAjnwc5wpVjieD5/PLgf/1WM
X-Gm-Gg: AR+sD13NZxk2OTkOQj72BBacRtP1fQUy9ct0vOtAa89/F34huio2sJcXMEc4upf6pgz
	PWD4AEy/egJdFMZRggsQ/lnjNPduya/kMx7aAJ81E/8dSGyyYrEEqB+BF3DmXTwiEdeN0VaJMyP
	dQteF5FV0rS5qcsXzKoGRsRPqZWpumFB3H2ymr3g2md1nAvfRcbFflzGcqcs/rIFwpS+Leoc8Lt
	tSMWWZ8KioGw+whkolJQSq4tmUDHL1ZxCfiQ4+WszCMr83+8pWditJIZiem5Z31/sFzKTj6ZCDg
	vo1g8zVXdxCfTfdJjtUQT/vPydggENtLurXMzX6/fC9+Sbu74KYkQbPb9eCQrhySPYkr+6QJycC
	PiAWWfjrJnz4RbaWEoRiPCwaq4NAoNZb50G+18wIHV/fVcw921ehF6qt/KpAwkmMmezUlJP+HzH
	C9Ne64aNabL6WAoACulH5xpPDgSwQ1z34a+r4MeSpCTFNDSOEpHX9ZW9eJqg61j8IMNoMxqM3KT
	Q9hdBk6DBGXvi3mKypk362NTBDAlufoJZloxc+JASQBYZAjlv9BMw==
X-Received: by 2002:a05:6402:21c6:b0:6a5:7aad:e75c with SMTP id 4fb4d7f45d1cf-6a5df61e239mr8437572a12.6.1787750590242;
        Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 3/8] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed, 26 Aug 2026 15:22:51 +0200
Message-ID: <20260826132256.3343451-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

