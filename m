Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB9526A81
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904665; cv=none; b=g0Z1JqwzSO0aIMLSsBWHQGIMv3n7T3rpu9F4OODv4VD1//WR04x1QZFXYKodQw+yIqkz0qPlRM22oiICIabt0q9tzODcA5Lypj6QHVLpnkMeV+NeBl2NMhx0cuVVLX9qU+JlWcNl7TTIHSoTFw+W4mJyD8jiKf2PpQZDXjtKSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904665; c=relaxed/simple;
	bh=J+AisZ3Sz6MrlsY1i2kbJokelTSfW+Ad0UKI2E/gXe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bvUl+BgM5IIAyhmbklU34Bn6lxyACTyjsecCpuhGnbNeDUCu48Rte7COh8JEPSYwZAfAdCLf3XJUFSGDZU1fyYmi0fAS43cFuem7j5QWyYvynoXLCyedC2aQlKgapq1eyY+YISImKRgecIj0TTITM2vm9851cM2Dw/h5BR/0CFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TRrwaCYz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TRrwaCYz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2829485f8f.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904659; x=1792509459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=TRrwaCYzQyrNVfQ788VFlBF4gFPUiNybOeBrmxz/Fd7fMEOoI8Zq3WqVA/TZTfio5y
         R/YgQ8rNBKPOBVljgF826aMjWB1aAJhwnfVWr1dPqeJCoTZC4NMkcwba7z8Hqb4w/mef
         1jfxIAP37qUmgIrVixUz+IFb5P2Jn6YMmY40AOAE56HkaTY1ZL4ylH+z9xjVzjZmDvaz
         YN/Y5g8Y9wKvbnYYcec2Hr6l97j1M+ZydC9O3/y69qTxyorQBH5knUWthxdyYB72gZxp
         vLaDlJ07LExKtNXmFo30j8rvn9YuleGqmv8rQ/0aPLKBEBwJ/nbJ4CloKE1SkII/dl5s
         n0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904659; x=1792509459;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=ftG1TI2ou3wXjd+lzV+iYunDuWiAl1h2/toClIxflcQEvlg2D0XGnYx4+ppM3e51UA
         oYxF2b1WzmKMCeHOMLmiSPp94VY2uLS4JCD/hDfxZSZzOi+oAK7h7tXsUtXaJ7mW7W0b
         aT/Tiof+ZpSl7zQXAHOwz/DCw4SslX5gG/YqJ9ruwhA84rH04j2iOBkC5+Rw/3q9z5FE
         tExC5yGnftsVrAByS9ejeHomoJaHTRJZJRzptwpqScCMt9q3BgyIE/2GbS/WBGPLy4K1
         sIJ7lzS8rfce9Z7C5JQX+qGd5xL9UPtXjuS0rnqo1sig9i0r5d3HMR9DQmpbhIWRbHvD
         PDmg==
X-Forwarded-Encrypted: i=1; AKwUvBy9aqPiFFE0AvbrdijizbZw8r/KevVSWAUf8xqNgSFu6FFH4EcUZwUS7l5he8yg6tageb9X/YJ2hmkSvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwrcGNxXVrqV0CxZifc6z44z8jSpjlGn5tp4+xBKTU2nhBNCEr
	rbK9SGCclWmuv89BklR5Lf/cKO3XUv4xCl6QrIFITxCuebaQb+YD3Q7RAxyxZVO+ONs=
X-Gm-Gg: AYBFou1fgBOdsU5qcvTt8UxjWP0108IHgIe+1Y+EzxYZU6JvUF0ugu/OhHn2onxHPQp
	4B6GGn6mc6M/bgOjlhLp/kR88TKrQTqRY77s2EvYTyJUeYSEIOeJEOu3zjcq4zMo/CKRUmZm6dP
	lV61zKwGYZhnG1ye+7/KpIHYcdD63qS+6pOKwJDbYYzr4PstbiiGiPst1rbjZr7/FYDorDeJp4S
	NZWL1kCU/oTRkVPoPO4S5nXCan5KSMy+WOoXpvbinAoZ7pYVnQ+u2y8xC1TZFtuBySpCzNI+WDU
	Plz/3eERbxt4TiLlBmPgbowdex8CZMPhoZ7d62Oyk/Eu0Zxg2ExAFXAehFeEfxmJ5/9tW1af4wy
	o6MYFVqEJHJPbkjb7mWN2Z6h/jaEXrfa6gwf+3+uPYS+UkaM0CXTPPwHcs/Nd8mweC1OP0foKBH
	boYBo0lHKeBhx3YsyGJgs3pNu9nJfMjga6BFOErwepp2hBJ4Bl0/Nnn8Ul9gLBchpMNom5F0pbS
	A9O7LqQe6dkrTMgbO2lflc7amLvJiCowvvSULKQbtHc0sOftQ==
X-Received: by 2002:a05:6000:2685:b0:48c:6724:b67d with SMTP id ffacd0b85a97d-48dbacddb35mr24003904f8f.38.1791904658905;
        Tue, 13 Oct 2026 08:17:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/13] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Tue, 13 Oct 2026 16:16:59 +0100
Message-Id: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtLzmoC/12MQQrCMBBFr1JmbSQJk1pdeQ9xkaSjnUWbMimBU
 nJ3g+DG1efBf++ATMKU4dYdIFQ4c1oa2FMHcfLLmxSPjcFq2+tBo5ppZK/y5qWdreqddyGiduG
 C0KSJ85Zk//aKafP4qe5fLUZpdTU0EJInxNddfF4Diewrn2Oa4Vlr/QCB4rpLogAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (13):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the minimum exposure
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   20 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2314 ++++++++++++++++++++
 6 files changed, 2368 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

