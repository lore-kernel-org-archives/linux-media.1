Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF7337699
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742215; cv=none; b=dsM6DD+Eb823s+oKE6HdXEa8ep1QHMDOuXyNnUwemAZ83l2MpuUbGueZIwMc9PI6ildUserNUpXMPEjWMv8VJOwtoowBRNi+YHQGaGb4A9BklZBsCCn/gUgxNcpMUC8n/jorYaOUdYAa5w7+RkpYpvQmAQWAAxXYHIrZ+4EpEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742215; c=relaxed/simple;
	bh=+N0EYqnh9d3SdN0JXchYO51KoW25AszZPqV7SMJpVmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sw/1ilVfcFNxApR1EyKYaYWrm2XdOfSIMB+5WFbm/DHHSFRtH9smZ9L3VYf4ZAl4AKNw4YM1wBnKsehw9MV2TVVCyTu5vZsalvGwXfn8GYShBYDvlfuu23irmy0k4hXr7Bj3X7laLsFSOUFLLxm+241/U0B1/NaYg0A8bhdXN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHMeamzs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHMeamzs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2533d83e3bso191495466b.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791742212; x=1792347012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FJfsAWa2Tg0a7RAVRgcsQ8tBnMmp27HrWsnWumyp4U=;
        b=kHMeamzs1Rq4K718jEcImPzAJjoU/3SAHczsnExFXL6A/e0OxVGFynZdGiTP2LQbLW
         wCxoy8voHln3DybrjFy2D7G88G6hTCgqW2/YWq3RGKVEDYT/CfdG8RD8Gw7N/iwYq6bR
         OlPoTpbf7rzPH7azCIdC3IyGug5AfL0yMM+H3b+gYPSnmN+p7+cD6s/2J43YXQzgZz2p
         ea6s/YsVhQjaySGaxnkM8c0THhZ01fTkuMrFGGs5eQIKp/cLNMvmd+9eOMqAcK8UQsQb
         M0+M+bdipm94ZdavUyVQDr66Og2gZkiphVIaxHwIWQezvtt5n8pIJqFaIIGUqQccRSXL
         GT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791742212; x=1792347012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FJfsAWa2Tg0a7RAVRgcsQ8tBnMmp27HrWsnWumyp4U=;
        b=owGNuL0jtDUdADEPmrQ0qfvMp2oTT/BjUR9iYHI9u7fT3R92Ii37AjGQvnjOAwnn5z
         +1Mg3ec9HuvHsoLsI+w2mwLTgA+OlbHDeLDmF7HWN7Zyq6cmqjyndcYdye3Q6nL8ezP/
         lXwJwPkeadnaejEQSHr1jkxfZq+EJXoXJ6gBTg92GF1oHarKocG3YgdnLTqk1fRPtkGH
         k4WgZx4z2fjh7KTJ5JCPRkyJVp5RZa4O+G/Dzh7kjQw7mMZfibZKWQzOY+oSjXmWrnUS
         P9q3IJSbH5fluvxoFB0ykQKVzk59SCsJ3EhU962Ey6ZdGcAH4X8gZsKzUeCYqiJV3NhI
         XvsQ==
X-Gm-Message-State: AFq9FYK8lxvmouxtPeIf39Rup0L5qN0qgnrMv4gRLczx5KTGrCOLFqg+
	5IHSy4evfFPkAGD2TElcOSTqbTB4Mo3pa8SJWZGO9zGYiwEQbrpXRnnW
X-Gm-Gg: AYBFou3zrmWfcY7Q5LUbAu+fmlbuxjj8UAeegUMH1UmP9snRaaFxKSKQQaOCzE2H3wD
	Em0OE1FbComvLxg2/qjzsDHxS9CoFGDVmUkCDrPZx6rj6pYPt46eZV2+Gxj4yWFUgnaJEZuZChn
	BPbTxA1sXk1LPogWs3IeDxluYeIdc3E7Lp4j4tBU8txbWamAcAc5CP7/PwlnHa7wS759ZvkvOS3
	tkoNojGLTkPuuYqMckFgfuaOYB9ICp4Tfr+QCsTy82iNv+8xr+RpvqkbjphwAY6ldmV41j/kCRn
	1EtCdIRAdYiVr9BrTDa4yxcTEwnG1WAdqqTSFQu30Y2b9O0vkz4t1nOwEZVggAX+dJYnvi9TaMK
	Pm1vxLzdcfhQ43Ux0j/NaHs22xwlHxryUgr8wi/t3JBEn2AN+55LJAMeIMYCQXcRnV8EoWAa4Fv
	dS+8VTLg+qmC9Nt7d5YXqHLf+poaO4oGjH/XEQXOFH+r00bErf4ZWXqdcLjtHKtzFmVfTToM7TD
	kSbjlspjYFu6tH6RUae
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c34e9fe8db4mr54546766b.28.1791742211560;
        Sun, 11 Oct 2026 11:10:11 -0700 (PDT)
