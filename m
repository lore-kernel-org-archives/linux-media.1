Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9F39769D
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199738; cv=none; b=h/Fvokvnbxu7yxPR5CDEuOy8h1/5UXCMhhgWaO9JsDqVuBTOhjHw6JXA66V4Rxxh61Mykgls9Ubc+5TmRtXAQ4DF0gq6uefIc6AYuIOFUmLdg2P9V9Q3Z7SMkua+7+rm1Qa/2MFRzpX8zPCv+yIsTYt2Squk7/3y7mmPOPnsV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199738; c=relaxed/simple;
	bh=pKKPWnil6aZM92FvO2EtFHScDtXvo48CLmoVvqXVCJ4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FHbA3tNySnxit6X8Viw4OiPqz71L0Nrn00gLIEpFOcWwz0eDf2lzUQFGVYpnQfQz5H5+FE63DJg+yoeJwBfC+nQ2bHsGq7lwZ6R2SaFmQIhjiFtcOyOkpaGnBblEsWksg25bWDlgnOvtlGckgYct3wpdX/+pOT/wAOr0CUk1Moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Zx6OsNUt; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Zx6OsNUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788199728; x=1788458928;
	bh=ud9Z8Bw5t6Z2OMZmDvaT+RhQGQ0VuInIaw0zRd2D2fs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Zx6OsNUtNSkxqlqsiku0oFstV92IetTWq6eIXCijHs/bsNOG2Ii/ZF03sCI9Bi0eR
	 9L1rQvRXrAz4doB8I7VMVMY9LvddgAK3jNjzFeErjzmxgfrguRqp+iGznZA2gk+3KC
	 nqw4YxjPTGyxyW6zk3FQOYGnTp7V1mr07e2qSLyaJC3YmvVXfdGtizi67YSNcxL2af
	 q6yFxxkHVlEH/nn3fGXOTDNWbX9/vIKNQxcC5Ea5fZMlrwGqzNrQFwsxKuJ3MiuSdi
	 0sasg3BtwL4trtOVegn68EzIBWBafCIm+MINHrGQGnd0aIl1w0EFbXurzFYHBdVHGZ
	 8eDWPrrvMLDOQ==
Date: Mon, 31 Aug 2026 18:08:42 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: int3472: the vendor GPIO type table, and four values that differ
Message-ID: <20260831180837.69000-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ec6d30b849da34829e65d0e8b9e493a639e056e3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Working on the cameras of a Surface Pro 11 (Lunar Lake) I pulled the
complete GPIO type table out of Intel's Windows camera driver,
iactrllogic64.sys. Ten of its twenty entries correspond to constants in
int3472.h. Six agree. Four do not, and I cannot tell from here which side
is right, so this is a question rather than a patch.

The table as the vendor driver indexes it:

  0x00 Reset          0x01 Enable         0x02 Strobe        0x03 Torch
  0x04 Flash          0x05 LedRear        0x06 LedFront      0x07 Power0
  0x08 Power1         0x09 Standby        0x0a WriteProtect  0x0b PowerEn
  0x0c Mclk           0x0d PrivateLED     0x0e Avdd          0x0f Core
  0x10 Handshake      0x11 HDMI_INT_IO    0x12 HDMIDetect    0x13 Reserved

Why I believe the indexing rather than a coincidence: five entries land
exactly on values the kernel arrived at independently. 0x00 Reset, 0x07
and 0x08 Power0 and Power1, 0x0b POWER_ENABLE against the vendor's
PowerEn, 0x0c CLK_ENABLE against Mclk, and 0x0d PRIVACY_LED against
PrivateLED. Five independent hits on a plain array index is not chance.

Where we disagree:

  value   int3472.h              vendor driver
  0x01    POWERDOWN              Enable
  0x10    DOVDD                  Handshake
  0x12    HANDSHAKE              HDMIDetect
  0x13    HOTPLUG_DETECT         Reserved

0x12 is the interesting one, because HANDSHAKE appears on both sides but
two slots apart. If the kernel's 0x12 came from observing a machine
rather than from documentation, one of these is off by the distance
between 0x10 and 0x12.

I have no machine that exercises any of the four, so I cannot test them.
If the kernel's values were derived from hardware that works, they are
the better evidence, and this table is Intel's internal naming for a
different set of platforms. If any of them were inferred, this is worth
a second look.

The ten values with no kernel constant may be useful when one turns up
in an unfamiliar _DSM: Strobe, Torch, Flash, LedRear, LedFront, Standby,
WriteProtect, Avdd, Core, HDMI_INT_IO. Two are already relevant
elsewhere. 0x02 Strobe is what an infrared illuminator uses on sensors
that route it through the sensor's own GPIOs, and 0x0e Avdd names a rail
int3472 already registers under that name from a different type.

Provenance: read out of the driver binary shipped in the Windows
DriverStore on my own machine. I am not attaching the binary or quoting
code from it.

Sergey Lebedev

