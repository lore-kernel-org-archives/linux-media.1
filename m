Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B52394EB0
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347216; cv=none; b=UVdnPUYICKfLFLB3wYHeF6my+20FkPonn/ioQa5sXOf4efFxPjumK1d6c4TbxEJxkpvGPQZirCp3ExVdWTrbb12PyDfklytGdky+PcmDKSzxb91h8XKfp/cVWPpcbdCfTOeNsbJAYZ6WzwpQJmw62S5KbALE/+uEPNT1dq89Rqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347216; c=relaxed/simple;
	bh=EYTnu1KceFW5Cb5+/i8S3DiSv0ujcqX+YsFPbHqji3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rGkWVDG6Ia7vZ8C6u+e93A9XIBZgZEEpOfIkUnleUEp+ud7Up1bAtd5hJu5IgytflW/Ti7r3itk64eC7AZQs4O1nffgE8cisZTu36+S8vA5ZiYKXJD7v4NwSiyYjYuNo68wHf1e4PzAGZqVodWxWRSEdj+bw9p1Jho0CJeIgTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=zVY9N08z; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="zVY9N08z"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e99ef0902so83127885a.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 10:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785347209; x=1785952009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTJiwpTSlr5NWnPhcmhf965WkiPsRg8Mo8GP5pJqiS8=;
        b=zVY9N08zweCYrYuiRErV+ZZodjYiG9UlfIvqpq2uj60S3pkYxMXA74u5RaMvhFAtTN
         S1ErcVbsRmUY5HbfCm9N5q/r0oYWp5rM5bEu/XHz8sp05OhN2OQWl0BkoqCFtP5XJSSs
         O8whMd2P97Aa5TIiVAzZ1qaO3ol/3/9sKxkZFb1MVIe+1zgQWKiUjsRg9sTt3MDlDqHh
         9L34bX2nd/q7mbow9dKwTKqMqSyLfIC/mtdJ6ccW5lNnMxXQ7NPXWg8tggGZys07kMI9
         LbrYqEjlfA2J6QjE0Y/KMfAGvxA8rutQyOZyhWGFZW/q2BMjRrhZ1AGOzcz0vcB/i5US
         wagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347209; x=1785952009;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTJiwpTSlr5NWnPhcmhf965WkiPsRg8Mo8GP5pJqiS8=;
        b=GCyzbYAMrFGpx6crmhIMXXU/+6hyJEdu+B4XmzIecDS5aStNnqw4NbQQJ3B0nN/KBA
         Iy9TUWFqiNe3z5h5fucwmnzUQhmJOHF3wo+tpkifOk5BlFHLCPXtW7LAILdGbXwh7B7a
         je+84nitUQzQUyGoNLer1K4/CKxP9c5n6x4uMLEpE6A8SFjAkJ44sLpW6rHab1ewOi14
         QKQHrezrOC8bCQ33kt3z2NZWDO8KdHKVzEm/RtdSanEFuVv13shi41kXnRuyjIhNRVfK
         f5c8CIy0xQnWEweNQCOzYTxMge3hDNCLxL6UB7XtoakKgA2COg7bZ63FWzorKmpmrvGB
         +gxw==
X-Gm-Message-State: AOJu0YwQBofy4veRhmC5ED2DdHaAOLwnvgFX+do5f9tFoWETPNWUJyvx
	WukbeZDO7m0LMyZCOXgewLpi5xVDv8s1v6sofkMncFcRgSPM3FGcea6WiEEQq+blsZmpf4YSukH
	LFSn9fmKO1Yn0lmsn39VHMaXX34cigsSKuOmqR+R5E2pUrjrsPJTav/CYgBqCzR9+NLu5kPKWhu
	eBfl2LgzhCJK/Kn9K520t2GcCiuUjSU4Zn0azCSqmYawzMweEI/w==
