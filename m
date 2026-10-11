Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E420457E70
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729860; cv=none; b=NuyF/ZmLdcD3sFAw23pDqSsdSX9N7W+C9q48s1UKAgNt73LDL8LKjLTKypfGL1+jvJ2R5B0RrNWM7ztlozb0qBN0FvsH3ABBqdoJG+DnM+RDRq5Wmepp0BUdArez/n2ba6ZyGYNBHOo2Y807k+/Nirei7UFrfsd+OXVzGbpRvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729860; c=relaxed/simple;
	bh=DkV1oZz0lhafn+kZuSuMqwZ6ELzkoGaebF2wEz4gCfY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UnBRvhjOh1MhPyRraJU8bzcVA/7VfOqGSi07UHucWRARRZo6n3mtMuZU5HZ/iDSbTdAkhgw/cpkycZqRofKp9UHSG5FFD+B/JI0+JGJgnWgGZfk73dbXB5ARAb6cePQsImc4mJpCAZhPdyEuPl84Bwku4jgFMC6j2HTOlKnRVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Y85P3iHV; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Y85P3iHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729855; x=1791989055;
	bh=DkV1oZz0lhafn+kZuSuMqwZ6ELzkoGaebF2wEz4gCfY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Y85P3iHVyyOd071Itu7Dgp8p5V9dQAdbGOf7SpEExt+kKG8eUqFsgj0XONel0Rb1h
	 +ZaKOq5PhiF969jGwR8ztF0whOuviSPdTZBM6pveTOkFiMVOVDtP1wDmnDy1xriOrc
	 i1Vnpm/PS9b2DQpQpZIv+BWtgPf5JpO1zES/lEUPEAMtewBFpvjryAz5a+2X8b1OQW
	 Z9yKMCW74vjhIUapkj93ZQG2Is+x5a5MwCTC602KK3Wkv2Pbd6KrhdsjlDO3okSKvx
	 imbP3jF/+buB+rnAm2kb0V79vxhOi+j71GZJg7vJp8b+pdIucN2Cp+NE56XWZsMpKU
	 XD0ocN2KaM03g==
Date: Sun, 11 Oct 2026 14:44:09 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <O9-1Zx4ykYAqVbmmKdXWlV8znkPlWAssbXfVk-y48EcfJr2jUXDnwGULXfz8OtsKEOKcw-kG_0cr9A0H-7c4e17mnb-CycgRuTmN9eg82B4=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 783a876fa847d79a24f70f25ac3822df84b8af4f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Register IPU4P in the PCI ID table after its required MMU, buttress,
firmware, ISYS, and CSI PHY support is present.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 include/media/ipu6-pci-table.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.=
h
index 7369d46621af..09b2ea58bc1f 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -27,6 +27,7 @@ static const struct pci_device_id ipu6_pci_tbl[] =3D {
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
+=09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU4P) },
 =09{ }
 };
=20
--=20
2.55.0


