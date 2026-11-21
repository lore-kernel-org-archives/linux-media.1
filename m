Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262856;
	b=jEhXq7HFXbvACQ4LbYt+92JcGyKmbtwVhNLrSv8AqmSLBolFSNSwq/tWNIzBSim6qH0L
	 kCrBbGkeP/mhfp6xPKWAksjwM3TUpRAlreuXhFQTnl3A5RBf1M3iK3UfcH+OwDrDT6BEC
	 sgfMUAG0XCtopk5Dm2D/qafe37uIQ1nmWVpjeCNWYBsxYjD54qQuDgZaXWB1AbGOf48aG
	 YgD4BZW0EEf2Jmk5AD0ck2EOIqRfhmtM35WmA4wKXEmyTAtiziw6AMKuztAoVezWmwNed
	 3L+8qCsE6TZkL1dCnUNoVY+i9EeXGmxnROOktAvnyFHiZyaQY5YkfS9oYoxv5l8vLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
	b=P6Rd2u3zAaLBmZS05c4HSNwMEfdxD8q72G0r62ctMO29c0JzGg5wAK6R0pzd5aYofIEp
	 NfTX03mDX/8Tt3EsYjVDw9n7v/1BGl9ZuOJSajoSFCE661pEgGRMmkJkS4uuhIImnxcUJ
	 QVdgy+igydjLv4bFZBKNwgz1NE/hmU5JArzvEBcjO88JiLRvtbJ/1rwpvp3ZG2/3nty/X
	 B8IyVw6BPnhuaPcmp0+eBQjW2rYZsPEk+CxJnJ93PRAmKT0+npFF6Fg6vzaIoA/4CiAyE
	 bqloELqok7d6UU+Qtbi4ptuLjKZTElS9mThaXwhnprQL//kGD9lwmmzdAm9Y62BHRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/iC/+u4";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE89606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 12:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE89606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/iC/+u4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so2222642eec.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262855; x=1795867655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
        b=W/iC/+u4sbexX8u+LA+9NIN5buU7oIE+B0bubycTCbGmO73MWPoyvylZv/b0xVrOXo
         yss5JeU8VmYNeQYFG2Za5x25aM3a7cG5ckBd1H8SiUlEKMNC+8QsnE6gAvNFAzD2RaUO
         TQgBdS5HaWADSSNyFFjpi1MwUokycgQRzVsFOZUDCbREv6zxLdQ9RFXHm4+wG84kl+9B
         ht4ORATdX27zg/32a5PTwM0aG8faC4tSuKP6gfCiyvkYP5tnirIj2XmomoeNQB/TwsAM
         pqwzGFEllw/6ROGxnm5xTYRGpxH3TX4Hj8UEd20YgRynvZi+IfZ51pEtu/IrCtM8R5S2
         aC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262855; x=1795867655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNXURWCqSXapVzsGUK9QEOrrBFm2zUC7f4z9rd2YXi0=;
        b=FAgccY38zu+YNtdDg9726KyXYP7OYXTUgfaxWoDdMG7D2KwVy9qhVAG9sqQLv+mea+
         /PvZLiIP9tuCiXnRZ1MYXcKYq9SG2Nwgz+5Po9wbzln3s1C+sKhAI/RA9OHk9q8dVZB1
         yWNsLqOgX0uSFvzbDBdyu3TLh9ZfrxKGVvJnXquuULS5oAIzhTtEROVEgavWuejTCyXj
         53jfHY3K6Du6H7fDVhFgik++GUKSPXXe746ZnMhjzs2hc6lW7hLnNb3MEBvhu4y6/JXp
         XaoFg3KiUKcx0o/GU8R3JXCSOhd4kHWDGUs5VeW1nfmgRpSwxsiSZVNqT+3KeiWR0ioC
         Iydw==
X-Gm-Message-State: APuU4Z+aOKZpq0rwzwB6rA98XPz2UI+yxmSL5iQaFK7onSL4wvzmdGVA
	dbjQAxMpjE8VqK1GlKnxUlS4BaprfuiaZRLuzHjSotoaHuWsy7pqS4TgNZesqRKSuvs=
X-Gm-Gg: AZFdTZdYxATvAMjMEsjG9MHR1esJHGgNxYd+7DoNiu4twnZN+4Pkscq4ICvdDIbmKQE
	Ct1lbhMxPmrGCPT63CLhnJ0DDcZ7JufcvV4xlxHbPyjyweEJPn2vw/9C9CpaGI/sBEXDUinv1bj
	DCOjo8iKlDLcXWQyjS35nvGh4Xzmq3SbY+MoLdPIPkpNK1cXNA+B1PnQjBW6Kel0MIkUx5ank/l
	v4JKKiZAMlXaqmwqbaP706YddItVkGUkvfGxMnOubzpOEnd7vtzr+yQrG0ca8dL/62Hnl3Bs75X
	kfwAR3nsPOxbQhwr1PrZAURpG4KUbohmgUQdc30zg9ZoT2SX09z8FMEM365JtzIzlTiUW1q5aPL
	3p6ti1o1w/cnDQQzuGH7D+e0QFoT/9rMERrm+Y5cU6e4v47q9fqbJQS5p35akOWHcxKd2o8AM0E
	OBtPYrCr/9TzUywi+iFqdDB7bSaMCf2tfRXaKrkGYJlb2wGQDtI5Yv96lDgqN2rFHjWNs2//BQ+
	6UZollMhudtgcX50aB6gOo9h3C4faeh4jv1S014mA724S3ih6V+fqAMyjcBc0zEvLtuQtlPwQv1
	z60h83lG6a0si3Q2AmjWZwuNgVaWae6zCEGTXv0JHELAxzXqaH9bn1S1ijiOFzIkW0nt5weqPqP
	fta7yLYzI/izh/KyUiwo=
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr1648589eec.28.1795262855152;
        Sat, 21 Nov 2026 04:07:35 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm7465314eec.1.2026.11.21.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:07:34 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v2 0/2] media: i2c: Add Samsung S5K5E8YX camera sensor driver
Date: Sat, 21 Nov 2026 19:07:29 +0700
Message-ID: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
References: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree bindings and a V4L2 subdev driver for the Samsung S5K5E8YX
5MP RAW10 CMOS image sensor.

Based on initial work by Andrii Cherniavskyi, updated with standby GPIO
handling, crop selection rectangles, MAINTAINERS entry, and tested on
Xiaomi Redmi Note 4X (msm8953 / mido) using libcamera SoftISP.

Changes in v2:
- Rebase series onto linux-media/media-committers next branch so Kconfig,
  Makefile, and MAINTAINERS apply cleanly in Media CI.
- Update .set_fmt and .get_selection signatures for
  const struct v4l2_subdev_client_info *ci in media-next.
- Convert PM ops to DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr().
- Fix subdev finalize error message and remaining checkpatch --strict
  parenthesis line-break style checks.
- Place DT binding MAINTAINERS entry in patch 1/2 so each patch passes
  checkpatch --strict independently.

Andrii Cherniavskyi (2):
  dt-bindings: media: i2c: Add Samsung S5K5E8YX image sensor
  media: i2c: Add Samsung S5K5E8YX camera sensor driver

 .../bindings/media/i2c/samsung,s5k5e8yx.yaml  | 102 ++
 MAINTAINERS                                   |   9 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/s5k5e8yx.c                  | 972 ++++++++++++++++++
 5 files changed, 1094 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
 create mode 100644 drivers/media/i2c/s5k5e8yx.c

-- 
2.43.0