X-Gm-Gg: AR+sD10OFuIWiGnA1tQMKHlNWgCq0KT9QO/gZI1/YbGkg4SzJsjj3pXfShelTD755Qb
	rBSeAAXXC6ATSMhRK+4umsy31aemEtlpKHORHf9fGhDu5hmQHJXBmF6/fRti/2s1PBix6yEcAFO
	EHDGPeN7Kfq6TsG/CWr0Wza4cEA7WQB6J3GbaEV/NfGZXu1Ig/IZd+UJs+zDAXlyxNpq+bij1y0
	SG2zWPz0ci4QEmwsiUfGauCnY3z/NGA8dAt1FCEkgmJsqxOPaVt8J3xDzcZTvllZcBmHUNqiovV
	zvGGs9CiecsWHyU0xY4WAd9fROhKeGQl6L1f7flTDLPLIITIOmK1/4JgyUaPhGfMfxkfqm7gp66
	ge8s6tiVz381vqHmOLXSjRxirGRPCDsmZQATZYOsE1gIviuyQrJiUMO7GD4XZlcYJxQL7NFEmwC
	WeHzA3Xs1gomDIvJ+4xnL1e2NsBuYRggW2jTGH6MuoDLi0VGkGiPXX3KygGzYAsBKcNk+coNfgu
	Pk3hMTwGAfQym4gijMFLz8QSL/snepSm1S3QjeJ1C1o2OKNoTxWkYtkLyATq2DcLNslRdYTfPcB
	c5ZKBswr9FqQdiatGsZZe4tKSd576Dk6ldRjFjCG1p8=
X-Received: by 2002:a05:620a:bd4:b0:92e:c117:5ee4 with SMTP id af79cd13be357-933026991a7mr802296585a.80.1785347208883;
        Wed, 29 Jul 2026 10:46:48 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::f163])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e73181e1sm216452885a.25.2026.07.29.10.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:46:48 -0700 (PDT)
From: Jake S <j@metarealtyinc.ca>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	ramshouriesh@gmail.com
Subject: [PATCH] media: ipu-bridge: Add Himax HM1092 IR sensor
Date: Wed, 29 Jul 2026 13:46:41 -0400
Message-ID: <20260729174641.1090498-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jake Steinman <j@metarealtyinc.ca>

The HM1092 is a 648x368 mono IR sensor used for face unlock on recent
Intel IPU6/IPU7 laptops, sitting behind a Synaptics or Intel vision
bridge. Without an entry here ipu-bridge builds the sensor endpoint with
no link-frequencies property, the driver's frequency validation rejects
every mode, and the sensor never binds.

Two frequencies are listed because the sensor is driven from different
external clocks depending on the platform, and the PLL registers are
programmed to match:

  0x030d (pre-divider), 0x030f (multiplier), link_freq = EXTCLK * m / p

  Dell, IPU7      EXTCLK 19.2 MHz, p=10, m=94  ->  180,480,000 Hz
  ASUS, Qualcomm  EXTCLK 24.0 MHz, p=12, m=90  ->  180,000,000 Hz

Both are the CSI-2 DDR clock, so the per-lane bit rate is twice the
value, 360.96 and 360 Mbit/s respectively, over one data lane.

Worth stating explicitly because published figures for this part have
been wrong: V4L2_CID_LINK_FREQ is the DDR clock, while the vendor mode
descriptors publish the per-lane BIT rate. Taking the descriptor value
verbatim gives 360,960,000, isys then configures the D-PHY for 721 Mbit/s
against a sensor transmitting 361, the clock lane toggles, and no frame
is ever framed. Halving it to the DDR clock is what produced the first
captured frames from this sensor on Linux.

The two platform values differ by 0.27%, which is within what the
sensor's PLL tolerates, but they are listed separately rather than
merged so each platform matches exactly what its firmware programs.

Depends on the HM1092 sensor driver, currently in review.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -50,6 +50,8 @@
  * Please keep the list sorted by ACPI HID.
  */
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* Himax HM1092 */
+	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
 	/* Himax HM11B1 */
 	IPU_SENSOR_CONFIG("HIMX11B1", 1, 384000000),
 	/* Himax HM2170 */
