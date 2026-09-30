Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759D374187
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753399; cv=pass; b=WmaLpy0gwGuDePKlp2H201/uhHi2eMo9ZADbBzNksS5zqvwLQv1kE0Zx/FnDwabsdzmOmp3IdoMolkvnm4sGvMFypyPoqtlWRAgbrVbTfmbPFzyOPCFhZyKBpglnfb8z34AfdjskYgdgmxVwo4HWAKCh4Nt6n7CvhQk/sBH3AkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753399; c=relaxed/simple;
	bh=/Wcd2mytXTEqZ/w1pAUjmt0ZW5t0/+JzxpynWpjmBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+rU+K+wvC4RRe1+Gwh3O4u6MPVn3sT0WjpMR1I5OeoyPlKlO6cO2QZrpJSaQxGrAwV+8QqomKV51MCOfmLerwJIlqweY0oqNPIJMGiHl9PWIHqPh7bKkZTokg3CwOcz1gc5Jae+PY5WyyroTiQRU/HA0xKZ8nRB/yDecm46DWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=JOgPVeI7; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="JOgPVeI7"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hvmsB1c2zz49Q3y;
	Wed, 30 Sep 2026 10:29:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790753390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OPCJPQMWwjLHCoSGeyyCJGlMY8PKqoic3fu771yuH8I=;
	b=JOgPVeI7dwAm7klEBwQqSPyvr60AgSv+UjDnTjQeQ1NkNDvmY+YgtNd/Hs5peKlFrvB4kc
	bBJTeuOy0AC3Nj+Fi2uG+Q+8yeODLGViif3T34owIyAQI2VpZzTKDXl6dnFjCKCK2NlupW
	iB7RM389KBSf8ia1BP7hcpicCeoC3w11ndJjicSqY+PrL+OEjBHAEref2JM1uWR2L3bOZp
	PnksR4WMn/q5Kx8x+j3xOJL5L+gFM3hEVlWHo74f+3EkfzrKK5cvjTc6oNnyH2jDkatgtQ
	bBNg4sLz6w+oYQi5g23gIw/C51IkW5yW0XKTaqLJ9B0pMnOPHxsaAqjPLntM3A==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1790753390;
	b=X/mKlItoNIxms8zJDsh36MFY+m2t7V+QnKVoenkqMwHGyIFRnWtcIyF/WxAgVR8u3HXLka
	Ft0TMpWslsYvxuiFdalJ2HuZfX2hRzPbN6oTuELnAS6KGqYwv//LyyhIPHiPbvgMRujgZD
	a7MGwchded7UWFVb5fTTz10Ik8BiCFK87TW7RFv77tl2Zmca19izzuwhhanVCj68g3JRxN
	wQzAKE+0dNzBoiIUZBiOAHtfFVmhnNIbVay9FoY/CA1y+4YmBKWDInnsk35qVlhlQlKIrP
	0rGWsDgjDGzfVY5tm1OMkun4rd5YuOMSqeGEwDA53y4Bav5JDjQVQqPc3nuIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1790753390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OPCJPQMWwjLHCoSGeyyCJGlMY8PKqoic3fu771yuH8I=;
	b=QLA4eC99Zt2Whc3FonbRU5BcLF1Qgaew1O9JKFR5RNh71tEhdTK5sfnS3SFpJXbMEpIxGe
	Uyz+bhchCaprmcaWMGpwu6CsQvzSe9O8Krwpz9DsK58WGiczr1OYSWWBY2PBvXF2jhiR7J
	BIDwB3UxUNF8CGYjNLELJJQfCDsef0+IOu5G4KczefQ/+7wcJ0hZzfoW/3Bu5wy8DMEyHx
	T2wGqwzfMPa8HyZdIyeaz/roa+AMRIdvMSsT+0ugESKEsB+mBRtr8R5DpCFwr0Houvqngc
	jsXzYorGED7NPkN4aPUPk/lsPT9irEVHif2PE91akmkKSjzBHHk5+oKpQa/l1w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3EE03634C58;
	Wed, 30 Sep 2026 10:29:48 +0300 (EEST)
Date: Wed, 30 Sep 2026 10:29:48 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 7.4] Maxim serdes driver
Message-ID: <ary6bAYm1NVMvvfo@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are the common Maxim serdes drivers supporting multiple devices. It
won't pass CI right now due to smatch issues, which have been addressed in
upstream smatch but there's no smatch release containing the fixes yet.