Received: from fedora (staticline41082.toya.net.pl. [85.89.166.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm3542866b.23.2026.10.11.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:10:11 -0700 (PDT)
From: Konrad Papaj <konrad.papaj@gmail.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Papaj <konrad.papaj@gmail.com>
Subject: [RFC PATCH] media: cvs: do not announce host privacy LED ownership on SVP7xxx
Date: Sun, 11 Oct 2026 20:08:30 +0200
Message-ID: <20261011180830.9799-1-konrad.papaj@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The quirk entry for the Synaptics SVP7xxx bridge (06CB:0701) sets
ICVS_HOST_PRIV_CTRL, which makes cvs_configure_dev_caps() add
ICVS_HOST_ID_PRIVACY_LED to the host id sent to the CVS firmware via
ICVS_SET_DEV_HOST_ID, i.e. it tells the device that the host gates the
privacy LED.

On the Dell Pro 14 Plus PB14250 the host has no privacy LED to gate:

 - the only enabled INT3472 device (INT3472:0c) belongs to the IR
   camera HIMX1092:00 and registers HIMX1092_00::ir_flood_led.  The
   remaining INT3472 devices are disabled, so the LED lookup done by
   v4l2_subdev_get_privacy_led() finds nothing for the RGB sensor;

 - the _CRS of \_SB.PC00.CVSS declares four GPIO resources (wake
   0x00D4, rst 0x0037, req 0x0000, resp 0x0007), none of which is an
   LED;

 - the platform's own privacy hardware reports [Camera Shutter]
   [unsupported].

The indicator therefore stays dark for the whole duration of RGB
streaming.  The firmware stops driving it once the host claims it, and
the host has nothing to drive.

Measured on the affected machine with 30 s of continuous streaming,
800 frames captured in both runs:

  quirks 0x7a (ICVS_HOST_PRIV_CTRL set)      indicator dark
  quirks 0x3a (ICVS_HOST_PRIV_CTRL removed)  indicator lit

Camera operation is unaffected: the sensor and CVS bind as before, the
media graph is unchanged and libcamera still enumerates the camera.

This is sent as an RFC because the quirk is keyed on the bridge
VID/PID, while the presence of a host-driven privacy LED is a board
property.  Dropping the flag unconditionally would regress designs
that use the same Synaptics bridge and do wire the LED to the host.
Announcing ICVS_HOST_ID_PRIVACY_LED only when a host-side LED is
actually available, or keying this flag on DMI, both look more correct
to me, but I do not know which Intel intends.

Signed-off-by: Konrad Papaj <konrad.papaj@gmail.com>
---
Tested on:
  Dell Inc. Dell Pro 14 Plus PB14250, BIOS 2.7.4
  Intel(R) Core(TM) Ultra 7 265U
  IPU6 8086:7d19, subsystem 1028:0ce8
  Synaptics SVP7500 bridge, USB 06cb:0701, bcdDevice 84.95
  CVS INTC10E0:00 on i2c-15, sensor OVTI05C1:00 (OV05C10) on i2c-16
  kernel 7.2.8-200.fc44.x86_64 (Fedora 44)
  libcamera 0.7.1, "simple" pipeline handler + ipa_soft_simple

Disclosure: the OV05C10 sensor driver is not upstream, so the sensor on
this machine is driven by an out-of-tree ov05c10 module built from
intel/ipu6-drivers with local fixes.  The LED behaviour reported here is
independent of that: the indicator is gated by CVS firmware based on
ICVS_SET_DEV_HOST_ID, and the quirk flag was the only variable changed
between the two measurements in the commit message.

Reproduction:
  1. boot with the in-tree intel_cvs, confirm "Quirks: 0x7a" in dmesg
  2. stream from the RGB camera for 30 s, indicator stays dark
  3. apply this patch, confirm "Quirks: 0x3a"
  4. repeat the 30 s stream, indicator is lit for the duration

 drivers/media/i2c/cvs/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index fe9e59a..fafa2dc 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -70,7 +70,6 @@ static const struct icvs_device_quirk cvs_quirk_table[] = {
 	},	/* Lattice NX33 */
 	{ 0x06CB, 0x0701, ICVS_SKIP_FW_RESET |
 			  ICVS_HOST_SENSOR_PWR_CTRL |
-			  ICVS_HOST_PRIV_CTRL |
 			  ICVS_FW_BUF_SIZE_256 |
 			  ICVS_FW_HEADER_SIZE_256
 	},	/* Synaptics SVP7xxx */
-- 
2.56.0

