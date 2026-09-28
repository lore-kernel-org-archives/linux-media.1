Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC025392A
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604876; cv=none; b=fmw9JiVzXI1tc8Sf/5c3AthGUK73K7fcb6K/WwgCP7KK7Hto3DjNZ1Enl+W8Rf0JVhmaAt4eUOwYUFia0n8zObO76Zn6RnEESuSQkl7GMcdyWnfIDNLeJ0F+X0moRACvTZtyrqbcGu1iY4DAv+iBg7Kas5TKf/VIx+VbXgIpvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604876; c=relaxed/simple;
	bh=sU+lDxf7dAAunBw4e1ZYE4r+7bpNQdzsh4cHzVdFfFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZKdf3UlhOCPzhYsCYajs+nBIUNf6HWzb097xj3kRB8oZSjFKaAISrcbfMMdbndP9CN3CVUgCjEehFqvfg8r5OnPWbYHNfBmLCccotQ/Ffq/9cjNjkjBOHE3i/9qZAWV9PXvmLnBLWa4iMkU8GCdHJLtohwTH7iKV7iR6Vmi8RRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ4sCSkZ; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ4sCSkZ"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88103e47f07so843166b3a.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604874; x=1791209674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LBunEQoaKYC1tlQkl3OTAD7gGYPlskuDf0Bxy/GPNY=;
        b=DQ4sCSkZqxzlP0foZohyTNyWO+2jADJ6PkY5DV6d1qb4nrcf65gSUTHZ6PzyjmIWjs
         mzJnRla5X4f2U5PsTBOMjNHA0MXiDJKrupH/XuJggYaiNhZ0bW+ik4xOxcqUWj+dJG4p
         eWaR+LX6j43SHZsMf9XBAC+nV2+VkEIVOGarrdVjj/FwlNjed5Ln0YiDng5zqXC/z639
         dHbVn2g3zFIdtuRgE3gu3gjYEnP0V4A3Bvl+Elhe7XC9foShoCRwFKeDupiGP4Z//bkh
         mkcUXU5NV5GP2psDz+xrSC2dAWL0QWistRH1aN45k8b1hWOUR3ieMrzFIyvj4G6vv3Zv
         LE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604874; x=1791209674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LBunEQoaKYC1tlQkl3OTAD7gGYPlskuDf0Bxy/GPNY=;
        b=A1ZTjH7EgFxdxtHNmoO+Mm1gCtW/k1d6ko7mgrbjqYHMKvdjpmE0+9ix+erEgBgkLx
         sm4DpW+WPHfKD6S21nHNtf2vfSQWc5d/2M8vtOf9YNBBvxMpFuKktS92i5b+OkXYEhXI
         14WfGZfurvGf8hWbcTNFYwsJmuVLOAioWQAdH/Q1HPjb6dKmaUQaYuPVx66k5vgdKYYW
         ZPkSOQ74qJWozqLFp2TNb0iQRLHFkghIUyRDt6cUqMgJJQkaim9j2duUiB0LylNJxhby
         yplXRSjg+mGkR1KfIfvM9GdSQOLXQHRJbYpCBdDBWa2S+nOk93y/hEDAcoW0v82DGKBP
         uICA==
X-Forwarded-Encrypted: i=1; AKwUvBwnTpqjxEqTBZA8Bjtz8x8/e0B/PkF8anIBiOxBz0bHizSjwM1GztJGbG9jHk0xaowFeBjgmwZZ72Z7dg==@vger.kernel.org
X-Gm-Message-State: AFuF++mVQ6HEU93iMZXI3dDRFcz9qHUk5bM/hqUGsgiDy6CFcSn8AVtu
	OAXo9jPHqPnvs89v3tI2bq/SZH2M23Wx5+E4yJkZMYSDBU9qa5v9vb6P
X-Gm-Gg: AYBFou01qDsI1L7bKpYXKxSXcLSBdD/ZjIXSE1XMk5T1ZtPHH43+BbZtvv0IVYgdibe
	lgbuwO0/TgX5kA3Ho+wG6sT4E7tGexWMpII02nbwkQZZ7bPjsKNCfyOSgx/hseuqkQ0Jp4JJQJD
	qPqMgbI9LuObu40mx8KElkkAUCPiqQLrIr8HxicmTqQjLiml56MC/3U0/H6vmWQS/gKk9fhLcFt
	od8EujkYCxmWQ/mgut4deWsG8eSf3dXJwnHWiGcE0DxrW676fftGL+0J0KgViW7Xu9H8mEhjlRs
	D/cgXYqyv3gZPiKXYb4oPFn1WNJKPaTpKc2q703FoY1E7Du2NGtdEIIDs5BNKFUi9dIxtqfiqYF
	oL5nWDbuoClNnVe86Lnx+EO+Febztoiw8PLWf/ioFbdC9hQb6Ti2jSEnxyRmzociKOLkxEPO9qm
	vuD6ex/cbeUUenuWKG4wxFM1SiEReiNkXQ3maJEnRmnqYzdCu4HCwVSOmDr05IRPt8Q2TmPVm9y
	95oQYf2YFCKsZ7Q
X-Received: by 2002:a05:6a00:1585:b0:880:4b56:dc28 with SMTP id d2e1a72fcca58-8804b56e3cdmr6264031b3a.15.1790604873575;
        Mon, 28 Sep 2026 07:14:33 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8824676b576sm2141521b3a.16.2026.09.28.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:14:33 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: og01a1b: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:14:26 +0700
Message-Id: <20260928141426.2451596-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

og01a1b_remove() calls pm_runtime_disable() and nothing else -- it
never calls og01a1b_power_off(), which actually powers the sensor
down (disables the input clock, asserts the reset gpio, disables the
dvdd/dovdd/avdd regulators). pm_runtime_disable() only blocks future
auto suspend/resume, it doesn't force a final one.

If unbound while the device is genuinely runtime-active (streaming,
or an open subdev fd holding a PM reference), the clock, gpio and
regulators stay in their active state with no code path left to ever
release them.

Call og01a1b_power_off() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Fixes: 472377febf84 ("media: Add a driver for the og01a1b camera sensor")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/og01a1b.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1675f0460969..632063cb7d30 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -956,6 +956,8 @@ static void og01a1b_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(og01a1b->dev);
+	if (!pm_runtime_status_suspended(og01a1b->dev))
+		og01a1b_power_off(og01a1b->dev);
 }
 
 static int og01a1b_probe(struct i2c_client *client)
-- 
2.25.1