Please pull.


The following changes since commit 58348f64125e9a3e44d3abb275ca7f4e6c9641e5:

  media: ipu6: Support upstream sub-devices without get_frame_desc() (2026-09-26 21:21:21 +0300)

are available in the Git repository at:

  git@ssh.gitlab.freedesktop.org:linux-media/users/sailus.git tags/maxim-serdes-7.4-2

for you to fetch changes up to 16f26efc26c7a1b1c7c0e7db3f78d49d2cafd3f7:

  media: i2c: maxim-serdes: add MAX9296A driver (2026-09-30 09:17:32 +0300)

----------------------------------------------------------------
Maxim serdes drivers for 7.4:

The following deserializers are supported:
* MAX96712 (already exists in staging)
* MAX96714 (already exists)
* MAX96714F (already exists)
* MAX96714R (GMSL2)
* MAX96716 (GMSL2)
* MAX96724 (already exists as part of existing MAX96712 driver)
* MAX96724F (GMSL2)
* MAX96724R (GMSL2)
* MAX9296A (GMSL2)
* MAX96792A (GMSL3)

The following serializers are supported:
* MAX96717 (already exists)
* MAX9295A (GMSL2)
* MAX96793 (GMSL3)

----------------------------------------------------------------
Cosmin Tanislav (20):
      dt-bindings: media: i2c: max96717: add support for I2C ATR
      dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
      dt-bindings: media: i2c: max96717: add support for MAX9295A
      dt-bindings: media: i2c: max96717: add support for MAX96793
      dt-bindings: media: i2c: max96712: use pattern properties for ports
      dt-bindings: media: i2c: max96712: add support for I2C ATR
      dt-bindings: media: i2c: max96712: add support for POC supplies
      dt-bindings: media: i2c: max96712: add support for MAX96724F/R
      dt-bindings: media: i2c: max96714: add support for MAX96714R
      dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
      media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
      media: i2c: add Maxim GMSL2/3 serializer framework
      media: i2c: add Maxim GMSL2/3 deserializer framework
      media: i2c: remove MAX96717 driver
      media: i2c: maxim-serdes: add MAX96717 driver
      arm64: defconfig: disable deprecated MAX96712 driver
      staging: media: remove MAX96712 driver
      media: i2c: maxim-serdes: add MAX96724 driver
      media: i2c: remove MAX96714 driver
      media: i2c: maxim-serdes: add MAX9296A driver

Dumitru Ceclan (2):
      dt-bindings: media: i2c: max96712: add control-channel-port property
      i2c: atr: serialize attach/detach against bus transfers

Sakari Ailus (1):
      media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max9296a.yaml         |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml         |   74 +-
 .../bindings/media/i2c/maxim,max96714.yaml         |    5 +-
 .../bindings/media/i2c/maxim,max96717.yaml         |  163 +-
 .../userspace-api/media/mediactl/media-types.rst   |    9 +
 MAINTAINERS                                        |   10 +-
 arch/arm64/configs/defconfig                       |    1 -
 drivers/i2c/i2c-atr.c                              |   12 +
 drivers/media/i2c/Kconfig                          |   34 +-
 drivers/media/i2c/Makefile                         |    3 +-
 drivers/media/i2c/max96714.c                       | 1018 ------
 drivers/media/i2c/max96717.c                       | 1105 -------
 drivers/media/i2c/maxim-serdes/Kconfig             |   63 +
 drivers/media/i2c/maxim-serdes/Makefile            |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c          | 1461 +++++++++
 drivers/media/i2c/maxim-serdes/max96717.c          | 1703 ++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c          | 1347 ++++++++
 drivers/media/i2c/maxim-serdes/max_des.c           | 3347 ++++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h           |  157 +
 drivers/media/i2c/maxim-serdes/max_ser.c           | 2213 +++++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h           |  147 +
 drivers/media/i2c/maxim-serdes/max_serdes.c        |  413 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h        |  181 ++
 drivers/media/mc/mc-entity.c                       |   15 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/max96712/Kconfig             |   13 -
 drivers/staging/media/max96712/Makefile            |    2 -
 drivers/staging/media/max96712/max96712.c          |  486 ---
 include/uapi/linux/media.h                         |    1 +
 30 files changed, 11546 insertions(+), 2688 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
 delete mode 100644 drivers/media/i2c/max96714.c
 delete mode 100644 drivers/media/i2c/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

-- 
Kind regards,

Sakari Ailus
